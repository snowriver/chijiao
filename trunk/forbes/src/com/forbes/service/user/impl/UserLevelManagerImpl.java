package com.forbes.service.user.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserLevel;
import com.forbes.hibernate.dao.UserLevelDAO;
import com.forbes.service.user.UserLevelManager;
import com.forbes.util.Pager;


public class UserLevelManagerImpl implements UserLevelManager {
	
	
	
	private UserLevelDAO userLevelDAO;
	

	public UserLevelDAO getUserLevelDAO() {
		return userLevelDAO;
	}

	public void setUserLevelDAO(UserLevelDAO userLevelDAO) {
		this.userLevelDAO = userLevelDAO;
	}

	public List getUserLevelByPage( Pager pager, int pageNo, String keyword ) throws ForbesException{
		try {			
			pager.setTotoalCnt(userLevelDAO.getCount(keyword));
			List list = userLevelDAO.findUserLevelByPage( keyword, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}


	public void addUserLevel(UserLevel userLevel) {
		userLevelDAO.save(userLevel);
	}
	
	public void deleteUserLevel(UserLevel userLevel) {
		userLevelDAO.delete(userLevel);
	}
	
	public UserLevel getUserLevel(Short id) {
		return userLevelDAO.findById(id);
	}

	public void updateUserLevel(UserLevel userLevel) {
		userLevelDAO.attachDirty(userLevel);
	}

	
	public List getUserLevel() throws ForbesException{
		try {
			List list = userLevelDAO.findAll();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	
	/**
	 * ÅÐ”àµÈ¼¶
	 */
	public UserLevel judgeUserLevel( Integer score ){
		List levels = userLevelDAO.findAll();
		//System.out.println("areaTypes.size = " + levels.size());
		
		UserLevel level = null;
		for(int i=0; i<levels.size(); i++) {
			UserLevel userLevel = (UserLevel)levels.get(i);
			if( score >=userLevel.getStartScore() && score <= userLevel.getEndScore() ) {
				level = userLevel;
			}
		}
		return level;
		
	}
	
	
}
