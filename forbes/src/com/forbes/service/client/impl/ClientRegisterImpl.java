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
	 * 检查登錄名是否重复
	 * @param User 客户
	 * @return 成功失敗
	 */
	public String checkLoginName(String LoginName){

		if( LoginName==null || LoginName.length() <5 || LoginName.length() > 18 ){
			return "会员名必须是由6-18个字符组成!";
		}
		if( LoginName.indexOf(" ")>=0 || LoginName.indexOf("	")>=0 ){
			return "会员名不能包含空格!";
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
			return "对不起，该会员名已经被注册!";
		}
		return "OK";
	}
	
	
	/**
	 * 检查昵称是否重复
	 * @param User 客户
	 * @return 成功失敗
	 */
	public String checkName(String name){

		if( name==null || name.length() <2 || name.length() > 10 ){
			return "昵称必须是由2-10个汉字字符，英文字母或者数字组成!";
		}
		if( name.indexOf(" ")>=0 || name.indexOf("	")>=0 ){
			return "昵称不能包含空格!";
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
			return "对不起，该昵称已经被使用!";
		}
		return "OK";
	}
	
	/**
	 * 检查邮件是否重复
	 * @param User 客户
	 * @return 成功失敗
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
	 * 检查邮件是否重复
	 * @param User 客户
	 * @return 成功失敗
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
	 * 注冊一个客户資料到數据库
	 * @param User 客户
	 */
	public void register( UcMembers ucMembers ) {
		try {
			/*List list = userDAO.findByLoginName( user.getLoginName() );
			if( list.size() > 0 ){
				throw new ForbesException( "该用户名已经被注冊" );
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
			// 储存到數据库
			//userDAO.save( user );
			
			
			ucMembers.setMyid("");
			ucMembers.setMyidkey("");
			ucMembers.setSecques("");
			// 储存到數据库
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
			//System.out.println("發送邮件失敗,請確認邮件是否正確：" + user.getEmail());
		}
		else {
			String msg = user.getUsername() + ", 您好： <br /><br />";
			
			msg = msg + "感谢您成功注册为 赤脚网 的个人用户！请 " +
					"<a href='http://127.0.0.1:8080/forbes/client/ClientVerifyEmail.do?act=verify&id=" + user.getUid() + "&m=" + MD5.convert(user.getUsername())+"' target='_bank'>点击</a> 这里激活帐号<br /><br />";

			msg = msg + "成功激活后您可以使用更多功能。<br /><br />";

			msg = msg + "如果您点击上述链接无效，请把下面的代码拷贝到浏览器的地址栏中：<br /><br />";

			msg = msg + "<a href='http://127.0.0.1:8080/forbes/client/ClientVerifyEmail.do?act=verify&id=" + user.getUid() + "&m=" + MD5.convert(user.getUsername())+"'>" +
			"http://127.0.0.1:8080/forbes/client/ClientVerifyEmail.do?act=verify&id=" + user.getUid() + "&m=" + MD5.convert(user.getUsername())+" </a><br /><br />";

			msg = msg + "衷心祝愿您玩的开心！<br /><br />";

			msg = msg + "赤脚网";

			ForbesMailSender sender = new ForbesMailSender("smtp.163.com","xuxiaomin123","19830501");
			ForbesMail mail = new ForbesMail();
			mail.addBody(msg, mail.HTML_MAIL );
			mail.setSubject("[赤脚网]注册确认信");
			mail.setFrom("xuxiaomin123@163.com");
			mail.addTo( user.getEmail() );
				
			boolean rst = sender.doSend( mail );
			if( rst ){
				System.out.println("发送成功...：");
			}
			else {
				throw new RuntimeException("發送邮件失敗,請確認邮件是否正確");
			}
		}
				
			
		
	}
	

	
	
}
