package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserDailyAccredit entity provides the base persistence definition of
 * the UserDailyAccredit entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserDailyAccredit implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Date date;
	private Integer sn;
	private String receiver;
	private String title;
	private String content;
	private Date limitTime;
	private Short isComplete;
	private String note;

	// Constructors

	/** default constructor */
	public AbstractUserDailyAccredit() {
	}

	/** full constructor */
	public AbstractUserDailyAccredit(Integer userId, Date date, Integer sn,
			String receiver, String title, String content, Date limitTime,
			Short isComplete, String note) {
		this.userId = userId;
		this.date = date;
		this.sn = sn;
		this.receiver = receiver;
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

	public String getReceiver() {
		return this.receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}