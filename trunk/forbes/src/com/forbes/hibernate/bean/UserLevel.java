package com.forbes.hibernate.bean;

/**
 * UserLevel entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserLevel extends AbstractUserLevel implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserLevel() {
	}

	/** full constructor */
	public UserLevel(Short level, Integer startScore, Integer endScore,
			String title) {
		super(level, startScore, endScore, title);
	}

}
