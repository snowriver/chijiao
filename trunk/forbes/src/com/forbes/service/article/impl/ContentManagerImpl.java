package com.forbes.service.article.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Content;
import com.forbes.hibernate.bean.ContentType;
import com.forbes.hibernate.dao.ContentDAO;
import com.forbes.hibernate.dao.ContentTypeDAO;
import com.forbes.service.article.ContentManager;
import com.forbes.util.Pager;


public class ContentManagerImpl implements ContentManager {
	
	
	
	private ContentDAO contentDAO;
	
	private ContentTypeDAO contentTypeDAO;

	public void addContent(Content content) {
		contentDAO.save(content);
	}
	
	public void deleteContent(Content content) {
		contentDAO.delete(content);
	}
	
	public Content getContent(Long id) {
		return contentDAO.findById(id);
	}

	public void updateContent(Content content) {
		contentDAO.attachDirty(content);
	}


	public ContentDAO getContentDAO() {
		return contentDAO;
	}


	public void setContentDAO(ContentDAO contentDAO) {
		this.contentDAO = contentDAO;
	}
	
	public List getContentByPage( Pager pager, int pageNo, Short contentType, Integer objectId, String orderby ) throws ForbesException{
		try {			
			pager.setTotoalCnt(contentDAO.getCount(contentType, objectId));
			List list = contentDAO.findContentByPage(contentType, objectId, orderby, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getTopContent( Short contentType, Integer objectId, String orderby, int begin, int length ) throws ForbesException{
		try {
			List list = contentDAO.findContent(contentType, objectId, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getContent( Short contentType, Integer objectId ) throws ForbesException{
		try {
			List list = contentDAO.findContent(contentType, objectId);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public int getCount( Integer userId, Short contentType, Integer objectId ) throws ForbesException{
		try {
			return contentDAO.getCount(userId, contentType, objectId);
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public ContentTypeDAO getContentTypeDAO() {
		return contentTypeDAO;
	}

	public void setContentTypeDAO(ContentTypeDAO contentTypeDAO) {
		this.contentTypeDAO = contentTypeDAO;
	}
	
	public ContentType getContentType(Short id) {
		return contentTypeDAO.findById(id);
	}
	
	
}
