package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * UserLifeStageAim entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserLifeStageAim extends AbstractUserLifeStageAim implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserLifeStageAim() {
	}

	/** full constructor */
	public UserLifeStageAim(Integer userId, Short years,
			String aim, Date limitTime) {
		super(userId, years, aim, limitTime);
	}

}
