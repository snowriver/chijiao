package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserDailyPlan entity provides the base persistence definition of the
 * UserDailyPlan entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserDailyPlan implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Integer sn;
	private Date startTime;
	private Date endTime;
	private Date date;
	private String title;
	private String content;
	private Date limitTime;
	private Short isComplete;
	private String note;

	// Constructors

	/** default constructor */
	public AbstractUserDailyPlan() {
	}

	/** full constructor */
	public AbstractUserDailyPlan(Integer userId, Integer sn, Date startTime,
			Date endTime, Date date, String title, String content,
			Date limitTime, Short isComplete, String note) {
		this.userId = userId;
		this.sn = sn;
		this.startTime = startTime;
		this.endTime = endTime;
		this.date = date;
		this.title = title;
		this.content = content;
		this.limitTime = limitTime;
		this.isComplete = isComplete;
		this.note = note;
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

	public Integer getSn() {
		return this.sn;
	}

	public void setSn(Integer sn) {
		this.sn = sn;
	}

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getLimitTime() {
		return this.limitTime;
	}

	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}

	public Short getIsComplete() {
		return this.isComplete;
	}

	public void setIsComplete(Short isComplete) {
		this.isComplete = isComplete;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}