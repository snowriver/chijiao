package com.forbes.service.account;

public interface PaymentManager {
	/*//account 查詢訂單
	public List getOderList(String status,Pager pager);
	//account 搜尋訂單
	public List searchOrder( String logName,String name,String begDate,String endDate,String status,Pager pager);
	//用戶查詢訂單
	public List getOderList(String status,String userId,String userType,Pager pager);
	//獲取一個訂單
    public OrdOrder getOrder(String orderId);
    //更新訂單
    public void updateOrder( OrdOrder order );
	public OrdOrderDAO getOrdOrderDAO() ;
	public void setOrdOrderDAO(OrdOrderDAO ordOrderDAO) ;
	public OrdAgentBookDAO getOrdAgentBookDAO();
	public void setOrdAgentBookDAO(OrdAgentBookDAO ordAgentBookDAO) ;
	public UsrAccountDAO getUsrAccountDAO() ;
	public void setUsrAccountDAO(UsrAccountDAO usrAccountDAO) ;
	public UsrPaymentLogDAO getUsrPaymentLogDAO() ;
	public void setUsrPaymentLogDAO(UsrPaymentLogDAO usrPaymentLogDAO);
    //查詢用戶餘額
	public int getBalance(String userId, String userType);
	//獲取用戶賬戶
	public UsrAccount getUsrAccount(String userId, String userType);
	//充值用用戶賬戶
	public void rechargeUserByAccount(String orderId,String amount,String checkNo,String remark,short rechargeType);
	//更新訂單
	public boolean updatePayByUser(String orderId,String userId,String userType,int amount);
	public List getUsrByPage(String usrClass,Pager pager);
	public List searchUsrByPage(String usrClass,String lgName,String realName, String phone,Pager pager);
	public void adminChangeUserAccount(String userId,String userType,short payMethod,String amount,String checkNo,String remark);
	public void adminChangeUserPresentAccount(String userId,String userType,short payMethod,String amount,String checkNo,String remark);
	public List getUsrPayLogByPage(Pager pager);
	public List searchUsrPayLogByPage(String logName,String name,String begDate,String endDate,Pager pager);
	public List getUsrPayLogByUsr(String userId,Pager pager);
	public List getUsrPayLogByAgent(String agentId, Pager pager);
	public List searchUsrPayLogByAgent(String logName,String name,String begDate,String endDate,String agentId, Pager pager);
	//agent查詢用戶訂單
	public List getOderListByAgent(String status,String agentId,Pager pager);
	//agent 搜尋用戶訂單
	public List searchOderListByAgent(String logName,String name,String begDate,String endDate,String status,String agentId,Pager pager);
	//agent 查詢用戶賬戶
	public List getUsrByPageByAgent(String  agentId,Pager pager);
	public List searchUsrByPageByAgent(String  agentId,String lgName,String realName, String phone,Pager pager);
	
	public UsrPaymentLog clientPayRequest(String orderId, String userId,String userType, String payMethod,String amount, String checkNo, String remark);
	public UsrPaymentLog clientChargeRequest(String orderId, String userId,String userType, String payMethod, String amount, String checkNo, String remark);
	
	public UsrPaymentLog getUsrPayLogById(String id);
	public void updateUsrPayLog(UsrPaymentLog log);
	public void rechargeUserByPaypal(UsrPaymentLog usrPayment, String userType, String remark, short rechargeType);
	public boolean verifyOrderByAccount(String orderId,String userId,String userType,int amount);*/
}
