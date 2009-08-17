package com.forbes.service.userservice.aop;

import java.lang.reflect.Method;
import java.util.HashMap;

import org.springframework.aop.MethodBeforeAdvice;

/*import org.acegisecurity.Authentication;
import org.acegisecurity.context.SecurityContextHolder;
import org.springframework.aop.MethodBeforeAdvice;

import com.she.exception.ChargeUserException;


import com.she.hibernate.User;
import com.she.hibernate.UsrClient;
import com.she.hibernate.UsrVisitArrangement;
import com.she.service.account.PaymentManager;
import com.she.service.ord.OrderManager;
import com.she.service.usrservice.UsrServiceProcessor;
import com.she.service.usr.UserManager;
import com.she.util.Config;*/

public class UserChargeBeforeMethod implements MethodBeforeAdvice{
	/*private UserManager userManager;
	private PaymentManager paymentManager;
	private OrderManager   orderManager;
    private UsrServiceProcessor usrServiceProcessor;
	public void before( Method method, Object[] args,Object target ) throws ChargeUserException{
		//System.out.println("-------------------charge aop before");
		HashMap chargeResource = Config.getAllFeeUrl();
		String dealClassStr = (String) chargeResource.get( method.getName() );
		if( dealClassStr!=null ){
			//System.out.println("=====+++++======before aop method:" + method.getName() + "  rs:" + dealClassStr );
			Authentication currentUser = SecurityContextHolder.getContext().getAuthentication();
	        if( currentUser != null ){
	            String userId = currentUser.getName();
	            User user = userManager.getUser( userId );
	            //普通用户才需要扣费
	            
	            if( user instanceof UsrClient ){
	            	boolean feeAuth = false;
	            	//UsrServiceProcessor serviceProccessor = ( UsrServiceProcessor )BeanFactory.getBean("usrServiceProcessorService");
	            	String [] feeClass = dealClassStr.split(",");
	            	//检查是否已经订购服务
	            	for( String fClass : feeClass ){
	        			
	        			if( usrServiceProcessor.auth(""+user.getId(), fClass,null) ){
	        				feeAuth = true;
	        				break;
	        			}
	        		}
                    //没有购买相应服务
	        		if( !feeAuth ){
	        			
	        			//检查余额是否夠支付
	        			boolean enoughBalance = usrServiceProcessor.checkBalance(""+user.getId(), feeClass[0]);
	        			//不夠支付
	        			if( !enoughBalance ){
	        				
	        				throw new ChargeUserException("NOT_ENOUGH_AMT");
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
		            	//UsrServiceProcessor serviceProccessor = ( UsrServiceProcessor )BeanFactory.getBean("usrServiceProcessorService");
		            	String [] feeClass = dealClassStr.split(",");
		            	//检查是否已经订购服务
		            	for( String fClass : feeClass ){
		        			
		        			if( usrServiceProcessor.auth( usrClientId, fClass,null) ){
		        				feeAuth = true;
		        				break;
		        			}
		        		}
                        //没有购买相应服务
		        		if( !feeAuth ){
		        			
		        			//检查余额是否夠支付
		        			boolean enoughBalance = usrServiceProcessor.checkBalance( usrClientId, feeClass[0]);
		        			//不夠支付
		        			if( !enoughBalance ){
		        				
		        				throw new ChargeUserException("NOT_ENOUGH_AMT");
		        			}
		        		}
	            	}
	            }
	        }
	        else{
	        	throw new ChargeUserException("NOT_FIND_USER");
	        }
		}
	}
	public OrderManager getOrderManager() {
		return orderManager;
	}
	public void setOrderManager(OrderManager orderManager) {
		this.orderManager = orderManager;
	}
	public PaymentManager getPaymentManager() {
		return paymentManager;
	}
	public void setPaymentManager(PaymentManager paymentManager) {
		this.paymentManager = paymentManager;
	}

	public UsrServiceProcessor getUsrServiceProcessor() {
		return usrServiceProcessor;
	}
	public void setUsrServiceProcessor(UsrServiceProcessor usrServiceProcessor) {
		this.usrServiceProcessor = usrServiceProcessor;
	}
	public UserManager getUserManager() {
		return userManager;
	}
	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}*/

}
