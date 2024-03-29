/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.client;


import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.forbes.hibernate.bean.Ask;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.service.ask.AskSearchManager;
import com.forbes.util.Pager;


/** 
 * MyEclipse Struts
 * Creation date: 07-09-2007
 * 
 * XDoclet definition:
 * @struts.action path="/client/ClientLogin" name="clientLoginForm" attribute="ClientLoginForm" input="/client/ClientLogin.jsp" scope="request" validate="true"
 * @struts.action-forward name="success" path="/client/ClientLoginOk.jsp"
 * @struts.action-forward name="fail" path="/client/ClientLoginFail.jsp"
 */
public class ClientManageAskAction extends DispatchAction {
	/*#com.she.web.form.client.ClientLoginForm Dependency20*/
/*
	 * Generated Methods
	 */
	
	private  AskSearchManager askSearchManager;
	
	
	/** 
	 * �ͻ����
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward all(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String pageNo  = request.getParameter("pno");
		String orderby = request.getParameter("orderby");
		String status  = request.getParameter("status");
		UcMembers user 	   = (UcMembers)request.getSession().getAttribute("CLIENT");
		
		try{
			Map map = new TreeMap();
			map.put("orderby", orderby);
			map.put("status", status);
			
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
			
			list = askSearchManager.getAskByPage(pager, iPageNo, user.getUid().toString(), null, status, null, orderby);
				//userFriendManager.getUserFriendByPage( pager, iPageNo, user.getId().toString(), orderby);

			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "ASK_LIST", list);
			
			System.out.println(" ClientManageAskAction list = "+list.size());
			
			return mapping.findForward("all");
		}catch( Exception e ){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward unsolved(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String pageNo  = request.getParameter("pno");
		String orderby = request.getParameter("orderby");
		String status  = request.getParameter("status");
		UcMembers user 	   = (UcMembers)request.getSession().getAttribute("CLIENT");
		
		try{
			Map map = new TreeMap();
			map.put("orderby", orderby);
			map.put("status", status);
			
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
			
			list = askSearchManager.getAskByPage(pager, iPageNo, user.getUid().toString(), null, status, null, orderby);
				//userFriendManager.getUserFriendByPage( pager, iPageNo, user.getId().toString(), orderby);

			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "ASK_LIST", list);
			
			System.out.println(" ClientManageAskAction list = "+list.size());
			
			return mapping.findForward("unsolved");
		}catch( Exception e ){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward answer(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String pageNo  = request.getParameter("pno");
		String orderby = request.getParameter("orderby");
		
		UcMembers user 	   = (UcMembers)request.getSession().getAttribute("CLIENT");
		
		try{
			Map map = new TreeMap();
			map.put("orderby", orderby);

			
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
			
			list = askSearchManager.getAskByAnswerAndPage(pager, iPageNo, user.getUid().toString(), orderby );
				//userFriendManager.getUserFriendByPage( pager, iPageNo, user.getId().toString(), orderby);

			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "ASK_LIST", list);
			
			System.out.println(" ClientManageAskAction list = "+list.size());
			
			return mapping.findForward("answer");
		}catch( Exception e ){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	/*public ActionForward del(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String []	  ids  = request.getParameterValues("askid");
		//String returnUrl = request.getParameter("returnUrl");
		
		try{
			for(int i=0; i<ids.length; i++) {
				Ask ask = askSearchManager.getAsk( Integer.parseInt(ids[i]) );
				
			}
					
		//request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]") );
		return mapping.findForward("ok");
				
			
		}catch( Exception e ){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}*/


	public AskSearchManager getAskSearchManager() {
		return askSearchManager;
	}


	public void setAskSearchManager(AskSearchManager askSearchManager) {
		this.askSearchManager = askSearchManager;
	}


	
}