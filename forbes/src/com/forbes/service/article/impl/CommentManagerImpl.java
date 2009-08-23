package com.forbes.service.article.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Comment;
import com.forbes.hibernate.bean.CommentType;
import com.forbes.hibernate.dao.CommentDAO;
import com.forbes.hibernate.dao.CommentTypeDAO;
import com.forbes.service.article.CommentManager;
import com.forbes.util.Pager;


public class CommentManagerImpl implements CommentManager {
	
	
	
	private CommentDAO commentDAO;
	
	private CommentTypeDAO commentTypeDAO;

	public void addComment(Comment comment) {
		commentDAO.save(comment);
	}
	
	public void deleteComment(Comment Comment) {
		commentDAO.delete(Comment);
	}
	
	public Comment getComment(Long id) {
		return commentDAO.findById(id);
	}

	public void updateComment(Comment comment) {
		commentDAO.attachDirty(comment);
	}


	public CommentDAO getCommentDAO() {
		return commentDAO;
	}


	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}
	
	public List getCommentByPage( Pager pager, int pageNo, Short commentType, Integer objectId, String orderby ) throws ForbesException{
		try {			
			pager.setTotoalCnt(commentDAO.getCount(commentType, objectId));
			List list = commentDAO.findCommentByPage(commentType, objectId, orderby, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getTopComment( Short commentType, Integer objectId, String orderby, int begin, int length ) throws ForbesException{
		try {
			List list = commentDAO.findComment(commentType, objectId, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getComment( Short commentType, Integer objectId ) throws ForbesException{
		try {
			List list = commentDAO.findComment(commentType, objectId);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public int getCount( Integer userId, Short commentType, Integer objectId ) throws ForbesException{
		try {
			return commentDAO.getCount(userId, commentType, objectId);
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public CommentTypeDAO getCommentTypeDAO() {
		return commentTypeDAO;
	}

	public void setCommentTypeDAO(CommentTypeDAO commentTypeDAO) {
		this.commentTypeDAO = commentTypeDAO;
	}
	
	public CommentType getCommentType(Short id) {
		return commentTypeDAO.findById(id);
	}
	
	
}
