package com.forbes.service.userservice.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.she.hibernate.OrdOrderItem;
import com.she.hibernate.OrdService;
import com.she.hibernate.UserService;
import com.she.hibernate.UserServiceLog;
import com.she.hibernate.UsrClient;
import com.she.util.Constant;

public class SellerPostVerifyServiceProccessor extends DefaultProcessor{
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
	    //服務存在
		if( userService != null ){
			
			if( orderService.getServiceType() == 1 || orderService.getServiceType() == 5){
				
				int leaveCnt = userService.getServiceTimes();
				userService.setServiceTimes( (leaveCnt + orderService.getServiceCount()*orderItem.getCount()));
			}
			else{
				
				if( cal.getTime().before( userService.getServiceEndDate() )){
					cal.setTime( userService.getServiceEndDate() );
				}
			    cal.add( timeFiled, orderService.getServiceCount()*orderItem.getCount());
			    userService.setServiceEndDate( cal.getTime() );
			}
			
			
		}
		//服務不存在
		else{
			
			userService = new UserService();
			userService.setServiceDesc( orderService.getServiceNameCh() );
			userService.setDealClass( this.getClass().getSimpleName() );
			if( orderService.getServiceType() == 1 || orderService.getServiceType() == 5){
				
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
		
		if( orderService.getServiceType() == 1 || orderService.getServiceType() == 5){
			
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
		
		UsrClient client = this.getUsrAccountDAO().getUsrClient(new Integer(userService.getUserId()));
		//news fedd to admin
		this.genNewsFeed("0", ""+Constant.VST_USR_SEC, "用戶" + client.getLoginName() 
				+ "(" + client.getAlias() + ")" + "訂購了 "+orderService.getServiceNameCh()+" 服務");
		//newsfeed to agent
		if( client.getAppointedAgentId() != null &&  client.getAppointedAgentId() > 0 ){
		    this.genNewsFeed(""+client.getAppointedAgentId(), ""+Constant.VST_USR_BA, "用戶" + client.getLoginName() 
				+ "(" + client.getAlias() + ")" + "訂購了 "+orderService.getServiceNameCh()+" 服務");
		}
		
	
	}
}
