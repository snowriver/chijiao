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

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.UserAccount;
import com.forbes.hibernate.bean.UserDetail;
import com.forbes.hibernate.bean.UserLevel;
import com.forbes.hibernate.bean.UserLevelPromotion;
import com.forbes.hibernate.bean.UserOrder;
import com.forbes.hibernate.bean.UserPaymentLog;
import com.forbes.hibernate.bean.UserScoreLog;
import com.forbes.hibernate.dao.UcMembersDAO;
import com.forbes.hibernate.dao.UserAccountDAO;
import com.forbes.hibernate.dao.UserDetailDAO;
import com.forbes.hibernate.dao.UserLevelDAO;
import com.forbes.hibernate.dao.UserLevelPromotionDAO;
import com.forbes.hibernate.dao.UserOrderDAO;
import com.forbes.hibernate.dao.UserPaymentLogDAO;
import com.forbes.hibernate.dao.UserScoreLogDAO;
import com.forbes.service.account.PaymentManager;
import com.forbes.service.account.ScoreManager;
import com.forbes.service.newsfeed.NewsFeedManager;
import com.forbes.service.userservice.UserServiceProcessor;
import com.forbes.util.Config;
import com.forbes.util.Constant;
import com.forbes.util.DictionaryManager;
import com.forbes.util.Pager;


public class ScoreManagerImpl implements ScoreManager{
	
	private UserScoreLogDAO userScoreLogDAO;
	private UserAccountDAO  userAccountDAO;
	private UserLevelDAO  userLevelDAO;
	private UcMembersDAO  ucMembersDAO;
	private UserDetailDAO userDetailDAO;
	private UserLevelPromotionDAO  userLevelPromotionDAO;
	private NewsFeedManager   newsFeedManager;
	//private UserServiceProcessor userServiceProcessor;
	
	public UserScoreLogDAO getUserScoreLogDAO() {
		return userScoreLogDAO;
	}
	public void setUserScoreLogDAO(UserScoreLogDAO userScoreLogDAO) {
		this.userScoreLogDAO = userScoreLogDAO;
	}
	public UserAccountDAO getUserAccountDAO() {
		return userAccountDAO;
	}
	public void setUserAccountDAO(UserAccountDAO userAccountDAO) {
		this.userAccountDAO = userAccountDAO;
	}	
	
	public NewsFeedManager getNewsFeedManager() {
		return newsFeedManager;
	}
	public void setNewsFeedManager(NewsFeedManager newsFeedManager) {
		this.newsFeedManager = newsFeedManager;
	}
	
	public UserLevelDAO getUserLevelDAO() {
		return userLevelDAO;
	}
	public void setUserLevelDAO(UserLevelDAO userLevelDAO) {
		this.userLevelDAO = userLevelDAO;
	}
	
	public UcMembersDAO getUcMembersDAO() {
		return ucMembersDAO;
	}
	public void setUcMembersDAO(UcMembersDAO ucMembersDAO) {
		this.ucMembersDAO = ucMembersDAO;
	}
	public UserDetailDAO getUserDetailDAO() {
		return userDetailDAO;
	}
	public void setUserDetailDAO(UserDetailDAO userDetailDAO) {
		this.userDetailDAO = userDetailDAO;
	}
	
