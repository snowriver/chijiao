package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * UserLevelPromotion entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserLevelPromotion extends AbstractUserLevelPromotion implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserLevelPromotion() {
	}

	/** minimal constructor */
	public UserLevelPromotion(Integer uid) {
		super(uid);
	}

	/** full constructor */
	public UserLevelPromotion(Integer uid, String username, Short level,
			String levelTitle, Date promotDate) {
		super(uid, username, level, levelTitle, promotDate);
	}

}
