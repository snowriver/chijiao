package com.forbes.hibernate.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractFavoriteType entity provides the base persistence definition of the
 * FavoriteType entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractFavoriteType implements java.io.Serializable {

	// Fields

	private Short id;
	private String typeName;
	//private Set favorites = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractFavoriteType() {
	}

	/** full constructor */
	public AbstractFavoriteType(String typeName) {
		this.typeName = typeName;
		//this.favorites = favorites;
	}

	// Property accessors

	public Short getId() {
		return this.id;
	}

	public void setId(Short id) {
		this.id = id;
	}

	public String getTypeName() {
		return this.typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	/*public Set getFavorites() {
		return this.favorites;
	}

	public void setFavorites(Set favorites) {
		this.favorites = favorites;
	}*/

}