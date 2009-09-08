package com.forbes.struts.action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.forbes.listener.ArticleImportStatus;

public class AdminImportArticleProgressAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ArticleImportStatus status = (ArticleImportStatus) session.getAttribute("ARTICLE_IMPORT_STATUS");
		
			//response.reset();
			/*
			 * response.getWriter().write("{\"pBytesRead\":"
			 * +status.getPBytesRead()+",\"pContentLength\":"+status.getPContentLength()+"}");
			 */
		/*System.out.println("{\"totalCnt\":" +status.getTotalCnt()
				+",\"importCnt\":"+status.getImportCnt()
				+",\"currentCnt\":"+status.getCurrentCnt()
				+",\"failCnt\":"+status.getFailCnt()
				+",\"repeatCnt\":"+status.getRepeatCnt()+"}");*/
		request.setAttribute("MESSAGE", "{\"totalCnt\":" +status.getTotalCnt()
				+",\"importCnt\":"+status.getImportCnt()
				+",\"currentCnt\":"+status.getCurrentCnt()
				+",\"failCnt\":"+status.getFailCnt()
				+",\"repeatCnt\":"+status.getRepeatCnt()+"}");
		

		return mapping.findForward("ok");
	}
}