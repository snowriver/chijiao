package com.forbes.service.account;

import java.util.Calendar;
import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserAccount;
import com.forbes.hibernate.bean.UserLevel;
import com.forbes.hibernate.bean.UserScoreLog;
import com.forbes.hibernate.dao.UcMembersDAO;
import com.forbes.hibernate.dao.UserAccountDAO;
import com.forbes.hibernate.dao.UserDetailDAO;
import com.forbes.hibernate.dao.UserLevelDAO;
import com.forbes.hibernate.dao.UserLevelPromotionDAO;
import com.forbes.hibernate.dao.UserScoreLogDAO;
import com.forbes.service.newsfeed.NewsFeedManager;
import com.forbes.util.Config;

public interface ScoreManager {
	
	public UserScoreLogDAO getUserScoreLogDAO();
	
	public void setUserScoreLogDAO(UserScoreLogDAO userScoreLogDAO);
	
	public UserAccountDAO getUserAccountDAO();
	
	public void setUserAccountDAO(UserAccountDAO userAccountDAO);
	
	public NewsFeedManager getNewsFeedManager();
	
	public void setNewsFeedManager(NewsFeedManager newsFeedManager);
	
	public UserLevelDAO getUserLevelDAO();
	
	public void setUserLevelDAO(UserLevelDAO userLevelDAO);
	
	public UcMembersDAO getUcMembersDAO();
	
	public void setUcMembersDAO(UcMembersDAO ucMembersDAO);
	
	public UserDetailDAO getUserDetailDAO();
	
	public void setUserDetailDAO(UserDetailDAO userDetailDAO);
	
	public UserLevelPromotionDAO getUserLevelPromotionDAO();
	
	public void setUserLevelPromotionDAO(UserLevelPromotionDAO userLevelPromotionDAO);
	
	/**
	 * ≤È—Ø”‡∂Ó
	 */	
	public int getBalance(String userId, String accountType);
	
	public UserAccount getUserAccount(String userId, String accountType);
	

	public boolean addScoreByUser( String objectId, String userId, String accountType, int amount, String remark);
	
	public boolean minusScoreByUser( String objectId, String userId, String accountType, int amount, String remark);
	
	public void checkUserLevel(String userId);
	
	public UserLevel judgeUserLevel( Integer score );
	
	public List getUserLevelPromotion( int begin, int length ) throws ForbesException;
	
	public List getUserAndAccount( String accountType ) throws ForbesException;

	
}
