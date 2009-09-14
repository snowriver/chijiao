package com.forbes.service.ucenter;

import java.util.List;

import com.forbes.hibernate.bean.UchomeBlogfield;
import com.forbes.hibernate.dao.UchomeBlogDAO;
import com.forbes.hibernate.dao.UchomeBlogFilterDAO;
import com.forbes.hibernate.dao.UchomeBlogfieldDAO;

public interface UchomeBlogManager {

	public UchomeBlogDAO getUchomeBlogDAO();

	public void setUchomeBlogDAO(UchomeBlogDAO uchomeBlogDAO);

	public UchomeBlogfieldDAO getUchomeBlogfieldDAO();

	public void setUchomeBlogfieldDAO(UchomeBlogfieldDAO uchomeBlogfieldDAO);

	public UchomeBlogFilterDAO getUchomeBlogFilterDAO();

	public void setUchomeBlogFilterDAO(UchomeBlogFilterDAO uchomeBlogFilterDAO);

	public List getAllBlogFilter();

	public List getAllBlogfield();
	
	public List getUchomeBlog( String orderby, int begin, int length );
	
	public void updateUchomeBlogfield( UchomeBlogfield uchomeBlogfield );
	
}
