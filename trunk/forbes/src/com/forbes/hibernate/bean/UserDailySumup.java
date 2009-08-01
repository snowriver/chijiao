package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * UserDailySumup entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserDailySumup extends AbstractUserDailySumup implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserDailySumup() {
	}

	/** full constructor */
	public UserDailySumup(Integer userId, Date date, Integer sn,
			String advance, String meditate, String note) {
		super(userId, date, sn, advance, meditate, note);
	}

}
