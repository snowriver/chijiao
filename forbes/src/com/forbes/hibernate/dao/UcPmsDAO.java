package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.forbes.hibernate.basedao.BaseUcPmsDAO;

/**
 * A data access object (DAO) providing persistence and search support for UcPms
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.forbes.hibernate.bean.UcPms
 * @author MyEclipse Persistence Tools
 */

public class UcPmsDAO extends BaseUcPmsDAO {
	private static final Log log = LogFactory.getLog(UcPmsDAO.class);

	// property constants

	public int getCount(String msgfromid, String msgtoid, String folder,
			String new_, String dateline, String delstatus, String related,
			String fromappid) {
		try {

			String queryString = "SELECT COUNT(pm) FROM UcPms AS pm WHERE pm.pmid is not null ";

			if (msgfromid != null && msgfromid.length()>0)
				queryString += "AND pm.msgfromid = " + msgfromid + " ";
			
			if (msgtoid != null && msgtoid.length()>0)
				queryString += "AND pm.msgtoid = " + msgtoid + " ";
			
			if (folder != null && folder.length()>0)
				queryString += "AND pm.folder = '" + folder + "' ";

			if (new_ != null && new_.length()>0)
				queryString += "AND pm.new_ = " + new_ + " ";
			
			if (delstatus != null && delstatus.length()>0)
				queryString += "AND pm.delstatus in( " + delstatus + ") ";
			
			if (related != null && related.length()>0)
				queryString += "AND pm.related = " + related + " ";
			
			if (fromappid != null && fromappid.length()>0)
				queryString += "AND pm.fromappid = " + fromappid + " ";

			
			org.hibernate.Query query = getSession().createQuery(queryString);

			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List getUcPmsByPage(String msgfromid, String msgtoid, String folder,
			String new_, String dateline, String delstatus, String related,
			String fromappid, String orderby, int beg, int len) {
		try {
			if (orderby == null || orderby.equals("")) 
				orderby = "pmid DESC ";
			
			String queryString = "SELECT pm FROM UcPms AS pm WHERE pm.pmid is not null ";

			if (msgfromid != null && msgfromid.length()>0)
				queryString += "AND pm.msgfromid = " + msgfromid + " ";
			
			if (msgtoid != null && msgtoid.length()>0)
				queryString += "AND pm.msgtoid = " + msgtoid + " ";
			
			if (folder != null && folder.length()>0)
				queryString += "AND pm.folder = '" + folder + "' ";

			if (new_ != null && new_.length()>0)
				queryString = "AND pm.new_ = " + new_ + " ";
			
			if (delstatus != null && delstatus.length()>0)
				queryString += "AND pm.delstatus in(" + delstatus + ") ";
			
			if (related != null && related.length()>0)
				queryString += "AND pm.related = " + related + " ";
			
			if (fromappid != null && fromappid.length()>0)
				queryString += "AND pm.fromappid = " + fromappid + " ";

			queryString += "ORDER BY pm." + orderby;
			
			//System.out.println("queryString = " + queryString);
			org.hibernate.Query query = getSession().createQuery(queryString);
			

			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
}