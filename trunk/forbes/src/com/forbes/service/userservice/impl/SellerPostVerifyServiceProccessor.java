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
	    //��
	   
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
	    //���մ���
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
		//���ղ�����
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
		//������־
		
		
		UserServiceLog userServiceLog = new UserServiceLog();
		userServiceLog.setUserId( userService.getUserId() );
		userServiceLog.setGenDate( new Date() );
		
		if( orderService.getServiceType() == 1 || orderService.getServiceType() == 5){
			
			userServiceLog.setActionDesc( "��ӆُ��" + orderService.getServiceCount()*orderItem.getCount() + "��" +
					orderService.getServiceNameCh() +
					"����,һ��߀��" + userService.getServiceTimes() + "��ԓ����");
		}
		else{
			SimpleDateFormat sf = new SimpleDateFormat();
			sf.applyPattern("yyyy��MM��dd��");
			String endDate = sf.format( userService.getServiceEndDate() );
			userServiceLog.setActionDesc( "��ӆُ��" + orderService.getServiceNameCh() + ",���ս�����" + endDate );
		}
		this.saveUserServiceLog( userServiceLog );
		
		UsrClient client = this.getUsrAccountDAO().getUsrClient(new Integer(userService.getUserId()));
		//news fedd to admin
		this.genNewsFeed("0", ""+Constant.VST_USR_SEC, "�Ñ�" + client.getLoginName() 
				+ "(" + client.getAlias() + ")" + "ӆُ�� "+orderService.getServiceNameCh()+" ����");
		//newsfeed to agent
		if( client.getAppointedAgentId() != null &&  client.getAppointedAgentId() > 0 ){
		    this.genNewsFeed(""+client.getAppointedAgentId(), ""+Constant.VST_USR_BA, "�Ñ�" + client.getLoginName() 
				+ "(" + client.getAlias() + ")" + "ӆُ�� "+orderService.getServiceNameCh()+" ����");
		}
		
	
	}
}
