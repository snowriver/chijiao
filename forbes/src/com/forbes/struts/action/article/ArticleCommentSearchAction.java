package com.forbes.struts.action.article;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.hibernate.bean.Article;
import com.forbes.service.article.ArticleListManager;
import com.forbes.service.article.CommentManager;
import com.forbes.util.Pager;

public class ArticleCommentSearchAction extends DispatchAction {

	private CommentManager commentManager;

	private ArticleListManager articleListManager;

	public ActionForward top(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");
		try {
			List list = commentManager.
				getTopComment(new Short("1"), Integer.parseInt(id), null, 0, 10);

			request.setAttribute("ARTICLE_COMMENT_LIST", list);
			return mapping.findForward("top");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}

	public CommentManager getCommentManager() {
		return commentManager;
	}

	public void setCommentManager(CommentManager commentManager) {
		this.commentManager = commentManager;
	}

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String orderby = "pubdate DESC";
		String pageNo = request.getParameter("pno");
		String id = request.getParameter("id");

		Map map = new TreeMap();
		map.put("id", id);
		map.put("orderby", orderby);
		request.setAttribute("PARA", map);

		int iPageNo = 1;
		try {
			if (pageNo != null) {
				iPageNo = Integer.parseInt(pageNo);
			}
		} catch (Exception e) {
		}

		List list = null;
		Pager pager = new Pager();
		pager.setCntOfPage(5);
		pager.setCurPage(iPageNo);

		try {

			Article article = articleListManager.getArticle(Integer.parseInt(id));
			request.setAttribute("ARTICLE", article);

			list = commentManager.getCommentByPage(pager, iPageNo, 
					new Short("1"), Integer.parseInt(id), orderby);

			request.setAttribute("ARTICLE_COMMENT_LIST", list);
			request.setAttribute("PAGER", pager);
			return mapping.findForward("list");

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