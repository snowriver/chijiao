package com.forbes.service.article;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Content;
import com.forbes.hibernate.bean.ContentType;
import com.forbes.hibernate.dao.ContentDAO;
import com.forbes.hibernate.dao.ContentTypeDAO;
import com.forbes.util.Pager;

public interface ContentManager {

	public List getContentByPage( Pager pager, int pageNo, Short contentType, Integer objectId, String orderby ) throws ForbesException;
	
	public void addContent(Content content);
	
	public void deleteContent(Content content);
	
	public Content getContent(Long id);
	
	public void updateContent(Content content);
	
	public ContentDAO getContentDAO();

	public void setContentDAO(ContentDAO contentDAO);
	
	public List getTopContent( Short contentType, Integer objectId, String orderby, int begin, int length )throws ForbesException;
	
	public List getContent(Short contentType,  Integer objectId ) throws ForbesException;
	
	public int getCount( Integer userId, Short contentType, Integer objectId ) throws ForbesException;
	
	public ContentTypeDAO getContentTypeDAO();

	public void setContentTypeDAO(ContentTypeDAO contentTypeDAO);
	
	public ContentType getContentType(Short id);
}
