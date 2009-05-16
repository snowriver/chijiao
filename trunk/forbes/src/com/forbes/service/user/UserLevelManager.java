package com.forbes.service.user;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserLevel;
import com.forbes.hibernate.dao.UserLevelDAO;
import com.forbes.util.Pager;

public interface UserLevelManager {

	public UserLevelDAO getUserLevelDAO();

	public void setUserLevelDAO(UserLevelDAO userLevelDAO);

	public List getUserLevelByPage( Pager pager, int pageNo, String keyword ) 
		throws ForbesException;


	public void addUserLevel(UserLevel userLevel);
	
	public void deleteUserLevel(UserLevel userLevel);
	
	public UserLevel getUserLevel(Short id);

	public void updateUserLevel(UserLevel userLevel);

	
	public List getUserLevel() throws ForbesException;

	/**
	 * ÅÐ”àµÈ¼¶
	 */
	public UserLevel judgeUserLevel( Integer score );
	
	
}
