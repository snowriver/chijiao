/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.form.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;


/** 
 * MyEclipse Struts
 * Creation date: 07-09-2007
 * 
 * XDoclet definition:
 * @struts.form name="ClientLoginForm"
 */
public class UserLoginForm extends ActionForm {
	
	private String loginName;
	private String password;
	private String validateCode;
	private String validateFlag;
	private String remember;
	
	/*
	 * Generated Methods
	 */

	
	public String getRemember() {
		return remember;
	}

	public void setRemember(String remember) {
		this.remember = remember;
	}

	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		//errors.add("loginName.value", new ActionMessage(loginName, false));
		//errors.add("password.value", new ActionMessage(password, false));
		
		request.setAttribute("LOGIN_NAME", loginName);
		request.setAttribute("PASSWORD", password);
		
		if ( loginName == null || loginName.length() < 1 ){
			errors.add("loginName.error", new ActionMessage("请输入用户名", false));
		}

		if ( password == null || password.length() < 1 ){
			errors.add("password.error", new ActionMessage("请输入密碼", false));
		}
		
		if ( validateFlag != null && validateFlag.equals("Y") ){
			if ( validateCode == null || validateCode.length() < 1 ){
				errors.add("validateCode", new ActionMessage("请输入验证码", false));
			}
			else {
				HttpSession session = request.getSession();
				String checkCode = (String) session.getAttribute("VALIDATE_CODE");
				session.removeAttribute("VALIDATE_CODE");
				
				if (!request.getParameter("validateCode").equals(checkCode)) {
					errors.add("validateCode.error", new ActionMessage("验证碼错误，請重新登錄。", false));
					//request.setAttribute("ERROR_INFO", "验证碼错误，請重新登錄。");
				}
			}
		}
		
		return errors;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getValidateFlag() {
		return validateFlag;
	}

	public void setValidateFlag(String validateFlag) {
		this.validateFlag = validateFlag;
	}

	public String getValidateCode() {
		return validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	

}