package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractFeedBack entity provides the base persistence definition of the
 * FeedBack entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractFeedBack implements java.io.Serializable {

	// Fields

	private Integer id;
	private Short feedType;
	private Short errorType;
	private String errorContent;
	private String errorUrl;
	private Integer userId;
	private String userName;
	private String email;
	private Date feedTime;

	// Constructors

	public Date getFeedTime() {
		return feedTime;
	}

	public void setFeedTime(Date feedTime) {
		this.feedTime = feedTime;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	/** default constructor */
	public AbstractFeedBack() {
	}

	/** full constructor */
	public AbstractFeedBack(Short feedType, Short errorType,
			String errorContent, String errorUrl, Integer userId,
			String userName, String email) {
		this.feedType = feedType;
		this.errorType = errorType;
		this.errorContent = errorContent;
		this.errorUrl = errorUrl;
		this.userId = userId;
		this.userName = userName;
		this.email = email;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Short getFeedType() {
		return this.feedType;
	}

	public void setFeedType(Short feedType) {
		this.feedType = feedType;
	}

	public Short getErrorType() {
		return this.errorType;
	}

	public void setErrorType(Short errorType) {
		this.errorType = errorType;
	}

	public String getErrorContent() {
		return this.errorContent;
	}

	public void setErrorContent(String errorContent) {
		this.errorContent = errorContent;
	}

	public String getErrorUrl() {
		return this.errorUrl;
	}

	public void setErrorUrl(String errorUrl) {
		this.errorUrl = errorUrl;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}