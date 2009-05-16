package com.forbes.service.client;

import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.dao.UcMembersDAO;
import com.forbes.hibernate.dao.UserDAO;
import com.forbes.hibernate.dao.UserDetailDAO;

public interface ClientRegister {

	public UcMembersDAO getUcMembersDAO();


	public void setUcMembersDAO(UcMembersDAO ucMembersDAO);
	
	/**
	 * 检查登錄名是否重复
	 * @param UsrClient 客户
	 * @return 成功失敗
	 */
	public String checkLoginName(String LoginName);
	
	
	public String checkName(String name);
	/**
	 * 检查邮件是否重复
	 * @param UsrClient 客户
	 * @return 成功失敗
	 */
	public boolean checkEmail(UcMembers user);
	
	public boolean checkEmail(String email);
	
	/**
	 * 注冊一个客户資料到數据库
	 * @param UsrClient 客户
	 */
	public void register( UcMembers user );
	
	public void sendMail(UcMembers user);
}
