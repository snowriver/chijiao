package com.forbes.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.dao.UcAdminsDAO;
import com.forbes.hibernate.dao.UcMembersDAO;
import com.forbes.hibernate.dao.UserDAO;
import com.forbes.struts.form.user.UserLoginForm;

public interface UserLogin {
	
	public UcMembersDAO getUcMembersDAO();

	public void setUcMembersDAO(UcMembersDAO ucMembersDAO);
	
	public UcAdminsDAO getUcAdminsDAO();

	public void setUcAdminsDAO(UcAdminsDAO ucAdminsDAO);
	
	/**
	 * 密碼验证
	 * @param loginName 登錄名称
	 * @param password  登錄密碼
	 * @return 返回成功失敗
	 */
	public UcMembers clientVerifyPassword( String username, String password );
	
	public UcMembers adminVerifyPassword( String username, String password );
	
	public void updateLoginLog( UcMembers user );

	public int getCount( String propertyName, Object value );
	
	public void clientRegister( UcMembers user );
	
	public UcMembers login(String username,  String password, String remember, HttpServletRequest request, HttpServletResponse response);
	
}
