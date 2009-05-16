package com.forbes.service.account.impl;
/*import com.forbes.hibernate.bean.OrdOrder;
import com.forbes.hibernate.bean.OrdAgentBook;
import com.forbes.hibernate.bean.UserAccount;
import com.forbes.hibernate.bean.OrdService;
import com.forbes.hibernate.bean.OrdOrderItem;
import com.forbes.hibernate.bean.UserPaymentLog;
import com.forbes.hibernate.bean.dao.OrdOrderDAO;
import com.forbes.hibernate.bean.dao.UserPaymentLogDAO;
import com.forbes.hibernate.bean.dao.UserAccountDAO;
import com.forbes.hibernate.bean.dao.OrdAgentBookDAO;
import com.forbes.service.account.PaymentManager;
import com.forbes.service.newsfeed.NewsFeedManager;
import com.forbes.service.usrservice.UsrServiceProcessor;*/

import java.util.*;

import com.forbes.hibernate.bean.UserAccount;
import com.forbes.hibernate.bean.UserOrder;
import com.forbes.hibernate.bean.UserPaymentLog;
import com.forbes.hibernate.dao.UserAccountDAO;
import com.forbes.hibernate.dao.UserOrderDAO;
import com.forbes.hibernate.dao.UserPaymentLogDAO;
import com.forbes.service.account.PaymentManager;
import com.forbes.service.newsfeed.NewsFeedManager;
import com.forbes.service.userservice.UserServiceProcessor;
import com.forbes.util.Config;
import com.forbes.util.Constant;
import com.forbes.util.Pager;


public class PaymentManagerImpl implements PaymentManager{
	
	private UserOrderDAO userOrderDAO;
	private UserPaymentLogDAO userPaymentLogDAO;
	private UserAccountDAO  userAccountDAO;

	private UserServiceProcessor userServiceProcessor;
	
	private NewsFeedManager   newsFeedManager;
	
	public NewsFeedManager getNewsFeedManager() {
		return newsFeedManager;
	}
	public void setNewsFeedManager(NewsFeedManager newsFeedManager) {
		this.newsFeedManager = newsFeedManager;
	}
	
