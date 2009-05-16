package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * UserActionLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserActionLog extends AbstractUserActionLog implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserActionLog() {
	}

	/** full constructor */
	public UserActionLog(UserActionType userActionType, Integer userId,
			String actionData, String descs, Date insertDate) {
		super(userActionType, userId, actionData, descs, insertDate);
	}

}
