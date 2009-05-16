package com.forbes.hibernate.bean;

/**
 * ArticleKeyword entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class ArticleKeyword extends AbstractArticleKeyword implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public ArticleKeyword() {
	}

	/** minimal constructor */
	public ArticleKeyword(String keyword, Integer rank, Short sta) {
		super(keyword, rank, sta);
	}

	/** full constructor */
	public ArticleKeyword(String keyword, Integer rank, Short sta, String rpurl) {
		super(keyword, rank, sta, rpurl);
	}

}
