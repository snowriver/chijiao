package com.forbes.struts.action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.service.user.UserLogin;

public class AdminLoginAction extends Action {

	private UserLogin userLogin;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String loginName     = request.getParameter("loginName");
		String password      = request.getParameter("password");
	
		try {
		
				int userCount = userLogin.getCount( "username", loginName.trim());				
				if( userCount >=1) {
					UcMembers user = userLogin.adminVerifyPassword( loginName, password );					
					if( user != null ){
						//user.setLastLoginTime(new Date());
						//user.setLastLoginIp(request.getRemoteAddr());
						//userLogin.updateLoginLog(user);
						request.getSession().setAttribute("ADMIN", user);
						request.getSession().setAttribute("CLIENT", user);					
						return mapping.findForward("ok");
					}
					else{
						request.setAttribute("LOGIN_NAME", loginName);
						request.setAttribute("PASSWORD", password);
						request.setAttribute("ERROR_INFO", "密码错误，或者该用户已被注销。");
						return mapping.findForward("fail");
					}
				}
				else {
					request.setAttribute("LOGIN_NAME", loginName);
					request.setAttribute("PASSWORD", password);
					request.setAttribute("ERROR_INFO", "本系统中无该用户，或者该用户无权限访问该后台管理系统。");
					return mapping.findForward("fail");
				}			

		}catch( Exception e ){
			System.out.println(e.getMessage());
			request.setAttribute("ERROR_INFO", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}

	}
	public UserLogin getUserLogin() {
		return userLogin;
	}
	public void setUserLogin(UserLogin userLogin) {
		this.userLogin = userLogin;
	}
}