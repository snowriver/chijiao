package com.forbes.hibernate.bean;

/**
 * AbstractFavorite entity provides the base persistence definition of the
 * Favorite entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractFavorite implements java.io.Serializable {

	// Fields

	private Integer id;
	private FavoriteType favoriteType;
	private Integer userId;
	private Integer objectId;

	// Constructors

	/** default constructor */
	public AbstractFavorite() {
	}

	/** full constructor */
	public AbstractFavorite(FavoriteType favoriteType, Integer userId,
			Integer objectId) {
		this.favoriteType = favoriteType;
		this.userId = userId;
		this.objectId = objectId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public FavoriteType getFavoriteType() {
		return this.favoriteType;
	}

	public void setFavoriteType(FavoriteType favoriteType) {
		this.favoriteType = favoriteType;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getObjectId() {
		return this.objectId;
	}

	public void setObjectId(Integer objectId) {
		this.objectId = objectId;
	}

}