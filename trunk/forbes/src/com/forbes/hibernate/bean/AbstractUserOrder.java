package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserOrder entity provides the base persistence definition of the
 * UserOrder entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserOrder implements java.io.Serializable {

	// Fields

	private Long id;
	private Long userId;
	private Short userType;
	private Long total;
	private Short status;
	private Date orderDate;
	private Short payMethod;
	private String remark;

	// Constructors

	/** default constructor */
	public AbstractUserOrder() {
	}

	/** full constructor */
	public AbstractUserOrder(Long userId, Short userType, Long total,
			Short status, Date orderDate, Short payMethod, String remark) {
		this.userId = userId;
		this.userType = userType;
		this.total = total;
		this.status = status;
		this.orderDate = orderDate;
		this.payMethod = payMethod;
		this.remark = remark;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Short getUserType() {
		return this.userType;
	}

	public void setUserType(Short userType) {
		this.userType = userType;
	}

	public Long getTotal() {
		return this.total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public Date getOrderDate() {
		return this.orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Short getPayMethod() {
		return this.payMethod;
	}

	public void setPayMethod(Short payMethod) {
		this.payMethod = payMethod;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}