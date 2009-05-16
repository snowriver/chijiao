package com.forbes.service.ucenter;

import java.util.List;

import com.forbes.hibernate.dao.CdbForumsDAO;
import com.forbes.hibernate.dao.CdbThreadsDAO;
import com.forbes.hibernate.dao.UchomeBlogDAO;
import com.forbes.hibernate.dao.UchomeDoingDAO;
import com.forbes.hibernate.dao.UchomeFeedDAO;
import com.forbes.hibernate.dao.UchomeMtagDAO;

public interface UcbbsManager {
	
	public CdbThreadsDAO getCdbThreadsDAO();

	public void setCdbThreadsDAO(CdbThreadsDAO cdbThreadsDAO);

	public CdbForumsDAO getCdbForumsDAO();

	public void setCdbForumsDAO(CdbForumsDAO cdbForumsDAO);
	
	public List getCdbForums( String fup, String type, String status, String orderby, int begin, int length );
	
	public List getCdbThreads( String orderby, int begin, int length );


}
