package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserScoreLog entity provides the base persistence definition of the
 * UserScoreLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserScoreLog implements java.io.Serializable {

	// Fields

	private Long id;
	private Long objectId;
	private Integer amount;
	private Short status;
	private Date genDate;
	private Long userId;
	private String remark;
	private Integer balance;
	private Integer presentBalance;
	private Integer presentAmount;

	// Constructors

	/** default constructor */
	public AbstractUserScoreLog() {
	}

	/** full constructor */
	public AbstractUserScoreLog(Long objectId, Integer amount, Short status,
			Date genDate, Long userId, String remark, Integer balance,
			Integer presentBalance, Integer presentAmount) {
		this.objectId = objectId;
		this.amount = amount;
		this.status = status;
		this.genDate = genDate;
		this.userId = userId;
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

	public Long getObjectId() {
		return this.objectId;
	}

	public void setObjectId(Long objectId) {
		this.objectId = objectId;
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

	public Date getGenDate() {
		return this.genDate;
	}

	public void setGenDate(Date genDate) {
		this.genDate = genDate;
	}


	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
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