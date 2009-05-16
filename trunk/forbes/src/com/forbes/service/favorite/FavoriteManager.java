package com.forbes.service.favorite;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Favorite;
import com.forbes.hibernate.bean.FavoriteType;
import com.forbes.hibernate.dao.FavoriteDAO;
import com.forbes.hibernate.dao.FavoriteTypeDAO;
import com.forbes.util.Pager;

public interface FavoriteManager {

	public FavoriteDAO getFavoriteDAO();

	public void setFavoriteDAO(FavoriteDAO favoriteDAO);

	public FavoriteTypeDAO getFavoriteTypeDAO();

	public void setFavoriteTypeDAO(FavoriteTypeDAO favoriteTypeDAO);
	
	public void addFavorite(Favorite favorite);
	
	public void deleteFavorite(Favorite favorite);
	
	public Favorite getFavorite(Integer id);

	public void updateFavorite(Favorite favorite);
	
	public FavoriteType getFavoriteType(Short id);
	
	public boolean checkFavorite(FavoriteType favoriteType, String objectid );
	
	public List getFavoriteByPage( Pager pager, int pageNo, Integer uid, Short typeid, String keyword  ) throws ForbesException;
	
	public int getFavoriteCount(FavoriteType favoriteType, String objectid );
	
}