	public UserLevelPromotionDAO getUserLevelPromotionDAO() {
		return userLevelPromotionDAO;
	}
	public void setUserLevelPromotionDAO(UserLevelPromotionDAO userLevelPromotionDAO) {
		this.userLevelPromotionDAO = userLevelPromotionDAO;
	}
	/**
	 * 查询余额
	 */

	
	public int getBalance(String userId, String accountType){
		
	    UserAccount account = getUserAccount(userId, accountType);
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
	
	public UserAccount getUserAccount(String userId, String accountType){
		
		//String accountType = Config.getProperty("ACCOUNT_TYPE", "1");
		
		List  accountLst = userAccountDAO.findByUserIdAndType(userId, accountType);
		if( accountLst.size() > 0  ){
			UserAccount account = (UserAccount)accountLst.get(0);
			return account;
		}
		else{
			//String presentAmt = Config.getProperty("PRESENT_AMT", "80");
			//String presentAmt = Config.getProperty("PRESENT_AMT", "100");
			String presentAmt = "100";
			/*newsFeedManager.createNewsFeed("1", "1111", ""+Constant.VST_USR_SEC, userId, 
					""+Constant.VST_USR_BER, "你已獲贈價值HK$80的Smartxz錢幣。" );*/
			return userAccountDAO.initAccount(userId, new Integer(presentAmt), new Short(accountType));
		}
	}
	

	public boolean addScoreByUser( String objectId, String userId, String accountType, int amount, String remark){
		
		UserAccount account = getUserAccount(userId, accountType);
		
		if(account==null ){
			return false;
		}
		
		//int bamount = 0;
		int presenAmount = 0;
		
		presenAmount = amount;
		//account.setPresentBalance( account.getPresentBalance() + amount );
		account.setBalance( account.getBalance() + amount );
	
		userAccountDAO.save( account );
		
		UserScoreLog log = new UserScoreLog();
		if(objectId!=null && objectId.length() > 0)
			log.setObjectId(Long.parseLong(objectId));

		log.setAmount( presenAmount  );
		log.setBalance(account.getBalance());
		log.setPresentAmount(presenAmount);
		log.setPresentBalance( account.getPresentBalance() );
		log.setStatus((short)1);
		log.setGenDate( Calendar.getInstance().getTime() );
		log.setRemark( remark );
		log.setUserId( new Long(userId) );
		userScoreLogDAO.save(log);
		
		checkUserLevel(userId);
		return true;
	}

	
	public boolean minusScoreByUser( String objectId, String userId, String accountType, int amount, String remark){
		
		System.out.println(" minus account " );
		
		UserAccount account = getUserAccount(userId, accountType);
		
		System.out.println(" account id = " + account.getId());
		
		if(account==null || amount > (account.getBalance() + account.getPresentBalance())){
			return false;
		}
		
		int bamount = 0;
		int presenAmount = 0;
		if( amount > account.getPresentBalance() ){
			presenAmount = account.getPresentBalance();
			bamount = amount - presenAmount;
		    account.setPresentBalance(0);
		    account.setBalance( account.getBalance()-bamount );
		}
		else{
			presenAmount = amount;
			account.setPresentBalance( account.getPresentBalance()- amount );
			
		}
		userAccountDAO.save( account );
		
		UserScoreLog log = new UserScoreLog();
		if(objectId!=null && objectId.length() > 0)
			log.setObjectId(Long.parseLong(objectId));

		log.setAmount( bamount*-1 );
		log.setBalance(account.getBalance());
		log.setPresentAmount(presenAmount * -1);
		log.setPresentBalance( account.getPresentBalance() );
		log.setStatus((short)1);
		log.setGenDate( Calendar.getInstance().getTime() );
		log.setRemark( remark );
		log.setUserId( new Long(userId) );
		userScoreLogDAO.save(log);
		
		checkUserLevel(userId);
		return true;
	}
	

	public void checkUserLevel(String userId) {
		UcMembers user = ucMembersDAO.findById(Integer.parseInt(userId));
		
		Short accountType = DictionaryManager.getInstance().getVal("ACCOUNT_TYPE", "2").getDvalue();
		int balance = this.getBalance(userId, accountType.toString());
		
		UserLevel userLevel = this.judgeUserLevel(balance);
		if(userLevel!=null) {
			
			UserDetail detail = user.getUserDetail();
			if(userLevel.getLevel() > detail.getUserLevel()) {
				UserLevelPromotion pro = userLevelPromotionDAO.findById(Integer.parseInt(userId));
				if(pro == null) {
					pro = new UserLevelPromotion();
					pro.setUid( Integer.parseInt(userId) );
					pro.setLevel( userLevel.getLevel() );
					pro.setLevelTitle( userLevel.getTitle() );
					pro.setUsername( user.getUsername() );
					pro.setPromotDate( Calendar.getInstance().getTime() );
					userLevelPromotionDAO.save( pro );
				}
				else {
					pro.setLevel( userLevel.getLevel() );
					pro.setLevelTitle( userLevel.getTitle() );
					pro.setUsername( user.getUsername() );
					pro.setPromotDate( Calendar.getInstance().getTime() );
					userLevelPromotionDAO.attachDirty( pro );
				}
			}
				
			detail.setUserLevel(userLevel.getLevel());
			userDetailDAO.attachDirty(detail);
		} else {
			UserDetail detail = user.getUserDetail();
			detail.setUserLevel((short)0);
			userDetailDAO.attachDirty(detail);
		}
		
	}
	

	/**
	 * 判斷等级
	 */
	public UserLevel judgeUserLevel( Integer score ){
		List levels = userLevelDAO.findAll();
		System.out.println("areaTypes.size = " + levels.size());
		
		UserLevel level = null;
		for(int i=0; i<levels.size(); i++) {
			UserLevel userLevel = (UserLevel)levels.get(i);
			if( score >=userLevel.getStartScore() && score <= userLevel.getEndScore() ) {
				level = userLevel;
			}
		}
		return level;
		
	}
	
	
	public List getUserLevelPromotion( int begin, int length ) throws ForbesException{
		try {
			List list = userLevelPromotionDAO.findUserLevelPromotionByPage( begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	
	public List getUserAndAccount( String accountType ) throws ForbesException{
		try {
			List list = userAccountDAO.findByUserAndAccount( accountType);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
}
