package com.forbes.hibernate.bean;

/**
 * City entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class ArticleType extends AbstractArticleType implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public ArticleType() {
	}

	/** full constructor */
	public ArticleType(Integer pid, String name, Integer disorder, String issend, String description, String keywords) {
		super(pid, name, disorder, issend, description, keywords);
	}

}
