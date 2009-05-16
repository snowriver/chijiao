package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * UserOrder entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserOrder extends AbstractUserOrder implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserOrder() {
	}

	/** full constructor */
	public UserOrder(Long userId, Short userType, Long total, Short status,
			Date orderDate, Short payMethod, String remark) {
		super(userId, userType, total, status, orderDate, payMethod, remark);
	}

}
