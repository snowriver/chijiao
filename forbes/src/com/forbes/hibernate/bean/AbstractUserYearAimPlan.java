package com.forbes.hibernate.bean;

/**
 * AbstractUserYearAimPlan entity provides the base persistence definition of
 * the UserYearAimPlan entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserYearAimPlan implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Short year;
	private Short quarter;
	private String firstMonth;
	private String secondMonth;
	private String thirdMonth;
	
	// Constructors
	
	/** default constructor */
	public AbstractUserYearAimPlan() {
	}

	/** full constructor */
	public AbstractUserYearAimPlan(Integer userId, Short year, Short quarter,
			String firstMonth, String secondMonth, String thirdMonth) {
		this.userId = userId;
		this.year = year;
		this.quarter = quarter;
		this.firstMonth = firstMonth;
		this.secondMonth = secondMonth;
		this.thirdMonth = thirdMonth;
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

	public Short getQuarter() {
		return this.quarter;
	}

	public void setQuarter(Short quarter) {
		this.quarter = quarter;
	}

	public String getFirstMonth() {
		return this.firstMonth;
	}

	public void setFirstMonth(String firstMonth) {
		this.firstMonth = firstMonth;
	}

	public String getSecondMonth() {
		return this.secondMonth;
	}

	public void setSecondMonth(String secondMonth) {
		this.secondMonth = secondMonth;
	}

	public String getThirdMonth() {
		return this.thirdMonth;
	}

	public void setThirdMonth(String thirdMonth) {
		this.thirdMonth = thirdMonth;
	}

}