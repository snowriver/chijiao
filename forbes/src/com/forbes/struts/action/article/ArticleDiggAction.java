package com.forbes.struts.action.article;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.hibernate.bean.Article;
import com.forbes.service.article.ArticleListManager;

public class ArticleDiggAction extends Action {

	private ArticleListManager articleListManager;

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");

		System.out.print(" Digg id = " + id);
		try {

			Article article = articleListManager.getArticle(Integer.parseInt(id));
			article.setDigg(article.getDigg() + 1);
			article.setDiggtime(new Date());
			articleListManager.updateArticle(article);

			// 添加cookie
			/*
			 * try {
			 * 
			 * Cookie c = new Cookie("FORBES_USER_DIGG", "");
			 * c.setMaxAge(60*60*24*365); response.addCookie(c);
			 *  } catch(Exception e) { e.printStackTrace(); }
			 */

			request.setAttribute("RESULT_MESSAGE", article.getDigg());

			return mapping.findForward("ok");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}

	public ArticleListManager getArticleListManager() {
		return articleListManager;
	}

	public void setArticleListManager(ArticleListManager articleListManager) {
		this.articleListManager = articleListManager;
	}

}