	public List getUserPayLogByPage(Pager pager){
        pager.setTotoalCnt(userPaymentLogDAO.getPaymentLogCount());
		
		return userPaymentLogDAO.findPaymentLog((pager.getCurPage() -1)*pager.getCntOfPage(), pager.getCntOfPage());
	}
	public List searchUserPayLogByPage(String logName,String name,String begDate,String endDate,Pager pager){
		
        pager.setTotoalCnt(userPaymentLogDAO.searchPaymentLogCount(logName, name, begDate, endDate) );	
		return userPaymentLogDAO.searchPaymentLog(logName, name, begDate, endDate,(pager.getCurPage() -1)*pager.getCntOfPage(), pager.getCntOfPage());
		
	}
	public List getUsrPayLogByUsr(String userId,Pager pager){
        pager.setTotoalCnt(userPaymentLogDAO.getPaymentLogCountByUser(userId));
		
		return userPaymentLogDAO.findPaymentLogByUser(userId,(pager.getCurPage() -1)*pager.getCntOfPage(), pager.getCntOfPage());
	}
	public List getUsrPayLogByAgent(String agentId, Pager pager){
        pager.setTotoalCnt(userPaymentLogDAO.getPaymentLogCountByAgent(agentId));
		
		return userPaymentLogDAO.findPaymentLogByAgent(agentId,(pager.getCurPage() -1)*pager.getCntOfPage(), pager.getCntOfPage());
	}
	public List searchUsrPayLogByAgent(String logName,String name,String begDate,String endDate,String agentId, Pager pager){
        pager.setTotoalCnt(userPaymentLogDAO.searchPaymentLogCountByAgent(logName, name, begDate, endDate,agentId) );	
		return userPaymentLogDAO.searchPaymentLogByAgent(logName, name, begDate, endDate, agentId,(pager.getCurPage() -1)*pager.getCntOfPage(), pager.getCntOfPage());
	}
	public List searchUsrByPage(String usrClass,String lgName,String realName, String phone,Pager pager){
        pager.setTotoalCnt(userAccountDAO.searchUsrCount(usrClass,lgName,realName,phone));
		
		return userAccountDAO.searchUsrByPage(usrClass,lgName,realName,phone, (pager.getCurPage() -1)*pager.getCntOfPage(), pager.getCntOfPage());
	}
	public List getUsrByPage(String usrClass,Pager pager){
        pager.setTotoalCnt(userAccountDAO.getUsrCount(usrClass));
		
		return userAccountDAO.getUsrByPage(usrClass, (pager.getCurPage() -1)*pager.getCntOfPage(), pager.getCntOfPage());
	}
	public List getOderList(String status,Pager pager){

		pager.setTotoalCnt(userOrderDAO.getOderCount(status));
		
		return userOrderDAO.findOrderByPage(status,pager);
	}
	/**
	 * 搜尋訂單
	 */
	public List searchOrder( String logName,String name,String begDate,String endDate,String status,Pager pager){
        pager.setTotoalCnt(userOrderDAO.searchOderCount(logName, name, begDate, endDate, status));
		return userOrderDAO.searchOrderByPage(logName, name, begDate, endDate, status, pager);
	}
	public List getOderList(String status,String userId,String userType,Pager pager){
        pager.setTotoalCnt(userOrderDAO.getOderCount(status,userId,userType));
		return userOrderDAO.findOrderByPage(status,pager,userId,userType);
	}
	public int getBalance(String userId, String userType){
		
	    UserAccount account = getUserAccount(userId, userType);
	    if( account.getBalance() == null ){
	    	account.setBalance(0);
	    	userAccountDAO.merge(account);
	    }
	    if ( account.getPresentBalance() == null ){
	    	account.setPresentBalance(0);
	    	userAccountDAO.merge(account);
	    }
		return account.getBalance().intValue() + account.getPresentBalance();
	}
	public UserAccount getUserAccount(String userId, String userType){
		List  accountLst = userAccountDAO.findByUserIdAndType(userId, userType);
		if( accountLst.size() > 0  ){
			UserAccount account = (UserAccount)accountLst.get(0);
			return account;
		}
		else{
			String presentAmt = Config.getProperty("PRESENT_AMT", "80");
			newsFeedManager.createNewsFeed("1", "1111", ""+Constant.VST_USR_SEC, userId, 
					""+Constant.VST_USR_BER, "你已獲贈價值HK$80的Smartxz錢幣。" );
			return userAccountDAO.initAccount(userId, new Integer(presentAmt)*100);
		}
	}

	public boolean updatePayByUser(String orderId,String userId,String userType,int amount){
		UserOrder order = userOrderDAO.findById( new Long(orderId) );
        if( order.getTotal() <=0 ){
        	order.setTotal( amount );
        }
		UserAccount account = getUserAccount(userId,userType);
		
		if(account==null || order.getTotal() > (account.getBalance() + account.getPresentBalance())){
			return false;
		}
		//需要处理的订单不能扣費
		if( order.getStatus() != 0  ){
			return false;
		}
		int bamount = 0;
		int presenAmount = 0;
		if( order.getTotal() > account.getPresentBalance() ){
			presenAmount = account.getPresentBalance();
			bamount = order.getTotal() - presenAmount;
		    account.setPresentBalance(0);
		    account.setBalance( account.getBalance()-bamount );
		}
		else{
			presenAmount = order.getTotal();
			account.setPresentBalance( account.getPresentBalance()-order.getTotal() );
			
		}
		userAccountDAO.save( account );
		order.setStatus((short)1);
		userOrderDAO.save(order);
		updateService(order);
		
		UserPaymentLog usrPayment = new UserPaymentLog();
		usrPayment.setOrdOrder( order );
		usrPayment.setPayMethod((short)order.getPayMethod());
		usrPayment.setCheckNo("");
		usrPayment.setAmount( bamount*-1 );
		usrPayment.setBalance(account.getBalance());
		usrPayment.setPresentAmount(presenAmount * -1);
		usrPayment.setPresentBalance( account.getPresentBalance() );
		usrPayment.setStatus((short)1);
		usrPayment.setPayDate( Calendar.getInstance().getTime() );
		usrPayment.setRemark( "" );
		usrPayment.setAccountId( new Long(userId) );
		userPaymentLogDAO.save(usrPayment);
		
        //扣費成功,創建服務
		System.out.println("=====22222===****************** " + userServiceProcessor.getClass().getSimpleName() );
		Set <OrdOrderItem> ordItems = order.getOrdOrderItems();
		System.out.println("=====22222===****************** orsize: " +  ordItems.size() );
		for( OrdOrderItem ordItem : ordItems ){
			System.out.println("========****************** " + userServiceProcessor.getClass().getSimpleName() );
			userServiceProcessor.initUsrService( ordItem );
		}
		
		return true;
		
	}
	/**
	 * 收款和订单不符合的时候需要修改订单
	 * @param orderId
	 * @param userId
	 * @param userType
	 * @param amount
	 * @return
	 */
	public boolean verifyOrderByAccount(String orderId,String userId,String userType,int amount){
		
		return false;
	}

