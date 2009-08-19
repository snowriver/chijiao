package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * UserMonthAimPlan entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserMonthAimPlan extends AbstractUserMonthAimPlan implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserMonthAimPlan() {
	}

	/** full constructor */
	public UserMonthAimPlan(Integer userId, Short year, Short month,
			String careerAim, String careerPlan, String familyAim,
			String familyPlan, String contactAim, String contactPlan,
			String financeAim, String financePlan, String spiritAim,
			String spiritPlan, String healthAim, String healthPlan,
			String otherAim, String otherPlan, Date limitTime) {
		super(userId, year, month, careerAim, careerPlan, familyAim,
				familyPlan, contactAim, contactPlan, financeAim, financePlan,
				spiritAim, spiritPlan, healthAim, healthPlan, otherAim,
				otherPlan, limitTime);
	}

}
