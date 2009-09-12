package com.forbes.struts.action.index;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.service.article.NewsManager;

public class IndexNewsListAction extends DispatchAction {

	private NewsManager newsManager;
	
	public ActionForward top(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		try {
			List list = newsManager.getTopNews("pubdate DESC", 1, 5);
			request.setAttribute("NEWS_LIST", list);
			return mapping.findForward("top");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}

	public NewsManager getNewsManager() {
		return newsManager;
	}

	public void setNewsManager(NewsManager newsManager) {
		this.newsManager = newsManager;
	}

	public ActionForward first(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		try {
			List list = newsManager.getTopNews("pubdate DESC", 0, 1);
			request.setAttribute("NEWS_LIST", list);
			return mapping.findForward("first");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}

}