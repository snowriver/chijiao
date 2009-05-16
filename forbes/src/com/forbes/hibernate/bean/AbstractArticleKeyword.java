package com.forbes.hibernate.bean;

/**
 * AbstractArticleKeyword entity provides the base persistence definition of the
 * ArticleKeyword entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractArticleKeyword implements java.io.Serializable {

	// Fields

	private Integer id;
	private String keyword;
	private Integer rank;
	private Short sta;
	private String rpurl;

	// Constructors

	/** default constructor */
	public AbstractArticleKeyword() {
	}

	/** minimal constructor */
	public AbstractArticleKeyword(String keyword, Integer rank, Short sta) {
		this.keyword = keyword;
		this.rank = rank;
		this.sta = sta;
	}

	/** full constructor */
	public AbstractArticleKeyword(String keyword, Integer rank, Short sta,
			String rpurl) {
		this.keyword = keyword;
		this.rank = rank;
		this.sta = sta;
		this.rpurl = rpurl;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getKeyword() {
		return this.keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getRank() {
		return this.rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public Short getSta() {
		return this.sta;
	}

	public void setSta(Short sta) {
		this.sta = sta;
	}

	public String getRpurl() {
		return this.rpurl;
	}

	public void setRpurl(String rpurl) {
		this.rpurl = rpurl;
	}

}