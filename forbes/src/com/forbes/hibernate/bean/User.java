package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * User entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class User extends AbstractUser implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(String loginName, String name, String password, String type,
			String email, Date regTime, String regIp, Date lastLoginTime, 
			String lastLoginIp, String deleteFlag, String active, String image) {
		super(loginName, name, password, type, email, regTime, regIp,
				lastLoginTime, lastLoginIp, deleteFlag, active, image);
	}

}
