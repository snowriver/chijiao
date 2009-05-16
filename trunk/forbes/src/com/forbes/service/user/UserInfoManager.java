package com.forbes.service.user;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UcAdmins;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.dao.UcAdminsDAO;
import com.forbes.hibernate.dao.UcMembersDAO;
import com.forbes.hibernate.dao.UserDAO;
import com.forbes.hibernate.dao.UserDetailDAO;
import com.forbes.util.Pager;

public interface UserInfoManager {
	
	public UcMembersDAO getUcMembersDAO();

	public void setUcMembersDAO(UcMembersDAO ucMembersDAO);
	
	public UserDAO getUserDAO();

	public void setUserDAO(UserDAO userDAO);
	
	public UserDetailDAO getUserDetailDAO();
	
	public UcAdminsDAO getUcAdminsDAO();

	public void setUcAdminsDAO(UcAdminsDAO ucAdminsDAO);

	public void setUserDetailDAO(UserDetailDAO userDetailDAO);
	
	public List getUserByPage( Pager pager, int pageNo, String keyWord, String orderBy ) throws ForbesException;
	
	public List getAdminByPage( Pager pager, int pageNo, String keyWord, String orderBy ) throws ForbesException;
	
	public List getUser( int begin, int length ) throws ForbesException;
	
	public void deleteUcMember(UcMembers user);
	
	public void deleteAdmin(UcAdmins user);
	
	public UcMembers getUcMember(Integer id);
	
	public UcAdmins getAdmin(Integer id);
	
	public User getUser(Integer id);
	
	public void updateUcMember(UcMembers user);
	
	public List getNewRegister(String orderby, int begin, int length ) throws ForbesException;
	
	public UcMembers initUserDetail( UcMembers ucMembers );
}
