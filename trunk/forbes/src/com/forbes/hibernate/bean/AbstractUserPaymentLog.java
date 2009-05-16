package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserPaymentLog entity provides the base persistence definition of the
 * UserPaymentLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserPaymentLog implements java.io.Serializable {

	// Fields

	private Long id;
	private Long orderId;
	private Short payMethod;
	private String checkNo;
	private String bankOrderId;
	private Integer amount;
	private Short status;
	private Date payDate;
	private Long accountId;
	private String remark;
	private Integer balance;
	private Integer presentBalance;
	private Integer presentAmount;

	// Constructors

	/** default constructor */
	public AbstractUserPaymentLog() {
	}

	/** full constructor */
	public AbstractUserPaymentLog(Long orderId, Short payMethod,
			String checkNo, String bankOrderId, Integer amount, Short status,
			Date payDate, Long accountId, String remark, Integer balance,
			Integer presentBalance, Integer presentAmount) {
		this.orderId = orderId;
		this.payMethod = payMethod;
		this.checkNo = checkNo;
		this.bankOrderId = bankOrderId;
		this.amount = amount;
		this.status = status;
		this.payDate = payDate;
		this.accountId = accountId;
		this.remark = remark;
		this.balance = balance;
		this.presentBalance = presentBalance;
		this.presentAmount = presentAmount;
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

	public Short getPayMethod() {
		return this.payMethod;
	}

	public void setPayMethod(Short payMethod) {
		this.payMethod = payMethod;
	}

	public String getCheckNo() {
		return this.checkNo;
	}

	public void setCheckNo(String checkNo) {
		this.checkNo = checkNo;
	}

	public String getBankOrderId() {
		return this.bankOrderId;
	}

	public void setBankOrderId(String bankOrderId) {
		this.bankOrderId = bankOrderId;
	}

	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public Date getPayDate() {
		return this.payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public Long getAccountId() {
		return this.accountId;
	}

	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getBalance() {
		return this.balance;
	}

	public void setBalance(Integer balance) {
		this.balance = balance;
	}

	public Integer getPresentBalance() {
		return this.presentBalance;
	}

	public void setPresentBalance(Integer presentBalance) {
		this.presentBalance = presentBalance;
	}

	public Integer getPresentAmount() {
		return this.presentAmount;
	}

	public void setPresentAmount(Integer presentAmount) {
		this.presentAmount = presentAmount;
	}

}