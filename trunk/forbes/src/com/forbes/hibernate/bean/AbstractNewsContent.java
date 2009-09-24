package com.forbes.hibernate.bean;

/**
 * AbstractNewsContent entity provides the base persistence definition of the
 * NewsContent entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractNewsContent implements java.io.Serializable {

	// Fields

	private Integer id;
	private String content;
	
	private News news;

	// Constructors

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	/** default constructor */
	public AbstractNewsContent() {
	}

	/** full constructor */
	public AbstractNewsContent(String content) {
		this.content = content;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}