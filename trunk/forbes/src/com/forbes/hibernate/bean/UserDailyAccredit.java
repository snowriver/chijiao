package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * UserDailyAccredit entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserDailyAccredit extends AbstractUserDailyAccredit implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserDailyAccredit() {
	}

	/** full constructor */
	public UserDailyAccredit(Integer userId, Date date, Integer sn, String receiver,
			String title, String content, Date limitTime, Short isComplete,
			String note) {
		super(userId, date, sn, receiver, title, content, limitTime, isComplete, note);
	}

}
