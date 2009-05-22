/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.forbes.util.Constant;
import com.forbes.util.ToHtml;


/** 
 * MyEclipse Struts
 * Creation date: 09-20-2008
 * 
 * XDoclet definition:
 * @struts.action scope="request" validate="true"
 */
public class AdminTohtmlAction extends Action {
	/*
	 * Generated Methods
	 */
	
	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String serviceIDs[] = request.getParameterValues("serviceID");

		for(int i=0; i<serviceIDs.length; i++) {
			
			String serviceID = serviceIDs[i];
			//生成静态页面
			System.out.println("serviceID=" + Constant.FORBES_URL + "/" +serviceID);
			try {
				boolean flag = ToHtml.toHtml(Constant.FORBES_URL + "/" +serviceID,
						request.getRealPath("/") + "index.html");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		request.setAttribute( "OK_MESSAGE", "成功生成静态页面！" );
		request.setAttribute( "RETURN_URL", "to_html.jsp" );
		return mapping.findForward("ok");
	 	
	}
		
	
}