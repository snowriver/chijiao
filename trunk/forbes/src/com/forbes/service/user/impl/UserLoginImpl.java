package com.forbes.service.user.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;

import com.forbes.hibernate.bean.UcAdmins;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.dao.UcAdminsDAO;
import com.forbes.hibernate.dao.UcMembersDAO;
import com.forbes.hibernate.dao.UserDAO;
import com.forbes.service.user.UserLogin;
import com.forbes.struts.form.user.UserLoginForm;
import com.forbes.util.MD5;

public class UserLoginImpl implements UserLogin {
	
	private UcMembersDAO ucMembersDAO;
	
	private UcAdminsDAO ucAdminsDAO;
	
	public UcAdminsDAO getUcAdminsDAO() {
		return ucAdminsDAO;
	}

	public void setUcAdminsDAO(UcAdminsDAO ucAdminsDAO) {
		this.ucAdminsDAO = ucAdminsDAO;
	}

	public UcMembersDAO getUcMembersDAO() {
		return ucMembersDAO;
	}

	public void setUcMembersDAO(UcMembersDAO ucMembersDAO) {
		this.ucMembersDAO = ucMembersDAO;
	}

	/**
	 * 密碼验证
	 * @param loginName 登錄名称
	 * @param password  登錄密碼
	 * @return 返回成功失敗
	 */
	public UcMembers clientVerifyPassword(String username, String password ){
		System.out.println("-----------username:" + username);
		List <UcMembers> userList = ucMembersDAO.findUcMembers( username );
		//System.out.println(userList.size());
		if( userList.size() >= 1 ) {
			UcMembers ucMembers = userList.get(0);
			//md5(md5($password).$salt);
			String md5Password = MD5.convert(MD5.convert(password) + ucMembers.getSalt()) ;
			
			/*System.out.println("password =" + (password));
			System.out.println("MD5.convert(password)=" + MD5.convert(password));
			System.out.println("MD5.convert(password) + ucMembers.getSalt()=" + MD5.convert(password) + ucMembers.getSalt() );
			System.out.println("MD5.convert(MD5.convert(password) + ucMembers.getSalt())=" + MD5.convert(password));
			System.out.println("ucMembers.getPassword()    =" + ucMembers.getPassword());*/
			if( md5Password.equals(ucMembers.getPassword()) ){			
				return ucMembers;
			}
			else 
				return null;
		}
	    else 
	    	return null;
	}
	
	/**
	 * 密碼验证
	 * @param loginName 登錄名称
	 * @param password  登錄密碼
	 * @return 返回成功失敗
	 */
	public UcMembers adminVerifyPassword(String username, String password ){
		//System.out.println("-----------username:" + username);
		List <UcAdmins> adminList = ucAdminsDAO.findByUsername(username);
		//System.out.println("adminList size = "+adminList.size());
		
		if( adminList.size() >0 ) {
			List <UcMembers> userList = ucMembersDAO.findByUsername( username );
			//System.out.println(userList.size());
			if( userList.size() >= 1 ) {
				UcMembers ucMembers = userList.get(0);
				//md5(md5($password).$salt);
				String md5Password = MD5.convert(MD5.convert(password) + ucMembers.getSalt()) ;
				
				/*System.out.println("password =" + (password));
				System.out.println("MD5.convert(password)=" + MD5.convert(password));
				System.out.println("MD5.convert(password) + ucMembers.getSalt()=" + MD5.convert(password) + ucMembers.getSalt() );
				System.out.println("MD5.convert(MD5.convert(password) + ucMembers.getSalt())=" + MD5.convert(password));
				System.out.println("ucMembers.getPassword()    =" + ucMembers.getPassword());*/
				if( md5Password.equals(ucMembers.getPassword()) ){			
					return ucMembers;
				}
				else 
					return null;
			}
		    else 
		    	return null;
		}
		else
			return null;
		
		
	}
	
	public int getCount( String propertyName, Object value ){
		return ucMembersDAO.getCount( propertyName, value);
	}
	
	
	public void updateLoginLog( UcMembers ucMembers ){
		ucMembersDAO.attachDirty(ucMembers);
	}
	
	public void clientRegister( UcMembers ucMembers ){
		ucMembersDAO.save(ucMembers);
	}

	public UcMembers login(String username,  String password, String remember,
			HttpServletRequest request, HttpServletResponse response) {
		
		//UserLoginForm userLoginForm = (UserLoginForm) form;
		/*String loginName     = userLoginForm.getLoginName();
		String password      = userLoginForm.getPassword();
		String remember      = userLoginForm.getRemember();*/
		

		/*System.out.println(username);
		System.out.println(password);
		System.out.println(remember);*/
	
		try {		
			int userCount = this.getCount("username", username.trim());
				//System.out.println( "userCount = " + userCount);
				if( userCount >=1) {
					UcMembers ucMember = this.clientVerifyPassword( username, password );
					//System.out.println("user is null = " + (ucMember != null) );
					if( ucMember != null ){
						//if( user.getActive().equals("Y")) {
							//System.out.println(" active Y");
							/*user.setLastLoginTime(new Date());
							user.setLastLoginIp(request.getRemoteAddr());*/
							this.updateLoginLog(ucMember);
							request.getSession().setAttribute("CLIENT", ucMember);				
							//System.out.println("---------admin login ok");
							
							//添加cookie
							try {
								if(remember.equals("Y")) {
									Cookie c = new Cookie("FORBES_USER_INFO", ucMember.getUid() + "@" + ucMember.getUid() + "@" + username + "@" + MD5.convert(password) + "@" + new Date());
									c.setMaxAge(60*60*24*365);
									response.addCookie(c);
								}
							} catch(Exception e) {
								e.printStackTrace();
							}
							return ucMember;
						/*}
						else {
							return user;
						}*/
					}
					else{
						return null;
					}
				}
				else {
					return null;
				}

		}catch( Exception e ){
			return null;
		}
	}
}
