package com.forbes.service.ucenter.impl;

import java.util.*;

import com.forbes.hibernate.bean.UchomeBlogfield;
import com.forbes.hibernate.dao.UchomeBlogDAO;
import com.forbes.hibernate.dao.UchomeBlogFilterDAO;
import com.forbes.hibernate.dao.UchomeBlogfieldDAO;
import com.forbes.service.ucenter.UchomeBlogManager;


public class UchomeBlogManagerImpl implements UchomeBlogManager {
	
	public UchomeBlogFilterDAO uchomeBlogFilterDAO;
	
	private UchomeBlogDAO uchomeBlogDAO;
	
	private UchomeBlogfieldDAO uchomeBlogfieldDAO;
	
	public UchomeBlogDAO getUchomeBlogDAO() {
		return uchomeBlogDAO;
	}

	public void setUchomeBlogDAO(UchomeBlogDAO uchomeBlogDAO) {
		this.uchomeBlogDAO = uchomeBlogDAO;
	}

	public UchomeBlogfieldDAO getUchomeBlogfieldDAO() {
		return uchomeBlogfieldDAO;
	}

	public void setUchomeBlogfieldDAO(UchomeBlogfieldDAO uchomeBlogfieldDAO) {
		this.uchomeBlogfieldDAO = uchomeBlogfieldDAO;
	}

	public UchomeBlogFilterDAO getUchomeBlogFilterDAO() {
		return uchomeBlogFilterDAO;
	}

	public void setUchomeBlogFilterDAO(UchomeBlogFilterDAO uchomeBlogFilterDAO) {
		this.uchomeBlogFilterDAO = uchomeBlogFilterDAO;
	}

	public List getAllBlogFilter() {
		return uchomeBlogFilterDAO.findAll();
	}

	public List getAllBlogfield() {
		return uchomeBlogfieldDAO.findAll();
	}
	
	public List getUchomeBlog( String orderby, int begin, int length ){
		try{
			List blogList = uchomeBlogDAO.findTopUchomeBlog( orderby, begin, length );

			return blogList;
		}catch( Exception e ){
			e.printStackTrace();
			return null;
		}
	}
	
	public void updateUchomeBlogfield( UchomeBlogfield uchomeBlogfield ) {
		uchomeBlogfieldDAO.merge(uchomeBlogfield);
	}
	
}
