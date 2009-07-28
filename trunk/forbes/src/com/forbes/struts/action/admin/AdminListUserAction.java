/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.admin;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.service.user.UserInfoManager;
import com.forbes.util.Constant;
import com.forbes.util.Pager;


/** 
 * MyEclipse Struts
 * Creation date: 09-20-2008
 * 
 * XDoclet definition:
 * @struts.action scope="request" validate="true"
 */
public class AdminListUserAction extends DispatchAction {
	/*
	 * Generated Methods
	 */
	private UserInfoManager userInfoManager;
	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward admin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String keyword   = request.getParameter("keyword");
		String orderBy   = request.getParameter("orderBy");
		String pageNo    = request.getParameter("pno");
		String parameter = "keyword=" + ( (keyword==null)?" ":keyword );
		
		Map map = new TreeMap();
		map.put("keyword", keyword);
		map.put("parameter", parameter);
		
		int iPageNo = 1;
		try {
			if( pageNo != null ){
				iPageNo = Integer.parseInt( pageNo );
			}
		} catch( Exception e ){ }

		List list = null;
		Pager pager = new Pager();
		pager.setCntOfPage( 10 );
		pager.setCurPage( iPageNo );
		
		try {
		
			list = userInfoManager.getAdminByPage(pager, iPageNo, keyword, orderBy);
			
			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "USER_LIST", list);
			return mapping.findForward("admin");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("ERROR_INFO", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward client(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String keyword   = request.getParameter("keyword");
		String orderBy   = request.getParameter("orderBy");
		String pageNo    = request.getParameter("pno");
		String parameter = "keyword=" + ( (keyword==null)?" ":keyword );
		
		Map map = new TreeMap();
		map.put("keyword", keyword);
		map.put("parameter", parameter);
		
		int iPageNo = 1;
		try {
			if( pageNo != null ){
				iPageNo = Integer.parseInt( pageNo );
			}
		} catch( Exception e ){ }

		List list = null;
		Pager pager = new Pager();
		pager.setCntOfPage( 10 );
		pager.setCurPage( iPageNo );
		
		try {
		
			list = userInfoManager.getUserByPage(pager, iPageNo, keyword, orderBy);
			
			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "USER_LIST", list );
			return mapping.findForward("client");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("ERROR_INFO", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	

	public UserInfoManager getUserInfoManager() {
		return userInfoManager;
	}

	public void setUserInfoManager(UserInfoManager userInfoManager) {
		this.userInfoManager = userInfoManager;
	}
	
	
}