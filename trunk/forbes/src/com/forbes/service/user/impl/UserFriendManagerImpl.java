package com.forbes.service.user.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.bean.UserFriend;
import com.forbes.hibernate.dao.UserDAO;
import com.forbes.hibernate.dao.UserFriendDAO;
import com.forbes.service.user.UserFriendManager;
import com.forbes.service.user.UserInfoManager;
import com.forbes.util.Pager;

public class UserFriendManagerImpl implements UserFriendManager {
	
	private UserDAO userDAO;
	
	private UserFriendDAO userFriendDAO;
	
	public UserDAO getUserDAO() {
		return userDAO;
	}
	
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	public UserFriendDAO getUserFriendDAO() {
		return userFriendDAO;
	}

	public void setUserFriendDAO(UserFriendDAO userFriendDAO) {
		this.userFriendDAO = userFriendDAO;
	}
	
	public List getUserFriendByPage( Pager pager, int pageNo, String userId, String orderBy ) throws ForbesException{
		try {			
			pager.setTotoalCnt(userFriendDAO.getCount(userId));
			List list = userFriendDAO.findUserFriendByPage(userId, orderBy, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public void deleteUserFriend(UserFriend userFriend) {
		userFriendDAO.delete(userFriend);
	}
	
	public UserFriend getUserFriend(Long id) {
		return userFriendDAO.findById(id);
	}
	
	public void addUserFriend(UserFriend userFriend) {
		userFriendDAO.save(userFriend);
	}

	public void updateUserFriend(UserFriend userFriend) {
		userFriendDAO.attachDirty(userFriend);
	}
	
	public boolean checkIfFriend(Integer userId, Integer friendId) throws ForbesException {
		try {
			int list = userFriendDAO.getCount(userId, friendId);
			if( list > 0)
				return true;
			else
				return false;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
	
		}
	}
}
