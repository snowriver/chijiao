package com.forbes.hibernate.bean;

/**
 * UserMonthSumup entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserMonthSumup extends AbstractUserMonthSumup implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserMonthSumup() {
	}

	/** full constructor */
	public UserMonthSumup(Integer userId, Short year, Short month, String aim,
			String gain, String challenge, String improve, String analyse) {
		super(userId, year, month, aim, gain, challenge, improve, analyse);
	}

}
