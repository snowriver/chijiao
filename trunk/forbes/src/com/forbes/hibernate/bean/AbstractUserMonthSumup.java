package com.forbes.hibernate.bean;

/**
 * AbstractUserMonthSumup entity provides the base persistence definition of the
 * UserMonthSumup entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserMonthSumup implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Short year;
	private Short month;
	private String aim;
	private String gain;
	private String challenge;
	private String improve;
	private String analyse;

	// Constructors

	/** default constructor */
	public AbstractUserMonthSumup() {
	}

	/** full constructor */
	public AbstractUserMonthSumup(Integer userId, Short year, Short month,
			String aim, String gain, String challenge, String improve,
			String analyse) {
		this.userId = userId;
		this.year = year;
		this.month = month;
		this.aim = aim;
		this.gain = gain;
		this.challenge = challenge;
		this.improve = improve;
		this.analyse = analyse;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Short getYear() {
		return this.year;
	}

	public void setYear(Short year) {
		this.year = year;
	}

	public Short getMonth() {
		return this.month;
	}

	public void setMonth(Short month) {
		this.month = month;
	}

	public String getAim() {
		return this.aim;
	}

	public void setAim(String aim) {
		this.aim = aim;
	}

	public String getGain() {
		return this.gain;
	}

	public void setGain(String gain) {
		this.gain = gain;
	}

	public String getChallenge() {
		return this.challenge;
	}

	public void setChallenge(String challenge) {
		this.challenge = challenge;
	}

	public String getImprove() {
		return this.improve;
	}

	public void setImprove(String improve) {
		this.improve = improve;
	}

	public String getAnalyse() {
		return this.analyse;
	}

	public void setAnalyse(String analyse) {
		this.analyse = analyse;
	}

}