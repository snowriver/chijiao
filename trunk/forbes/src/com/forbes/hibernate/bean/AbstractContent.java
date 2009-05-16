package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * Content entity provides the base persistence definition of the
 * Content entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractContent implements java.io.Serializable {

	// Fields

	private Long id;
	//private Integer uerId;
	private UcMembers user;
	private String username;
	//private Article article;
	private ContentType contentType;
	private Integer objectId;
	private String content;
	private Date pubdate;
	private String ip;
	private Integer reId;

	// Constructors

	/** default constructor */
	public AbstractContent() {
	}

	/** full constructor */
	public AbstractContent( String content, Date pubdate,
			String ip, Integer reId) {
		//this.uerId = uerId;
		this.content = content;
		this.pubdate = pubdate;
		this.ip = ip;
		this.reId = reId;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/*public Integer getUerId() {
		return this.uerId;
	}

	public void setUerId(Integer uerId) {
		this.uerId = uerId;
	}*/

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPubdate() {
		return this.pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Integer getReId() {
		return this.reId;
	}

	public void setReId(Integer reId) {
		this.reId = reId;
	}


	public UcMembers getUser() {
		return user;
	}

	public void setUser(UcMembers user) {
		this.user = user;
	}

	public ContentType getContentType() {
		return contentType;
	}

	public void setContentType(ContentType contentType) {
		this.contentType = contentType;
	}

	public Integer getObjectId() {
		return objectId;
	}

	public void setObjectId(Integer objectId) {
		this.objectId = objectId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

/*	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}*/

}