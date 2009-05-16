package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserActionLog entity provides the base persistence definition of the
 * UserActionLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserActionLog implements java.io.Serializable {

	// Fields

	private Integer id;
	private UserActionType userActionType;
	private Integer userId;
	private String actionData;
	private String descs;
	private Date insertDate;

	// Constructors

	/** default constructor */
	public AbstractUserActionLog() {
	}

	/** full constructor */
	public AbstractUserActionLog(UserActionType userActionType, Integer userId,
			String actionData, String descs, Date insertDate) {
		this.userActionType = userActionType;
		this.userId = userId;
		this.actionData = actionData;
		this.descs = descs;
		this.insertDate = insertDate;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public UserActionType getUserActionType() {
		return this.userActionType;
	}

	public void setUserActionType(UserActionType userActionType) {
		this.userActionType = userActionType;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getActionData() {
		return this.actionData;
	}

	public void setActionData(String actionData) {
		this.actionData = actionData;
	}

	public String getDescs() {
		return this.descs;
	}

	public void setDescs(String descs) {
		this.descs = descs;
	}

	public Date getInsertDate() {
		return this.insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

}