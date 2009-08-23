package com.forbes.struts.action.article;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Comment;
import com.forbes.service.article.CommentManager;

public class CommentDeleteAction extends Action {

	private CommentManager commentManager;

	public CommentManager getCommentManager() {
		return commentManager;
	}

	public void setCommentManager(CommentManager commentManager) {
		this.commentManager = commentManager;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws ForbesException {

		String id = request.getParameter("id");

		try {
			Comment ac = commentManager.getComment(Long.parseLong(id));
			commentManager.deleteComment(ac);
			request.setAttribute("RESULT_MESSAGE", "SUCCESS");
			return mapping.findForward("ok");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("RESULT_MESSAGE", "FAIL");
			return mapping.findForward("ok");
		}

	}

}