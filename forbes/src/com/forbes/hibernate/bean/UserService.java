package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * UserService entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserService extends AbstractUserService implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserService() {
	}

	/** full constructor */
	public UserService(Date serviceDate, String dealClass, Integer userId,
			String cmdParam, Short processRst, String serviceDesc,
			Integer serviceId, Integer serviceTimes, Date serviceEndDate) {
		super(serviceDate, dealClass, userId, cmdParam, processRst,
				serviceDesc, serviceId, serviceTimes, serviceEndDate);
	}

}
