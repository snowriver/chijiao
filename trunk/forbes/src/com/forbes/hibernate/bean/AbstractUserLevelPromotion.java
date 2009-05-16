package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserLevelPromotion entity provides the base persistence definition of
 * the UserLevelPromotion entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserLevelPromotion implements
		java.io.Serializable {

	// Fields

	private Integer uid;
	private String username;
	private Short level;
	private String levelTitle;
	private Date promotDate;

	// Constructors

	/** default constructor */
	public AbstractUserLevelPromotion() {
	}

	/** minimal constructor */
	public AbstractUserLevelPromotion(Integer uid) {
		this.uid = uid;
	}

	/** full constructor */
	public AbstractUserLevelPromotion(Integer uid, String username,
			Short level, String levelTitle, Date promotDate) {
		this.uid = uid;
		this.username = username;
		this.level = level;
		this.levelTitle = levelTitle;
		this.promotDate = promotDate;
	}

	// Property accessors

	public Integer getUid() {
		return this.uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Short getLevel() {
		return this.level;
	}

	public void setLevel(Short level) {
		this.level = level;
	}

	public String getLevelTitle() {
		return this.levelTitle;
	}

	public void setLevelTitle(String levelTitle) {
		this.levelTitle = levelTitle;
	}

	public Date getPromotDate() {
		return this.promotDate;
	}

	public void setPromotDate(Date promotDate) {
		this.promotDate = promotDate;
	}

}