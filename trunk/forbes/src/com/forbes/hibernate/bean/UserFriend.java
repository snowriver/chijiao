package com.forbes.hibernate.bean;

/**
 * UserFriend entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserFriend extends AbstractUserFriend implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserFriend() {
	}

	/** full constructor */
	public UserFriend(Integer userId, User Friend, String friendLoginname,
			String note) {
		super(userId, Friend, friendLoginname, note);
	}

}
