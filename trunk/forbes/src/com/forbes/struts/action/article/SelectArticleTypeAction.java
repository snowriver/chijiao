package com.forbes.struts.action.article;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.service.article.ArticleTypeManager;

public class SelectArticleTypeAction extends DispatchAction {
	
	private ArticleTypeManager articleTypeManager;
	
	public ActionForward select(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {		
		try {			
			List list = articleTypeManager.getAllArticleType();
			request.setAttribute( "ARTICLE_TYPE_LIST", list);
			request.setAttribute( "TYPEID", request.getParameter("typeid"));
			request.setAttribute( "SELBTN", request.getParameter("selbtn"));			
			return mapping.findForward("select");
		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	
	public ArticleTypeManager getArticleTypeManager() {
		return articleTypeManager;
	}
	public void setArticleTypeManager(ArticleTypeManager articleTypeManager) {
		this.articleTypeManager = articleTypeManager;
	}
	
}