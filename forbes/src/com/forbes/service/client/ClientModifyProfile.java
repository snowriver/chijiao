package com.forbes.service.client;

import java.util.List;

import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.bean.UserDetail;
import com.forbes.hibernate.dao.UcMembersDAO;
import com.forbes.hibernate.dao.UserDAO;
import com.forbes.hibernate.dao.UserDetailDAO;

public interface ClientModifyProfile {

	public UcMembersDAO getUcMembersDAO();


	public void setUcMembersDAO(UcMembersDAO ucMembersDAO);


	public UserDetailDAO getUserDetailDAO();


	public void setUserDetailDAO(UserDetailDAO userDetailDAO);
	
	/**
	 * �޸Ŀͻ��Y��
	 * @param usrClient �ͻ��Y��
	 */
	public void modifyClient( UcMembers user, UserDetail detail );
	
	public void modifyUserDetail( UserDetail detail );
	

	public boolean verifyEmail( UcMembers checkClient, Object email);
	
	public UserDetail getUserDetail( UcMembers user );
	
	public UserDetail getUserDetail( Integer id );
}
