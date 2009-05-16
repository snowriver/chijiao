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
	            //��ͨ�û�����Ҫ�۷�
	            
	            if( user instanceof UsrClient ){
	            	boolean feeAuth = false;
	            	//UsrServiceProcessor serviceProccessor = ( UsrServiceProcessor )BeanFactory.getBean("userServiceProcessorService");
	            	String [] feeClass = dealClassStr.split(",");
	            	//����Ƿ��Ѿ���������
	            	for( String fClass : feeClass ){
	        			
	        			if( userServiceProcessor.auth(""+user.getId(), fClass,null) ){
	        				feeAuth = true;
	        				break;
	        			}
	        		}
                    //û�й�����Ӧ����
	        		if( !feeAuth ){
	        			//��������
	        			List <OrdService> serviceList = orderManager.findServiceByDealClass(feeClass[0]);
	        			String serviceId = (serviceList.get(0)).getId().toString();
	        			int payMethod = 3;//ֱ���˻��ۿ�
	        			OrdOrder order = orderManager.createOrder(payMethod, serviceId, args,userId, "2");
	        			
	        			//���˻����
	        			boolean payRs = paymentManager.updatePayByUser( order.getId().toString(), userId, "2", 0 );
	        			if( !payRs ){
	        				throw new ChargeUserException("CHARGE_NO_ENOUGH_AMT");
	        			}
	        		}
	            }
	            //�����û��Ź�����Ҫ���M
               //������r����̎��
	            else{
	            	//�������ǿ��M
	            	if( method.getName().equals("addVisitArrangement") ){
	            		UsrVisitArrangement usrVisitArrangement = ( UsrVisitArrangement )args[0];
	            		String usrClientId = usrVisitArrangement.getUsrClient().getId().toString();
	            		boolean feeAuth = false;
		            	//UsrServiceProcessor serviceProccessor = ( UsrServiceProcessor )BeanFactory.getBean("userServiceProcessorService");
		            	String [] feeClass = dealClassStr.split(",");
		            	//����Ƿ��Ѿ���������
		            	for( String fClass : feeClass ){
		        			
		        			if( userServiceProcessor.auth( usrClientId, fClass,null) ){
		        				feeAuth = true;
		        				break;
		        			}
		        		}
                        //û�й�����Ӧ����
		        		if( !feeAuth ){
		        			//��������
		        			List <OrdService> serviceList = orderManager.findServiceByDealClass(feeClass[0]);
		        			String serviceId = (serviceList.get(0)).getId().toString();
		        			int payMethod = 3;//ֱ���˻��ۿ�
		        			OrdOrder order = orderManager.createOrder(payMethod, serviceId, args,usrClientId, "2");
		        			
		        			//���˻����
		        			boolean payRs = paymentManager.updatePayByUser( order.getId().toString(), usrClientId, "2", 0 );
		        			if( !payRs ){
		        				throw new ChargeUserException("CHARGE_NO_ENOUGH_AMT");
		        			}
		        		
		        		}
                        //����ʹ��
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
