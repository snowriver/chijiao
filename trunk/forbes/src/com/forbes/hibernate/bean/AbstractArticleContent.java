package com.forbes.hibernate.bean;

/**
 * AbstractArticleContent entity provides the base persistence definition of the
 * ArticleContent entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractArticleContent implements java.io.Serializable {

	// Fields

	private Integer id;
	private String content;
	
	private Article article;

	// Constructors

	/** default constructor */
	public AbstractArticleContent() {
	}

	/** full constructor */
	public AbstractArticleContent(String content) {
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

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

}