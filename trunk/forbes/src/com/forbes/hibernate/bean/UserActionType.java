package com.forbes.hibernate.bean;

import java.util.Set;

/**
 * UserActionType entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserActionType extends AbstractUserActionType implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserActionType() {
	}

	/** full constructor */
	public UserActionType(String actionName, String descs, Set userActionLogs) {
		super(actionName, descs, userActionLogs);
	}

}
