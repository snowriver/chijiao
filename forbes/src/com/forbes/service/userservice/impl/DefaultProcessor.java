package com.forbes.service.userservice.impl;

import java.text.SimpleDateFormat;
import java.util.*;

import com.she.aop.newsfeed.MessageGeneratorInf;
import com.she.hibernate.*;
import com.she.hibernate.dao.*;
import com.she.service.newsfeed.NewsFeedManager;
import com.she.util.Constant;


public class DefaultProcessor implements IProcessor{
	private UsrAccountDAO usrAccountDAO;
	private OrdServiceDAO ordServiceDAO;
	private UserServiceDAO userServiceDAO;
    private UserServiceLogDAO userServiceLogDAO;
    private MessageGeneratorInf messageGeneratorInf;
    private UsrClientEstBoxDAO usrClientEstBoxDAO;
    
    
	public UsrClientEstBoxDAO getUsrClientEstBoxDAO() {
		return usrClientEstBoxDAO;
	}
	public void setUsrClientEstBoxDAO(UsrClientEstBoxDAO usrClientEstBoxDAO) {
		this.usrClientEstBoxDAO = usrClientEstBoxDAO;
	}
	public MessageGeneratorInf getMessageGeneratorInf() {
		return messageGeneratorInf;
	}
	public void setMessageGeneratorInf(MessageGeneratorInf messageGeneratorInf) {
		this.messageGeneratorInf = messageGeneratorInf;
	}
	public UserServiceDAO getUserServiceDAO() {
		return userServiceDAO;
	}
	public void setUserServiceDAO(UserServiceDAO userServiceDAO) {
		this.userServiceDAO = userServiceDAO;
	}
	public UserServiceLogDAO getUserServiceLogDAO() {
		return userServiceLogDAO;
	}
	public void setUserServiceLogDAO(UserServiceLogDAO userServiceLogDAO) {
		this.userServiceLogDAO = userServiceLogDAO;
	}
	public void saveUserService(UserService  userService){
    	userServiceDAO.merge( userService );
    }
    public void saveUserServiceLog(UserServiceLog  userServiceLog){
    	userServiceLogDAO.merge( userServiceLog );
    }
    
    public boolean checkBalance(String userId){
    	List <OrdService> serviceList = ordServiceDAO.findServiceByDealClass( this.getClass().getSimpleName() );
    	List <UsrAccount> usrAccount = usrAccountDAO.findByUserId( new Long( userId ) );
    	if( usrAccount==null || usrAccount.size() < 1 ){
    		return false;
    	}
    	if( serviceList !=null && serviceList.size() > 0 ){
    		OrdService service = serviceList.get(0);
    		UsrAccount uAccount = usrAccount.get(0);
    		if( service.getPrice().intValue()*100 > (uAccount.getBalance()+ uAccount.getPresentBalance())){
    			return false;
    		}
    	}
    	return true;
    	
    }
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
		List userServiceList = this.getUserServiceDAO().findUserServiceByClass(orderItem.getOrdOrder().getUserId().toString(), this.getClass().getSimpleName() );
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
			
			userService.setCmdParam("");
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
		
		UsrClient client = usrAccountDAO.getUsrClient(new Integer(userService.getUserId()));
		//news fedd to admin
		this.genNewsFeed("0", ""+Constant.VST_USR_SEC, "�Ñ�" + client.getLoginName() 
				+ "(" + client.getAlias() + ")" + "ӆُ�� "+orderService.getServiceNameCh()+" ����");
		//newsfeed to agent
		if( client.getAppointedAgentId() != null &&  client.getAppointedAgentId() > 0 ){
		    this.genNewsFeed(""+client.getAppointedAgentId(), ""+Constant.VST_USR_BA, "�Ñ�" + client.getLoginName() 
				+ "(" + client.getAlias() + ")" + "ӆُ�� "+orderService.getServiceNameCh()+" ����");
		}
		
	
	}
	public void process(UserService userService){
		
	}
	public void process(String userId){
		List <UserService> userServiceList = this.getUserServiceDAO().findUserServiceByClass(userId, this.getClass().getSimpleName() );
		for( UserService us : userServiceList ){
			if( us.getServiceTimes() != null && us.getServiceTimes() > 0 ){
				System.out.println("----------------process service");
				us.setServiceTimes( us.getServiceTimes() - 1 );
				this.saveUserService( us );
				//������־
				UserServiceLog userServiceLog = new UserServiceLog();
				userServiceLog.setUserId( new Integer(userId) );
				userServiceLog.setGenDate( new Date() );
				userServiceLog.setActionDesc( "��ʹ����1��" + us.getServiceDesc()+
						"����,߀ʣ��" + us.getServiceTimes() + "��ԓ����");
				this.saveUserServiceLog( userServiceLog );
			}
		}
	}
	protected boolean auth(String userId){
		//Dͻ�ֱ��ͨ����֤,Ĭ�Ͽ���ʹ�����з���
		UsrClient usrClient = usrAccountDAO.getUsrClient(new Integer(userId));
		if( usrClient != null && usrClient.getClientType().equals("D")){
			return true;
		}
		List <UserService> userServiceList = this.getUserServiceDAO().findUserServiceByClass(userId, this.getClass().getSimpleName() );
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
    public boolean auth(String userId,String param){
        //Dͻ�ֱ��ͨ����֤,Ĭ�Ͽ���ʹ�����з���
		UsrClient usrClient = usrAccountDAO.getUsrClient(new Integer(userId));
		if( usrClient != null && usrClient.getClientType().equals("D")){
			return true;
		}
		if( param == null ){
			return auth(userId);
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
    public void changeUserType( OrdOrderItem orderItem ,String clientType){
        //�ı��û�����
		Long userId = orderItem.getOrdOrder().getUserId();
		UsrClient client = usrAccountDAO.getUsrClient(userId.intValue());
		client.setClientType(clientType);
		client.setNeedAgent("Y");
		usrAccountDAO.saveClient(client);
    }
    public void genNewsFeed(
    		String targetUserId, String targetUserType,String msgBody){
    	if( targetUserId == null || targetUserId.length() < 1 ){
    		return ;
    	}
    	messageGeneratorInf.createNewsFeed("1", "0", ""+Constant.VST_USR_SYSTEM, ""+targetUserId, 
    			targetUserType, msgBody );
    }
	public OrdServiceDAO getOrdServiceDAO() {
		return ordServiceDAO;
	}
	public void setOrdServiceDAO(OrdServiceDAO ordServiceDAO) {
		this.ordServiceDAO = ordServiceDAO;
	}
	public UsrAccountDAO getUsrAccountDAO() {
		return usrAccountDAO;
	}
	public void setUsrAccountDAO(UsrAccountDAO usrAccountDAO) {
		this.usrAccountDAO = usrAccountDAO;
	}
	public String processArgs(Object [] args ){
		return "";
	}

}
