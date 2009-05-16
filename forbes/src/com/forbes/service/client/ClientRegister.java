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
	 * ��������Ƿ��ظ�
	 * @param UsrClient �ͻ�
	 * @return �ɹ�ʧ��
	 */
	public String checkLoginName(String LoginName);
	
	
	public String checkName(String name);
	/**
	 * ����ʼ��Ƿ��ظ�
	 * @param UsrClient �ͻ�
	 * @return �ɹ�ʧ��
	 */
	public boolean checkEmail(UcMembers user);
	
	public boolean checkEmail(String email);
	
	/**
	 * ע��һ���ͻ��Y�ϵ����ݿ�
	 * @param UsrClient �ͻ�
	 */
	public void register( UcMembers user );
	
	public void sendMail(UcMembers user);
}
