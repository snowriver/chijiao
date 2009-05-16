package com.forbes.service.userservice.aop;

import java.util.*;

import java.lang.reflect.Method;

import org.springframework.aop.AfterReturningAdvice;

import com.forbes.hibernate.bean.UcMembers;
import com.forbes.service.account.PaymentManager;
import com.forbes.service.order.OrderManager;
import com.forbes.service.user.UserInfoManager;
import com.forbes.service.userservice.UserServiceProcessor;
import com.forbes.util.Config;




public class UserChargeAfterMethod implements AfterReturningAdvice{
	
	private UserInfoManager userInfoManager;
	private PaymentManager paymentManager;
	private OrderManager   orderManager;
    private UserServiceProcessor userServiceProcessor;
    
    
	public void afterReturning( Object returnValue,Method method,Object[] args,Object target ) throws ChargeUserException{
		
		//System.out.println("=====+++++======after aop method:");
		HashMap chargeResource = Config.getAllFeeUrl();
		String dealClassStr = (String) chargeResource.get( method.getName() );
		if( dealClassStr!=null ){
			//System.out.println("=====+++++======after aop method:" + method.getName() + "  rs:" + dealClassStr );
			Authentication currentUser = SecurityContextHolder.getContext().getAuthentication();
	        if( currentUser != null ){
	            String userId = currentUser.getName();
	            UcMembers user = userInfoManager.getUcMember( Integer.parseInt(userId) ); //userManager.getUser( userId );
	            //普通用户才需要扣费
	            
	            if( user instanceof UsrClient ){
	            	boolean feeAuth = false;
	            	//UsrServiceProcessor serviceProccessor = ( UsrServiceProcessor )BeanFactory.getBean("userServiceProcessorService");
	            	String [] feeClass = dealClassStr.split(",");
	            	//检查是否已经订购服务
	            	for( String fClass : feeClass ){
	        			
	        			if( userServiceProcessor.auth(""+user.getId(), fClass,null) ){
	        				feeAuth = true;
	        				break;
	        			}
	        		}
                    //没有购买相应服务
	        		if( !feeAuth ){
	        			//产生订单
	        			List <OrdService> serviceList = orderManager.findServiceByDealClass(feeClass[0]);
	        			String serviceId = (serviceList.get(0)).getId().toString();
	        			int payMethod = 3;//直接账户扣款
	        			OrdOrder order = orderManager.createOrder(payMethod, serviceId, args,userId, "2");
	        			
	        			//扣账户余额
	        			boolean payRs = paymentManager.updatePayByUser( order.getId().toString(), userId, "2", 0 );
	        			if( !payRs ){
	        				throw new ChargeUserException("CHARGE_NO_ENOUGH_AMT");
	        			}
	        		}
	            }
	            //其他用户放过不需要扣費
               //特殊情況特殊處理
	            else{
	            	//安排睇樓扣費
	            	if( method.getName().equals("addVisitArrangement") ){
	            		UsrVisitArrangement usrVisitArrangement = ( UsrVisitArrangement )args[0];
	            		String usrClientId = usrVisitArrangement.getUsrClient().getId().toString();
	            		boolean feeAuth = false;
		            	//UsrServiceProcessor serviceProccessor = ( UsrServiceProcessor )BeanFactory.getBean("userServiceProcessorService");
		            	String [] feeClass = dealClassStr.split(",");
		            	//检查是否已经订购服务
		            	for( String fClass : feeClass ){
		        			
		        			if( userServiceProcessor.auth( usrClientId, fClass,null) ){
		        				feeAuth = true;
		        				break;
		        			}
		        		}
                        //没有购买相应服务
		        		if( !feeAuth ){
		        			//产生订单
		        			List <OrdService> serviceList = orderManager.findServiceByDealClass(feeClass[0]);
		        			String serviceId = (serviceList.get(0)).getId().toString();
		        			int payMethod = 3;//直接账户扣款
		        			OrdOrder order = orderManager.createOrder(payMethod, serviceId, args,usrClientId, "2");
		        			
		        			//扣账户余额
		        			boolean payRs = paymentManager.updatePayByUser( order.getId().toString(), usrClientId, "2", 0 );
		        			if( !payRs ){
		        				throw new ChargeUserException("CHARGE_NO_ENOUGH_AMT");
		        			}
		        		
		        		}
                        //立即使用
	        			userServiceProcessor.process(usrClientId, feeClass[0] );
	            	}
	            }
	        }
	        else{
	        	throw new ChargeUserException("NOT_FIND_USER");
	        }
		}
	}

	public PaymentManager getPaymentManager() {
		return paymentManager;
	}
	public void setPaymentManager(PaymentManager paymentManager) {
		this.paymentManager = paymentManager;
	}
	public OrderManager getOrderManager() {
		return orderManager;
	}
	public void setOrderManager(OrderManager orderManager) {
		this.orderManager = orderManager;
	}



}
