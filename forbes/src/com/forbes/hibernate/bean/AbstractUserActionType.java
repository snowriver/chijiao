package com.forbes.hibernate.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractUserActionType entity provides the base persistence definition of the
 * UserActionType entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserActionType implements java.io.Serializable {

	// Fields

	private Short id;
	private String actionName;
	private String descs;
	private Set userActionLogs = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractUserActionType() {
	}

	/** full constructor */
	public AbstractUserActionType(String actionName, String descs,
			Set userActionLogs) {
		this.actionName = actionName;
		this.descs = descs;
		this.userActionLogs = userActionLogs;
	}

	// Property accessors

	public Short getId() {
		return this.id;
	}

	public void setId(Short id) {
		this.id = id;
	}

	public String getActionName() {
		return this.actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public String getDescs() {
		return this.descs;
	}

	public void setDescs(String descs) {
		this.descs = descs;
	}

	public Set getUserActionLogs() {
		return this.userActionLogs;
	}

	public void setUserActionLogs(Set userActionLogs) {
		this.userActionLogs = userActionLogs;
	}

}