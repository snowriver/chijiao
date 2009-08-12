package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * UserWeekAbility entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserWeekAbility extends AbstractUserWeekAbility implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserWeekAbility() {
	}

	/** full constructor */
	public UserWeekAbility(Integer userId, Date date, String ardour,
			String promises, String responsibility, String admire,
			String contribute, String believe, String winwin, String listen,
			String focus, String echo, String praise, String convince,
			String feedback, String thank, String visualize, String study,
			String innovation, String love, String gumption, String purpose,
			String intent, String professional, String willpower) {
		super(userId, date, ardour, promises, responsibility, admire,
				contribute, believe, winwin, listen, focus, echo, praise,
				convince, feedback, thank, visualize, study, innovation, love,
				gumption, purpose, intent, professional, willpower);
	}

}
