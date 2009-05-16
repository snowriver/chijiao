package com.forbes.hibernate.bean;

/**
 * AbstractContentType entity provides the base persistence definition of the
 * ContentType entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractContentType implements java.io.Serializable {

	// Fields

	private Short id;
	private String typeName;

	// Constructors

	/** default constructor */
	public AbstractContentType() {
	}

	/** full constructor */
	public AbstractContentType(String typeName) {
		this.typeName = typeName;
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

}