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
import com.forbes.service.basic.BulletinManager;
import com.forbes.util.Pager;



/** 
 * MyEclipse Struts
 * Creation date: 09-20-2008
 * 
 * XDoclet definition:
 * @struts.action scope="request" validate="true"
 */
public class AdminManageBulletinAction extends DispatchAction {
	
	private BulletinManager bulletinManager;	
	
	public BulletinManager getBulletinManager() {
		return bulletinManager;
	}

	public void setBulletinManager(BulletinManager bulletinManager) {
		this.bulletinManager = bulletinManager;
	}
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
		String keyword   = request.getParameter("keyword");
		String orderby   = request.getParameter("orderby");
		String pageNo    = request.getParameter("pno");

		String parameter = "keyword=" + ( (keyword==null)?" ":keyword );
		
		Map map = new TreeMap();
		map.put("keyword", keyword);
		map.put("orderby", orderby);
		
		try {			
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
			
			list = bulletinManager.getBulletinByPage(pager, iPageNo, keyword, orderby);

			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "BULLETIN_LIST", list);
			
			System.out.println(list.size());
			
			return mapping.findForward("list");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}

	
	
	
	
}