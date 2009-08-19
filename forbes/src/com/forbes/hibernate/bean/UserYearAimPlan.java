package com.forbes.hibernate.bean;

/**
 * UserYearAimPlan entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserYearAimPlan extends AbstractUserYearAimPlan implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserYearAimPlan() {
	}

	/** full constructor */
	public UserYearAimPlan(Integer userId, Short year, Short quarter,
			String firstMonth, String secondMonth, String thirdMonth) {
		super(userId, year, quarter, firstMonth, secondMonth, thirdMonth);
	}

}
