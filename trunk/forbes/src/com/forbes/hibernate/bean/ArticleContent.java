package com.forbes.hibernate.bean;

/**
 * ArticleContent entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class ArticleContent extends AbstractArticleContent implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public ArticleContent() {
	}

	/** full constructor */
	public ArticleContent(String content) {
		super(content);
	}

}
