package com.forbes.hibernate.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.forbes.hibernate.basedao.BaseFavoriteDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * Favorite entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.forbes.hibernate.Favorite
 * @author MyEclipse Persistence Tools
 */

public class FavoriteDAO extends BaseFavoriteDAO {
	private static final Log log = LogFactory.getLog(FavoriteDAO.class);
	// property constants
	
	public int getCount(String typeid, String objectid) {
		
		try {			
			String queryString = "SELECT COUNT(*) FROM Favorite AS model WHERE model.objectId = ? AND model.favoriteType = ? ";			
						
			org.hibernate.Query query = getSession().createQuery(queryString);	
			query.setParameter(0, objectid);
			query.setParameter(1, typeid);

			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	
	public int getCountFavorite(Integer userId, Short typeid, String keyword ) {
		if (keyword == null) keyword = "";
		try {

			String queryString = "";
			
			if(typeid == 1)
				queryString = "SELECT COUNT(art) FROM Favorite AS fav, Article as art " +
					"WHERE fav.userId = ? AND fav.favoriteType = 1 AND fav.objectId = art.id AND art.title LIKE ? ";
			
			if(typeid == 2)
				queryString = "SELECT COUNT(news) FROM Favorite AS fav, News as news " +
					"WHERE fav.userId = ? AND fav.favoriteType = 2 AND fav.objectId = news.id AND news.title LIKE ? ";
			
			if(typeid == 3)
				queryString = "SELECT COUNT(video) FROM Favorite AS fav, Video as video " +
					"WHERE fav.userId = ? AND fav.favoriteType = 3 AND fav.objectId = video.id AND video.title LIKE ? ";
			
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userId );
			query.setParameter(1, "%" + keyword + "%" );
			
			return Integer.parseInt("" + query.list().get(0));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findFavoriteByPage(Integer userId, Short typeid, String keyword, int beg, int len) {
		try {
			if (keyword == null) keyword = "";
			String queryString = "";
			
			if(typeid == 1)
				queryString = "SELECT art, fav FROM Favorite AS fav, Article as art " +
					"WHERE fav.userId = ? AND fav.favoriteType = 1 AND fav.objectId = art.id AND art.title LIKE ? ";
			
			if(typeid == 2)
				queryString = "SELECT news, fav FROM Favorite AS fav, News as news " +
					"WHERE fav.userId = ? AND fav.favoriteType = 2 AND fav.objectId = news.id AND news.title LIKE ? ";
			
			if(typeid == 3)
				queryString = "SELECT video, fav FROM Favorite AS fav, Video as video " +
					"WHERE fav.userId = ? AND fav.favoriteType = 3 AND fav.objectId = video.id AND video.title LIKE ? ";
			
			org.hibernate.Query query = getSession().createQuery(queryString);
			query.setParameter(0, userId );
			query.setParameter(1, "%" + keyword + "%" );
			query.setFirstResult(beg);
			query.setMaxResults(len);
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
}