/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.admin;

import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.forbes.hibernate.bean.AskType;
import com.forbes.service.ask.AskTypeManager;
import com.forbes.util.Pager;
import com.forbes.util.UrlTool;


/** 
 * MyEclipse Struts
 * Creation date: 09-20-2008
 * 
 * XDoclet definition:
 * @struts.action scope="request" validate="true"
 */
public class AdminManageAskTypeAction extends DispatchAction {
	/*
	 * Generated Methods
	 */
	private AskTypeManager askTypeManager;
	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String pageNo    = request.getParameter("pno");
		
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
		
			list = askTypeManager.getTopAskTypeByPage(pager, iPageNo);
			//List all = askTypeManager.getTopAskType();
			
			request.setAttribute( "PAGER", pager );
			//request.setAttribute( "TOP_ASK_TYPE", all );
			request.setAttribute( "ASK_TYPE_LIST", list);
			return mapping.findForward("list");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		
		String pid       	= request.getParameter("pid");
		String name      	= request.getParameter("name");
		String disorder  	= request.getParameter("disorder");
		String issend    	= request.getParameter("issend");
		String description  = request.getParameter("description");
		String keywords 	 = request.getParameter("keywords");
		String returnUrl 	= request.getParameter("returnUrl");
		
		try {
		
			if ( pid.equals("0")) {
				AskType c = new AskType();
				c.setName(name);
				c.setPid(0);
				c.setDisorder(Integer.parseInt(disorder));
				c.setIssend(issend);
				c.setDescription(description);
				c.setKeywords(keywords);
				askTypeManager.addAskType(c);
				request.setAttribute( "OK_MESSAGE", "�����ʴ����ͳɹ���");
			}
			else {
				AskType c = new AskType();
				c.setName(name);
				c.setPid(Integer.parseInt(pid));
				c.setDisorder(Integer.parseInt(disorder));
				c.setIssend(issend);
				c.setDescription(description);
				c.setKeywords(keywords);
				askTypeManager.addAskType(c);
				request.setAttribute( "OK_MESSAGE", "�����ʴ����ͳɹ���");
			}
			
			
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]"));
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
	
	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		
		String id        = request.getParameter("id");
		String name      = request.getParameter("name");
		String disorder  = request.getParameter("disorder");
		String issend    	= request.getParameter("issend");
		String description  = request.getParameter("description");
		String keywords 	 = request.getParameter("keywords");
		String returnUrl = request.getParameter("returnUrl");
		
		try {
			
			AskType c = askTypeManager.getAskType(Integer.parseInt(id));
			
			c.setName(name);
			c.setDisorder(Integer.parseInt(disorder));
			c.setIssend(issend);
			c.setDescription(description);
			c.setKeywords(keywords);
			
			askTypeManager.updateAskType(c);
			request.setAttribute( "OK_MESSAGE", "�޸��ʴ����ͳɹ���");			
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]"));
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		
		String id       = request.getParameter("id");
		String returnUrl = request.getParameter("returnUrl");
		
		try {
		
			AskType c = askTypeManager.getAskType(Integer.parseInt(id));
			System.out.println( "cid=" + c.getId() + "\tcname=" + c.getName() + "\tcpid=" + c.getPid());
			if (c.getPid() == 0) {
				
				Set <AskType> askTypes = c.getAskTypes();
				for( AskType askType : askTypes ){
					System.out.println( "cityid=" + askType.getId() + "\tcityname=" + askType.getName() + "\tcitypid=" + askType.getPid());
					askTypeManager.deleteAskType(askType);
				}
				askTypeManager.deleteAskType(c);
				request.setAttribute( "OK_MESSAGE", "ɾ���ʴ����ͳɹ���");
			}
			else {
				
				askTypeManager.deleteAskType(c);
				request.setAttribute( "OK_MESSAGE", "ɾ���ʴ����ͳɹ���");
			}
			
			
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]"));
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}

	public AskTypeManager getAskTypeManager() {
		return askTypeManager;
	}

	public void setAskTypeManager(AskTypeManager askTypeManager) {
		this.askTypeManager = askTypeManager;
	}

	
	public ActionForward get(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		
		String id        = request.getParameter("id");
		String returnUrl = request.getParameter("returnUrl");
		
		try {
			
			AskType c = askTypeManager.getAskType(Integer.parseInt(id));

			request.setAttribute( "ASK_TYPE", c);
			request.setAttribute( "RETURN_URL", returnUrl);
			return mapping.findForward("get");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}


	public ActionForward move_get(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String id        = request.getParameter("id");
		String returnUrl = request.getParameter("returnUrl");

		try {
			AskType c = askTypeManager.getAskType(Integer.parseInt(id));
			List all = askTypeManager.getAskType();
			
			request.setAttribute( "ASK_TYPE", c);
			request.setAttribute( "ASK_TYPE_LIST", all );
			request.setAttribute( "RETURN_URL", returnUrl );
			return mapping.findForward("move_get");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
	
	public ActionForward move(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String id        = request.getParameter("id").trim();
		String pid       = request.getParameter("pid").trim();
		String returnUrl = request.getParameter("returnUrl");
		
		if(id.equals(pid)) {
			request.setAttribute( "OK_MESSAGE", "�ƶԶ����Ŀ��λ����ͬ����");
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]") );
			return mapping.findForward("ok");
		}

		try {
			AskType c = askTypeManager.getAskType(Integer.parseInt(id));
			c.setPid(Integer.parseInt(pid));
			askTypeManager.updateAskType(c);
			
			request.setAttribute( "OK_MESSAGE", "�ƶ��ʴ����ͳɹ���");
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]") );
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
}