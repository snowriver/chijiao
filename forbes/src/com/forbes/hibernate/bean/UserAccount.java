package com.forbes.hibernate.bean;

/**
 * UserAccount entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserAccount extends AbstractUserAccount implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserAccount() {
	}

	/** full constructor */
	public UserAccount(Long userId, Short accountType, Integer balance,
			Integer presentBalance) {
		super(userId, accountType, balance, presentBalance);
	}

}
