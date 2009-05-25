/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.admin;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.forbes.hibernate.bean.AskType;
import com.forbes.hibernate.bean.UserLevel;
import com.forbes.service.ask.AskTypeManager;
import com.forbes.service.user.UserLevelManager;
import com.forbes.util.Pager;
import com.forbes.util.UrlTool;


/** 
 * MyEclipse Struts
 * Creation date: 09-20-2008
 * 
 * XDoclet definition:
 * @struts.action scope="request" validate="true"
 */
public class AdminManageUserLevelAction extends DispatchAction {
	/*
	 * Generated Methods
	 */
	private UserLevelManager userLevelManager;
	
	
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

		System.out.print("userLevel");
		String pageNo    = request.getParameter("pno");
		//String keyword   = request.getParameter("keyword");
		String keyword   = null;
		
		String parameter = "keyword=" + ( (keyword==null)?" ":keyword );
		
		Map map = new TreeMap();
		map.put("keyWord", keyword);
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
		
			list = userLevelManager.getUserLevelByPage(pager, iPageNo, keyword);
			//List all = askTypeManager.getTopAskType();
			
			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			//request.setAttribute( "TOP_ASK_TYPE", all );
			request.setAttribute( "USER_LEVEL_LIST", list);
			System.out.println(list.size());
			return mapping.findForward("list");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String returnUrl   	= request.getParameter("returnUrl");
		String level       	= request.getParameter("level");
		String startScore	= request.getParameter("startScore");
		String endScore  	= request.getParameter("endScore");
		String title    	= request.getParameter("title");

		
		try {
		
				UserLevel al = new UserLevel();
				al.setLevel(new Short(level));
				al.setStartScore(Integer.parseInt(startScore));
				al.setEndScore(Integer.parseInt(endScore));
				al.setTitle(title);
				userLevelManager.addUserLevel(al);
				request.setAttribute( "OK_MESSAGE", "�����û�����ɹ���");
			
			
			
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
		String returnUrl = request.getParameter("returnUrl");
		try{
			String levelID     = request.getParameter("levelID");
			String userlevelId = ""; //`
			System.out.println(levelID);
			String levelIDs [] = levelID.split("`");
			
			for(int i=0; i<levelIDs.length; i++) {
				userlevelId = levelIDs[i];
				System.out.println(userlevelId);

				UserLevel userLevel = userLevelManager.getUserLevel(new Short(userlevelId));
				userLevelManager.deleteUserLevel(userLevel);
			}
			
		
		}catch( Exception e ){
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
		
		request.setAttribute( "OK_MESSAGE", "ɾ���ȼ��ɹ���" );
		request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]") );
		return mapping.findForward("ok");
	}
	

	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String returnUrl   	= request.getParameter("returnUrl");
		String level       	= request.getParameter("level");
		String startScore	= request.getParameter("startScore");
		String endScore  	= request.getParameter("endScore");
		String title    	= request.getParameter("title");
		String id	    	= request.getParameter("id");
		
		try {
		
				UserLevel al = userLevelManager.getUserLevel(new Short(id));
				al.setLevel(new Short(level));
				al.setStartScore(Integer.parseInt(startScore));
				al.setEndScore(Integer.parseInt(endScore));
				al.setTitle(title);
				userLevelManager.updateUserLevel(al);
				request.setAttribute( "OK_MESSAGE", "�޸��û�����ɹ���");
			
			
			
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]"));
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}


	public UserLevelManager getUserLevelManager() {
		return userLevelManager;
	}


	public void setUserLevelManager(UserLevelManager userLevelManager) {
		this.userLevelManager = userLevelManager;
	}


	
	
}