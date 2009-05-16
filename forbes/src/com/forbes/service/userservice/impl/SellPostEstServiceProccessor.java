package com.forbes.service.userservice.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.she.hibernate.OrdOrderItem;
import com.she.hibernate.OrdService;
import com.she.hibernate.UserService;
import com.she.hibernate.UserServiceLog;
import com.she.hibernate.UsrClient;
import com.she.hibernate.UsrClientEstBox;

public class SellPostEstServiceProccessor extends DefaultProcessor{
	public void initUsrService(OrdOrderItem orderItem){
		OrdService orderService = orderItem.getOrdService();
		Calendar cal = Calendar.getInstance();
		
		if( orderService.getPrice() <=0 ){
			return;
		}
	    int timeFiled = cal.MONTH;
	    //日
	   
	    if( orderService.getServiceType() == 2){
	    	timeFiled = cal.DAY_OF_MONTH;
	    }
	    else if ( orderService.getServiceType() == 2 ){
	    	timeFiled = cal.MONTH;
	    }
	    else if ( orderService.getServiceType() == 4 ){
	    	timeFiled = cal.YEAR;
	    }
	    String param =  orderItem.getServiceDetail();
	    
		List userServiceList = this.getUserServiceDAO().findUserServiceByClassAndParam(orderItem.getOrdOrder().getUserId().toString(), this.getClass().getSimpleName(),param );
	    UserService userService = null;
	    if( userServiceList!= null && userServiceList.size() > 0 ){
	    	userService = (UserService)userServiceList.get( 0 );
	    }
	    System.out.println("----------------------in on post service ------------");
	    //服務存在
		if( userService != null ){
			
			if( orderService.getServiceType() == 1){
				cal.setTime( userService.getServiceDate());
				if( cal.getTime().before( userService.getServiceDate() )){
					cal.setTime( userService.getServiceDate() );
				}
				int leaveCnt = userService.getServiceTimes();
				userService.setServiceTimes( (leaveCnt + orderService.getServiceCount()*orderItem.getCount()));
			}
			else{
			    cal.add( timeFiled, orderService.getServiceCount()*orderItem.getCount());
			    userService.setServiceEndDate( cal.getTime() );
			}
			
			
		}
		//服務不存在
		else{
			
			userService = new UserService();
			userService.setServiceDesc( orderService.getServiceNameCh() + " 放盤刊號：" + param );
			userService.setDealClass( this.getClass().getSimpleName() );
			if( orderService.getServiceType() == 1){
				
				userService.setServiceTimes( orderService.getServiceCount()*orderItem.getCount() );
			}
			else{
				cal.add( timeFiled, orderService.getServiceCount()*orderItem.getCount());
				userService.setServiceEndDate( cal.getTime() );
			}
			
			userService.setCmdParam(param);
			userService.setServiceId( orderService.getId() );
			userService.setUserId( orderItem.getOrdOrder().getUserId().intValue() );
		    
		}
		this.saveUserService( userService );
		//产生日志
		
		
		UserServiceLog userServiceLog = new UserServiceLog();
		userServiceLog.setUserId( userService.getUserId() );
		userServiceLog.setGenDate( new Date() );
		
		if( orderService.getServiceType() == 1){
			
			userServiceLog.setActionDesc( "您訂購了" + orderService.getServiceCount()*orderItem.getCount() + "次" +
					orderService.getServiceNameCh() +
					"服務,一共還有" + userService.getServiceTimes() + "次該服務");
		}
		else{
			SimpleDateFormat sf = new SimpleDateFormat();
			sf.applyPattern("yyyy年MM月dd日");
			String endDate = sf.format( userService.getServiceEndDate() );
			userServiceLog.setActionDesc( "您訂購了" + orderService.getServiceNameCh() + ",服務截至到" + endDate );
		}
		this.saveUserServiceLog( userServiceLog );
		
		this.verify(param, userService.getServiceEndDate() );
		
	}
	public boolean auth(String userId,String param){
        //D類客户直接通过验证,默认可以使用所有服务
		UsrClient usrClient = this.getUsrAccountDAO().getUsrClient(new Integer(userId));
		if( usrClient != null && usrClient.getClientType().equals("D")){
			return true;
		}
		if( param == null ){
			return false;
		}
		List <UserService> userServiceList = this.getUserServiceDAO().findUserServiceByClassAndParam(userId, this.getClass().getSimpleName(),param );
		System.out.println("---------------service auth list:" + userId + "  " +userServiceList.size());
		if( userServiceList!=null && userServiceList.size() > 0 ){
			UserService  us = userServiceList.get(0);
			if( (us.getServiceTimes()!=null && us.getServiceTimes() > 0) || 
					(us.getServiceEndDate() !=null && us.getServiceEndDate().after(new Date())) ){
				System.out.println("---------------return true:" + us.getServiceDesc() );
				return true;
			}
		}
		return false;
	}
	/**
	 * 根據參數獲取要記錄的數據
	 */
	public String processArgs(Object [] args ){
		UsrClientEstBox box = (UsrClientEstBox)args[0];
		
		return ""+box.getId();
	}
	
	
	/**
	 * 修改盘的签约信息
	 */
	public void verify( String param, Date deadline ){
		DateFormat format = new SimpleDateFormat("yyMMdd");
		Date now = new Date();
		
		UsrClientEstBox box = this.getUsrClientEstBoxDAO().findById(Long.parseLong(param));
		box.setActive("Y");
		box.setValidate("Y");
		box.setVerify("Y");
		box.setVerifyDate(new Date());
		box.setShowValidate("Y");
		box.setIsActing("Y");
		box.setCmdFlag("Y");
		box.setConfirmFlag("Y");
		box.setPostingKey("Y");
		box.setContract(format.format(now) + "-" + now.getTime() );
		box.setDeadline(deadline);
		this.getUsrClientEstBoxDAO().attachDirty(box);
		
		
	}

}
