package com.forbes.service.client.impl;

import java.util.List;

import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.bean.UserDetail;
import com.forbes.hibernate.dao.UcMembersDAO;
import com.forbes.hibernate.dao.UserDAO;
import com.forbes.hibernate.dao.UserDetailDAO;
import com.forbes.service.client.ClientModifyProfile;


public class ClientModifyProfileImpl implements ClientModifyProfile {
	
	private UcMembersDAO ucMembersDAO;;

	private UserDetailDAO userDetailDAO;


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
	/**
	 * 修改客户資料
	 * @param usrClient 客户資料
	 */
	public void modifyClient( UcMembers user, UserDetail detail ){
		ucMembersDAO.merge( user );		
		userDetailDAO.merge( detail );
	}
	
	public void modifyUserDetail( UserDetail detail ){
		userDetailDAO.merge( detail );
	}
	

	public boolean verifyEmail( UcMembers checkClient, Object email) {
		List clientList = ucMembersDAO.findByEmail( email );
		boolean flag = false;		
		if( clientList.size() > 0 ) {
			UcMembers client = ( UcMembers ) clientList.get( 0 );
			if( client.getUsername().equals(checkClient.getUsername())){
				flag = false;
			}
			else flag = true;
		} 
		else return false;
		return flag;
	}
	
	public UserDetail getUserDetail( UcMembers user ) {
		return userDetailDAO.findById(user.getUserDetail().getId());
	}
	
	public UserDetail getUserDetail( Integer id ) {
		return userDetailDAO.findById( id );
	}


	
}
