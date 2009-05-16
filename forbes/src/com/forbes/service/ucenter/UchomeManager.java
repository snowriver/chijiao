package com.forbes.service.ucenter;

import java.util.List;

import com.forbes.hibernate.dao.UchomeBlogDAO;
import com.forbes.hibernate.dao.UchomeDoingDAO;
import com.forbes.hibernate.dao.UchomeFeedDAO;
import com.forbes.hibernate.dao.UchomeMtagDAO;

public interface UchomeManager {
	
	public UchomeMtagDAO getUchomeMtagDAO();

	public void setUchomeMtagDAO(UchomeMtagDAO uchomeMtagDAO);
	
	public UchomeFeedDAO getUchomeFeedDAO();

	public void setUchomeFeedDAO(UchomeFeedDAO uchomeFeedDAO);
	
	public UchomeDoingDAO getUchomeDoingDAO();

	public void setUchomeDoingDAO(UchomeDoingDAO uchomeDoingDAO);
	
	public UchomeBlogDAO getUchomeBlogDAO();

	public void setUchomeBlogDAO(UchomeBlogDAO uchomeBlogDAO);
	
	public List getUchomeMtags( String orderby, int begin, int length );
	
	public List getUchomeFeeds( String orderby, int begin, int length );
	
	public List getUchomeDoings( String orderby, int begin, int length );
	
	public List getUchomeBlogs( String orderby, int begin, int length );
}
