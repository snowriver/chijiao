package com.forbes.hibernate.bean;

/**
 * AbstractUserAccount entity provides the base persistence definition of the
 * UserAccount entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserAccount implements java.io.Serializable {

	// Fields

	private Long id;
	private Long userId;
	private Short accountType;
	private Integer balance;
	private Integer presentBalance;

	// Constructors

	/** default constructor */
	public AbstractUserAccount() {
	}

	/** full constructor */
	public AbstractUserAccount(Long userId, Short accountType, Integer balance,
			Integer presentBalance) {
		this.userId = userId;
		this.accountType = accountType;
		this.balance = balance;
		this.presentBalance = presentBalance;
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

	public Short getAccountType() {
		return this.accountType;
	}

	public void setAccountType(Short accountType) {
		this.accountType = accountType;
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

}