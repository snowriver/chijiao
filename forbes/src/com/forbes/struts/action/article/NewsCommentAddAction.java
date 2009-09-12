package com.forbes.struts.action.article;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Comment;
import com.forbes.hibernate.bean.CommentType;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.service.article.CommentManager;

public class NewsCommentAddAction extends Action {

	private CommentManager commentManager;

	public CommentManager getCommentManager() {
		return commentManager;
	}

	public void setCommentManager(CommentManager commentManager) {
		this.commentManager = commentManager;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws ForbesException, Exception {
		
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String content = request.getParameter("content");

		UcMembers user = (UcMembers) request.getSession()
				.getAttribute("CLIENT");

		CommentType commentType = commentManager.getCommentType(new Short("2"));

		int commentCnt = commentManager.getCount(user.getUid(), commentType
				.getId(), Integer.parseInt(id));

		if (commentCnt <= 1) {
			// Ìí¼ÓÆÀÂÛ
			try {			
				Comment ac = new Comment();
				ac.setUser(user);
				ac.setUsername(user.getUsername());
				ac.setCommentType(commentType);
				ac.setObjectId(Integer.parseInt(id));
				ac.setContent(content);
				ac.setIp(request.getRemoteAddr());
				ac.setPubdate(new Date());
				commentManager.addComment(ac);
				request.setAttribute("RESULT_MESSAGE", "SUCCESS");				
				return mapping.findForward("ok");
			} catch (Exception e) {
				request.setAttribute("RESULT_MESSAGE", "FAIL");
				e.printStackTrace();
				return mapping.findForward("ok");
			}

		} else {
			request.setAttribute("RESULT_MESSAGE", "ALREADY");
			return mapping.findForward("ok");
		}
	}

}