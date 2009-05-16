package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserOrderItem entity provides the base persistence definition of the
 * UserOrderItem entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserOrderItem implements java.io.Serializable {

	// Fields

	private Long id;
	private Long orderId;
	private Integer serviceId;
	private Short count;
	private Integer price;
	private String serviceDetail;
	private Short dealStatus;
	private Date serviceDate;

	// Constructors

	/** default constructor */
	public AbstractUserOrderItem() {
	}

	/** full constructor */
	public AbstractUserOrderItem(Long orderId, Integer serviceId, Short count,
			Integer price, String serviceDetail, Short dealStatus,
			Date serviceDate) {
		this.orderId = orderId;
		this.serviceId = serviceId;
		this.count = count;
		this.price = price;
		this.serviceDetail = serviceDetail;
		this.dealStatus = dealStatus;
		this.serviceDate = serviceDate;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Integer getServiceId() {
		return this.serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Short getCount() {
		return this.count;
	}

	public void setCount(Short count) {
		this.count = count;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getServiceDetail() {
		return this.serviceDetail;
	}

	public void setServiceDetail(String serviceDetail) {
		this.serviceDetail = serviceDetail;
	}

	public Short getDealStatus() {
		return this.dealStatus;
	}

	public void setDealStatus(Short dealStatus) {
		this.dealStatus = dealStatus;
	}

	public Date getServiceDate() {
		return this.serviceDate;
	}

	public void setServiceDate(Date serviceDate) {
		this.serviceDate = serviceDate;
	}

}