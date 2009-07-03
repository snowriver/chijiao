package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * UserDailyPlan entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserDailyPlan extends AbstractUserDailyPlan implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserDailyPlan() {
	}

	/** full constructor */
	public UserDailyPlan(Integer userId, Integer sn, Date startTime,
			Date endTime, Date date, String title, String content,
			Date limitTime, Short isComplete, String note) {
		super(userId, sn, startTime, endTime, date, title, content, limitTime,
				isComplete, note);
	}

}
