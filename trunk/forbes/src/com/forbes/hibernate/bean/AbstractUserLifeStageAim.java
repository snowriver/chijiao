package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserLifeStageAim entity provides the base persistence definition of
 * the UserLifeStageAim entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserLifeStageAim implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Short years;
	private String aim;
	private Date limitTime;

	// Constructors

	/** default constructor */
	public AbstractUserLifeStageAim() {
	}

	/** full constructor */
	public AbstractUserLifeStageAim(Integer userId, Short years,
			String aim, Date limitTime) {
		this.userId = userId;
		this.years = years;
		this.aim = aim;
		this.limitTime = limitTime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	

	public Short getYears() {
		return years;
	}

	public void setYears(Short years) {
		this.years = years;
	}

	public String getAim() {
		return aim;
	}

	public void setAim(String aim) {
		this.aim = aim;
	}

	public Date getLimitTime() {
		return this.limitTime;
	}

	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}

}