package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * UserWeekAimExam entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserWeekAimExam extends AbstractUserWeekAimExam implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserWeekAimExam() {
	}

	/** full constructor */
	public UserWeekAimExam(Integer userId, Date date, String careerDone,
			String careerNext, String familyDone, String familyNext,
			String contactDone, String contactNext, String financeDone,
			String financeNext, String spiritDone, String spiritNext,
			String healthDone, String healthNext, String otherDone,
			String otherNext) {
		super(userId, date, careerDone, careerNext, familyDone, familyNext,
				contactDone, contactNext, financeDone, financeNext, spiritDone,
				spiritNext, healthDone, healthNext, otherDone, otherNext);
	}

}
