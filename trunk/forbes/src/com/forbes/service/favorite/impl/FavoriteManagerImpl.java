package com.forbes.service.favorite.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.City;
import com.forbes.hibernate.bean.Favorite;
import com.forbes.hibernate.bean.FavoriteType;
import com.forbes.hibernate.dao.CityDAO;
import com.forbes.hibernate.dao.FavoriteDAO;
import com.forbes.hibernate.dao.FavoriteTypeDAO;
import com.forbes.service.basic.CityManager;
import com.forbes.service.favorite.FavoriteManager;
import com.forbes.util.Pager;


public class FavoriteManagerImpl implements FavoriteManager {
	
	
	
	private FavoriteDAO favoriteDAO;
	
	private FavoriteTypeDAO favoriteTypeDAO;

	public FavoriteDAO getFavoriteDAO() {
		return favoriteDAO;
	}

	public void setFavoriteDAO(FavoriteDAO favoriteDAO) {
		this.favoriteDAO = favoriteDAO;
	}

	public FavoriteTypeDAO getFavoriteTypeDAO() {
		return favoriteTypeDAO;
	}

	public void setFavoriteTypeDAO(FavoriteTypeDAO favoriteTypeDAO) {
		this.favoriteTypeDAO = favoriteTypeDAO;
	}
	
	
	public void addFavorite(Favorite favorite) {
		favoriteDAO.save(favorite);
	}
	
	public void deleteFavorite(Favorite favorite) {
		favoriteDAO.delete(favorite);
	}
	
	public Favorite getFavorite(Integer id) {
		return favoriteDAO.findById(id);
	}

	public void updateFavorite(Favorite favorite) {
		favoriteDAO.attachDirty(favorite);
	}
	
	public FavoriteType getFavoriteType(Short id) {
		return favoriteTypeDAO.findById(id);
	}
	
	public boolean checkFavorite(FavoriteType favoriteType, String objectid ) {
		int count = favoriteDAO.getCount(favoriteType.getId().toString(), objectid);
		if(count >0)
			return false;
		else
			return true;
	}
	
	public List getFavoriteByPage( Pager pager, int pageNo, Integer uid, Short typeid, String keyword  ) throws ForbesException{
		try {			
			pager.setTotoalCnt(favoriteDAO.getCountFavorite(uid, typeid, keyword));
			List list = favoriteDAO.findFavoriteByPage(uid, typeid, keyword, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public int getFavoriteCount(FavoriteType favoriteType, String objectid ) {
		int count = favoriteDAO.getCount(favoriteType.getId().toString(), objectid);
		if(count >0)
			return count;
		else
			return 2;
	}
	
}
