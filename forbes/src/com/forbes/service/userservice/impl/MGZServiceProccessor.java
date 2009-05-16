package com.forbes.service.userservice.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.she.hibernate.OrdOrderItem;
import com.she.hibernate.OrdService;
import com.she.hibernate.UserService;
import com.she.hibernate.UserServiceLog;

public class MGZServiceProccessor extends DefaultProcessor{
	public void initUsrService(OrdOrderItem orderItem){
		OrdService orderService = orderItem.getOrdService();
		Calendar cal = Calendar.getInstance();
		
		if( orderService.getPrice() <=0 ){
			return;
		}
	    
	    
	
	    UserService userService = new UserService();
		userService.setServiceDesc( orderService.getServiceNameCh() + " 服務內容:" +orderItem.getServiceDetail() );
		userService.setDealClass( this.getClass().getSimpleName() );
		userService.setServiceDate( orderItem.getServiceDate() );
		userService.setServiceTimes( 1 );	

		userService.setCmdParam("");
		userService.setServiceId( orderService.getId() );
		userService.setUserId( orderItem.getOrdOrder().getUserId().intValue() );
		
		this.saveUserService( userService );
		//产生日志
		
		
		UserServiceLog userServiceLog = new UserServiceLog();
		userServiceLog.setUserId( userService.getUserId() );
		userServiceLog.setGenDate( new Date() );
		
		SimpleDateFormat sf = new SimpleDateFormat();
		sf.applyPattern("yyyy年MM月dd日");
		userServiceLog.setActionDesc( "您申請了" + sf.format(orderItem.getServiceDate()) +"的"+
					orderService.getServiceNameCh() +
					"服務");
		
		this.saveUserServiceLog( userServiceLog );
		
	}
	public void process(UserService userService){
		
	}
	public void process(String userId){
		
	}
	public boolean auth(String userId){
        return true;
	}
    public boolean auth(String userId,String param){
		
		return true;
	}
}
