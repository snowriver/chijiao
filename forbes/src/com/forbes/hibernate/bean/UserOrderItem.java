package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * UserOrderItem entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserOrderItem extends AbstractUserOrderItem implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserOrderItem() {
	}

	/** full constructor */
	public UserOrderItem(Long orderId, Integer serviceId, Short count,
			Integer price, String serviceDetail, Short dealStatus,
			Date serviceDate) {
		super(orderId, serviceId, count, price, serviceDetail, dealStatus,
				serviceDate);
	}

}
