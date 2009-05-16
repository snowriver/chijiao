package com.forbes.hibernate.bean;

import java.util.Set;

/**
 * FavoriteType entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class FavoriteType extends AbstractFavoriteType implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public FavoriteType() {
	}

	/** full constructor */
	public FavoriteType(String typeName) {
		super(typeName);
	}

}
