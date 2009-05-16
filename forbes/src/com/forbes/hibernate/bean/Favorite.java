package com.forbes.hibernate.bean;

/**
 * Favorite entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Favorite extends AbstractFavorite implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Favorite() {
	}

	/** full constructor */
	public Favorite(FavoriteType favoriteType, Integer userId, Integer objectId) {
		super(favoriteType, userId, objectId);
	}

}
