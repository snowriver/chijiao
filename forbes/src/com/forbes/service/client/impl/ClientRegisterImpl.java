package com.forbes.service.client.impl;

import java.util.*;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.UserDetail;
import com.forbes.hibernate.dao.UcMembersDAO;
import com.forbes.hibernate.dao.UserDAO;
import com.forbes.hibernate.dao.UserDetailDAO;
import com.forbes.mail.ForbesMail;
import com.forbes.mail.ForbesMailSender;
import com.forbes.service.client.ClientRegister;
import com.forbes.util.MD5;

public class ClientRegisterImpl implements ClientRegister {
	
	public UcMembersDAO ucMembersDAO ;
	
	public UserDAO userDAO;
	
	public UserDetailDAO userDetailDAO;
	
	public UcMembersDAO getUcMembersDAO() {
		return ucMembersDAO;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public UserDetailDAO getUserDetailDAO() {
		return userDetailDAO;
	}

	public void setUserDetailDAO(UserDetailDAO userDetailDAO) {
		this.userDetailDAO = userDetailDAO;
	}

	public void setUcMembersDAO(UcMembersDAO ucMembersDAO) {
		this.ucMembersDAO = ucMembersDAO;
	}


	/**
	 * ��������Ƿ��ظ�
	 * @param User �ͻ�
	 * @return �ɹ�ʧ��
	 */
	public String checkLoginName(String LoginName){

		if( LoginName==null || LoginName.length() <5 || LoginName.length() > 18 ){
			return "��Ա����������6-18���ַ����!";
		}
		if( LoginName.indexOf(" ")>=0 || LoginName.indexOf("	")>=0 ){
			return "��Ա�����ܰ����ո�!";
		}
		String cLoginName = LoginName.replaceAll(" ", "").toLowerCase().trim();
		char [] chars = cLoginName.toCharArray();
		int numCnt = 0;
		for( char achar : chars ){
			if( (int)achar >= 48 &&  (int)achar <= 57 ){
				numCnt++;
			}
		}
	    
		List list = ucMembersDAO.findByUsername( LoginName );
		if( list.size() > 0 ){
			return "�Բ��𣬸û�Ա���Ѿ���ע��!";
		}
		return "OK";
	}
	
	
	/**
	 * ����ǳ��Ƿ��ظ�
	 * @param User �ͻ�
	 * @return �ɹ�ʧ��
	 */
	public String checkName(String name){

		if( name==null || name.length() <2 || name.length() > 10 ){
			return "�ǳƱ�������2-10�������ַ���Ӣ����ĸ�����������!";
		}
		if( name.indexOf(" ")>=0 || name.indexOf("	")>=0 ){
			return "�ǳƲ��ܰ����ո�!";
		}
		/*String cLoginName = LoginName.replaceAll(" ", "").toLowerCase().trim();
		char [] chars = cLoginName.toCharArray();
		int numCnt = 0;
		for( char achar : chars ){
			if( (int)achar >= 48 &&  (int)achar <= 57 ){
				numCnt++;
			}
		}*/
	    
		List list = ucMembersDAO.findByUsername( name );
		//System.out.println(" list.size= " + list.size());
		if( list.size() > 0 ){
			return "�Բ��𣬸��ǳ��Ѿ���ʹ��!";
		}
		return "OK";
	}
	
	/**
	 * ����ʼ��Ƿ��ظ�
	 * @param User �ͻ�
	 * @return �ɹ�ʧ��
	 */
	public boolean checkEmail(UcMembers user){
		List list = ucMembersDAO.findByEmail( user.getEmail() );
		if( list.size() == 0 ){
			return true;
		}else{
			return false;
		}
		
	}
	
	
	/**
	 * ����ʼ��Ƿ��ظ�
	 * @param User �ͻ�
	 * @return �ɹ�ʧ��
	 */
	public boolean checkEmail(String email){
		List list = ucMembersDAO.findByEmail( email );
		if( list.size() == 0 ){
			return true;
		}else{
			return false;
		}
		
	}
	
	/**
	 * ע��һ���ͻ��Y�ϵ����ݿ�
	 * @param User �ͻ�
	 */
	public void register( UcMembers ucMembers ) {
		try {
			/*List list = userDAO.findByLoginName( user.getLoginName() );
			if( list.size() > 0 ){
				throw new ForbesException( "���û����Ѿ���ע��" );
			}*/
			

			
			/*User user = new User();
			user.setId(ucMembers.getUid());
			user.setLoginName(ucMembers.getUsername());
			user.setPassword(ucMembers.getPassword());
			user.setActive("Y");
			user.setType("C");
			user.setDeleteFlag("N");
			//user.setScores(0);
			user.setRegTime(new Date());*/
			
			
			// 
			UserDetail detail = new UserDetail();
			detail.setScores(Integer.parseInt("0"));
			detail.setQqLock("N");
			detail.setEmailLock("N");
			detail.setSexLock("N");
			detail.setBirthLock("N");
			detail.setBirthType("L");
			detail.setCallingLock("N");
			detail.setWorkLock("N");
			detail.setHomeLock("N");
			detail.setLiveLock("N");
			detail.setPhoneLock("N");
			detail.setMobileLock("N");
			detail.setMsnLock("N");
			detail.setSex("F");
			detail.setUserLevel((short)1);
			
			userDetailDAO.save(detail);
			
			//user.setUserDetail(detail);
			// ���浽���ݿ�
			//userDAO.save( user );
			
			
			ucMembers.setMyid("");
			ucMembers.setMyidkey("");
			ucMembers.setSecques("");
			// ���浽���ݿ�
			ucMembers.setUserDetail(detail);
			
			ucMembersDAO.save( ucMembers );
			
			try {
				//sendMail(ucMembers);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			//throw new ForbesException(e.getMessage());
		}
		
	}
	
	
	public void sendMail(UcMembers user) {
		
		String mailstr = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*" ;
		if( !user.getEmail().matches(mailstr) )  {
			//System.out.println("�l���ʼ�ʧ��,Ո�_�J�ʼ��Ƿ����_��" + user.getEmail());
		}
		else {
			String msg = user.getUsername() + ", ���ã� <br /><br />";
			
			msg = msg + "��л���ɹ�ע��Ϊ ����� �ĸ����û����� " +
					"<a href='http://127.0.0.1:8080/forbes/client/ClientVerifyEmail.do?act=verify&id=" + user.getUid() + "&m=" + MD5.convert(user.getUsername())+"' target='_bank'>���</a> ���Ｄ���ʺ�<br /><br />";

			msg = msg + "�ɹ������������ʹ�ø��๦�ܡ�<br /><br />";

			msg = msg + "������������������Ч���������Ĵ��뿽����������ĵ�ַ���У�<br /><br />";

			msg = msg + "<a href='http://127.0.0.1:8080/forbes/client/ClientVerifyEmail.do?act=verify&id=" + user.getUid() + "&m=" + MD5.convert(user.getUsername())+"'>" +
			"http://127.0.0.1:8080/forbes/client/ClientVerifyEmail.do?act=verify&id=" + user.getUid() + "&m=" + MD5.convert(user.getUsername())+" </a><br /><br />";

			msg = msg + "����ףԸ����Ŀ��ģ�<br /><br />";

			msg = msg + "�����";

			ForbesMailSender sender = new ForbesMailSender("smtp.163.com","xuxiaomin123","19830501");
			ForbesMail mail = new ForbesMail();
			mail.addBody(msg, mail.HTML_MAIL );
			mail.setSubject("[�����]ע��ȷ����");
			mail.setFrom("xuxiaomin123@163.com");
			mail.addTo( user.getEmail() );
				
			boolean rst = sender.doSend( mail );
			if( rst ){
				System.out.println("���ͳɹ�...��");
			}
			else {
				throw new RuntimeException("�l���ʼ�ʧ��,Ո�_�J�ʼ��Ƿ����_");
			}
		}
				
			
		
	}
	

	
	
}
