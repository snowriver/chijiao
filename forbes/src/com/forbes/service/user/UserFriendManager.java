package com.forbes.service.user;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.bean.UserFriend;
import com.forbes.hibernate.dao.UserDAO;
import com.forbes.hibernate.dao.UserFriendDAO;
import com.forbes.util.Pager;

public interface UserFriendManager {
	
	public UserDAO getUserDAO();
	
	public void setUserDAO(UserDAO userDAO);
	
	public UserFriendDAO getUserFriendDAO();

	public void setUserFriendDAO(UserFriendDAO userFriendDAO);
	
	public List getUserFriendByPage( Pager pager, int pageNo, String userId, String orderBy ) throws ForbesException;
	
	public void deleteUserFriend(UserFriend userFriend);
	
	public UserFriend getUserFriend(Long id) ;
	
	public void addUserFriend(UserFriend userFriend) ;

	public void updateUserFriend(UserFriend userFriend) ;
	
	public boolean checkIfFriend(Integer userId, Integer friendId) throws ForbesException ;
}
