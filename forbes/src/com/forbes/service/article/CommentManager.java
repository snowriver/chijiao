package com.forbes.service.article;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Comment;
import com.forbes.hibernate.bean.CommentType;
import com.forbes.hibernate.dao.CommentDAO;
import com.forbes.hibernate.dao.CommentTypeDAO;
import com.forbes.util.Pager;

public interface CommentManager {

	public List getCommentByPage( Pager pager, int pageNo, Short commentType, Integer objectId, String orderby ) throws ForbesException;
	
	public void addComment(Comment comment);
	
	public void deleteComment(Comment comment);
	
	public Comment getComment(Long id);
	
	public void updateComment(Comment comment);
	
	public CommentDAO getCommentDAO();

	public void setCommentDAO(CommentDAO commentDAO);
	
	public List getTopComment( Short commentType, Integer objectId, String orderby, int begin, int length )throws ForbesException;
	
	public List getComment(Short commentType,  Integer objectId ) throws ForbesException;
	
	public int getCount( Integer userId, Short commentType, Integer objectId ) throws ForbesException;
	
	public CommentTypeDAO getCommentTypeDAO();

	public void setCommentTypeDAO(CommentTypeDAO commentTypeDAO);
	
	public CommentType getCommentType(Short id);
}
