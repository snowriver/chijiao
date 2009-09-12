package com.forbes.struts.action.article;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.hibernate.bean.Article;
import com.forbes.service.article.ArticleListManager;


public class ArticleViewAction extends Action {
	
	private ArticleListManager articleListManager;

	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String  id = request.getParameter("id");
		try {
			
			Article article = articleListManager.getArticle(Integer.parseInt(id));
			if(article == null)
				return mapping.findForward("error");
			article.setClick(article.getClick() + 1);
			articleListManager.updateArticle(article);
			request.setAttribute( "ARTICLE", article);
			
			Article nextArticle  = articleListManager.getNextArticle(Integer.parseInt(id));
			Article preArticle   = articleListManager.getPreArticle(Integer.parseInt(id));
			
			request.setAttribute( "NEXT_ARTICLE", nextArticle);
			request.setAttribute( "PRE_ARTICLE", preArticle);
			
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("error");
		}
	}

	public ArticleListManager getArticleListManager() {
		return articleListManager;
	}
	public void setArticleListManager(ArticleListManager articleListManager) {
		this.articleListManager = articleListManager;
	}
	
}