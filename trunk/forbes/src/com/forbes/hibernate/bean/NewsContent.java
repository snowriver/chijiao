package com.forbes.hibernate.bean;

/**
 * NewsContent entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class NewsContent extends AbstractNewsContent implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public NewsContent() {
	}

	/** full constructor */
	public NewsContent(String content) {
		super(content);
	}

}