	public void updateService(OrdOrder order ){
		Set set = order.getOrdOrderItems();
		Iterator it = set.iterator();
		while( it.hasNext() ){
			OrdOrderItem orderItem = (OrdOrderItem)it.next();
			OrdService orderService = orderItem.getOrdService();
			int iService = orderService.getServiceType();
			
			//upateAuthInf(orderItem,order.getUserId().toString(),order.getUserType().toString());
			
		}
	}
	/**
	 * 用戶賬戶上充值
	 */
	public void rechargeUserByAccount(String orderId,String amount,String checkNo,String remark,short rechargeType){
		OrdOrder order = userOrderDAO.findById( new Long(orderId) );
		//List  accountLst = userAccountDAO.findByUserIdAndType(order.getUserId().toString(), order.getUserType().toString());
		UserAccount account = this.getUserAccount(order.getUserId().toString(), order.getUserType().toString());
		account.setBalance( account.getBalance() + Integer.parseInt(amount)*100 );
		userAccountDAO.save( account );
		
		UserPaymentLog usrPayment = new UserPaymentLog();
		usrPayment.setOrdOrder( null );
		usrPayment.setPayMethod(rechargeType);
		usrPayment.setCheckNo(checkNo);
		usrPayment.setAmount( new Integer(amount)*100 );
		usrPayment.setBalance(account.getBalance());
		usrPayment.setPresentAmount(0);
		usrPayment.setPresentBalance( account.getPresentBalance() );
		usrPayment.setStatus((short)1);
		usrPayment.setPayDate( Calendar.getInstance().getTime() );
		usrPayment.setRemark( remark );
		usrPayment.setAccountId( order.getUserId() );
		userPaymentLogDAO.save(usrPayment);
		
		
		//recharge(order.getUserId().toString(),order.getUserType().toString(),Integer.parseInt(amount)*100 );

	}
	public void adminChangeUserAccount(String userId,String userType,short payMethod,String amount,String checkNo,String remark){
		
		
		
		
		
		//recharge(userId,userType.toString(),Integer.parseInt(amount)*100 );
		UserAccount account = this.getUserAccount(userId, userType);
		account.setBalance( account.getBalance() + Integer.parseInt(amount)*100 );
		userAccountDAO.save( account );
		
		UserPaymentLog usrPayment = new UserPaymentLog();
		usrPayment.setOrdOrder( null );
		usrPayment.setPayMethod(payMethod);
		usrPayment.setCheckNo(checkNo);
		usrPayment.setAmount( new Integer(amount)*100 );
		usrPayment.setBalance(account.getBalance());
		usrPayment.setPresentAmount(0);
		usrPayment.setPresentBalance( account.getPresentBalance() );
		usrPayment.setStatus((short)1);
		usrPayment.setPayDate( Calendar.getInstance().getTime() );
		usrPayment.setRemark( remark );
		usrPayment.setAccountId( new Long(userId) );
		userPaymentLogDAO.save(usrPayment);

	}
public void adminChangeUserPresentAccount(String userId,String userType,short payMethod,String amount,String checkNo,String remark){
		
		
		
		
		
		//recharge(userId,userType.toString(),Integer.parseInt(amount)*100 );
		UserAccount account = this.getUserAccount(userId, userType);
		account.setPresentBalance( account.getPresentBalance() + Integer.parseInt(amount)*100 );
		userAccountDAO.save( account );
		
		UserPaymentLog usrPayment = new UserPaymentLog();
		usrPayment.setOrdOrder( null );
		usrPayment.setPayMethod(payMethod);
		usrPayment.setCheckNo(checkNo);
		usrPayment.setPresentAmount( 0 );
		usrPayment.setBalance(account.getBalance());
		usrPayment.setPresentAmount(new Integer(amount)*100);
		usrPayment.setPresentBalance( account.getPresentBalance() );
		usrPayment.setStatus((short)1);
		usrPayment.setPayDate( Calendar.getInstance().getTime() );
		usrPayment.setRemark( remark );
		usrPayment.setAccountId( new Long(userId) );
		userPaymentLogDAO.save(usrPayment);

	}
    public void upateAuthInf(OrdOrderItem orderItem,String userId,String userType){
    	System.out.println("---------------------in auth");
    	Calendar calendar = Calendar.getInstance();
    	List agentBookList = ordAgentBookDAO.findByUserIdAndType(userId, userType);
    	if( agentBookList.size() > 0 ){
    		OrdAgentBook agentBook = (OrdAgentBook)agentBookList.get(0);
    		Date endDate = agentBook.getEndDate();
    		
    		calendar.setTime( endDate );
    		if( orderItem.getOrdService().getServiceType().intValue()==5){
    			calendar.add(calendar.MONTH, orderItem.getCount() );
    		}
    		else if ( orderItem.getOrdService().getServiceType().intValue()==4){
    			calendar.add(calendar.DAY_OF_MONTH, orderItem.getCount() );
    		}
    		agentBook.setEndDate( calendar.getTime() );
    		ordAgentBookDAO.save( agentBook );
    	}else{
    		OrdAgentBook agentBook = new OrdAgentBook();
    		agentBook.setUserId( new Long(userId));
    		agentBook.setUserType(new Short(userType));
    		Date now = calendar.getTime();
    		agentBook.setStartDate( now );
    		if( orderItem.getOrdService().getServiceType().intValue()==5){
    			calendar.add(calendar.MONTH, orderItem.getCount() );
    		}
    		else if ( orderItem.getOrdService().getServiceType().intValue()==4){
    			calendar.add(calendar.DAY_OF_MONTH, orderItem.getCount() );
    		}
    		agentBook.setEndDate( calendar.getTime() );
    		ordAgentBookDAO.save( agentBook );
    		
    	}
	}
	public OrdAgentBookDAO getOrdAgentBookDAO() {
		return ordAgentBookDAO;
	}
	public void setOrdAgentBookDAO(OrdAgentBookDAO ordAgentBookDAO) {
		this.ordAgentBookDAO = ordAgentBookDAO;
	}
	public UserAccountDAO getUserAccountDAO() {
		return userAccountDAO;
	}
	public void setUserAccountDAO(UserAccountDAO userAccountDAO) {
		this.userAccountDAO = userAccountDAO;
	}
	public UserPaymentLogDAO getUserPaymentLogDAO() {
		return userPaymentLogDAO;
	}
	public void setUserPaymentLogDAO(UserPaymentLogDAO userPaymentLogDAO) {
		this.userPaymentLogDAO = userPaymentLogDAO;
	}
    public OrdOrder getOrder(String orderId){
    	return userOrderDAO.findById( new Long(orderId) );
    }
    public void updateOrder( OrdOrder order ){
    	userOrderDAO.merge(order);
    }
	public OrdOrderDAO getOrdOrderDAO() {
		return userOrderDAO;
	}
	public void setOrdOrderDAO(OrdOrderDAO userOrderDAO) {
		this.userOrderDAO = userOrderDAO;
	}
	public UserServiceProcessor getUsrServiceProcessor() {
		return userServiceProcessor;
	}
	public void setUsrServiceProcessor(UserServiceProcessor userServiceProcessor) {
		this.userServiceProcessor = userServiceProcessor;
	}
    
	public UserPaymentLog clientPayRequest(String orderId, String userId,String userType, String payMethod, String amount, String checkNo, String remark){
		
		System.out.println(" clientPayRequest orderId = " + orderId);
		try {
			OrdOrder order = null;
			UserAccount account = this.getUserAccount(userId, userType);

			
			if(orderId != null) 
				order = userOrderDAO.findById( new Long(orderId) );
				
			UserPaymentLog usrPayment = new UserPaymentLog();
			usrPayment.setOrdOrder( order );
			usrPayment.setPayMethod(Short.parseShort(payMethod));
			usrPayment.setCheckNo(checkNo);
			usrPayment.setAmount( new Double(amount).intValue() * 100 * -1 );
			usrPayment.setBalance(account.getBalance() );
			usrPayment.setPresentAmount(0);
			//usrPayment.setPresentAmount(new Double(amount).intValue() * 100 * -1);
			usrPayment.setPresentBalance( account.getPresentBalance() );
			usrPayment.setStatus((short)0);
			usrPayment.setPayDate( Calendar.getInstance().getTime() );
			usrPayment.setRemark( remark );
			usrPayment.setAccountId( new Long(userId) );
			userPaymentLogDAO.save(usrPayment);
			
			return usrPayment;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		//recharge(userId,userType.toString(),Integer.parseInt(amount)*100 );
	}
	
	
	public UserPaymentLog clientChargeRequest(String orderId, String userId,String userType, String payMethod, String amount, String checkNo, String remark){
		
		System.out.println(" clientPayRequest orderId = " + orderId);
		try {
			OrdOrder order = null;
			UserAccount account = this.getUserAccount(userId, userType);

			
			if(orderId != null) 
				order = userOrderDAO.findById( new Long(orderId) );
				
			UserPaymentLog usrPayment = new UserPaymentLog();
			usrPayment.setOrdOrder( order );
			usrPayment.setPayMethod(Short.parseShort(payMethod));
			usrPayment.setCheckNo(checkNo);
			usrPayment.setAmount( new Double(amount).intValue() * 100 );
			usrPayment.setBalance(account.getBalance() );
			usrPayment.setPresentAmount(0);
			//usrPayment.setPresentAmount(new Double(amount).intValue() * 100 * -1);
			usrPayment.setPresentBalance( account.getPresentBalance() );
			usrPayment.setStatus((short)0);
			usrPayment.setPayDate( Calendar.getInstance().getTime() );
			usrPayment.setRemark( remark );
			usrPayment.setAccountId( new Long(userId) );
			userPaymentLogDAO.save(usrPayment);
			
			return usrPayment;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		//recharge(userId,userType.toString(),Integer.parseInt(amount)*100 );
	}
	
	public UserPaymentLog getUsrPayLogById(String id){
		return userPaymentLogDAO.findById(Long.parseLong(id));
	}
	
	public void updateUsrPayLog(UserPaymentLog log){
		userPaymentLogDAO.attachDirty(log);
	}
	
	
	/**
	 * 用戶賬戶上网上充值
	 */
	public void rechargeUserByPaypal(UserPaymentLog usrPayment, String userType, String remark, short rechargeType){
		usrPayment.setStatus((short)1);
		usrPayment.setRemark(remark);
		userPaymentLogDAO.attachDirty(usrPayment);
		
		OrdOrder order = usrPayment.getOrdOrder();
		if( order != null){
			
			UserAccount account = this.getUserAccount(order.getUserId().toString(), order.getUserType().toString());
			account.setBalance( account.getBalance() + usrPayment.getAmount() );
			userAccountDAO.save( account );
		}else{
			
			UserAccount account = this.getUserAccount(usrPayment.getAccountId().toString(), userType);
			usrPayment.setBalance(usrPayment.getBalance() + usrPayment.getAmount() );
			userPaymentLogDAO.merge(usrPayment);
			account.setBalance( account.getBalance() + usrPayment.getAmount() );
			userAccountDAO.save( account );
		}
			

	}
	
}
