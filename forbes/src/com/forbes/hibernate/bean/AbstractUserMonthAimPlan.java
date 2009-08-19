package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserMonthAimPlan entity provides the base persistence definition of
 * the UserMonthAimPlan entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserMonthAimPlan implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Short year;
	private Short month;
	private String careerAim;
	private String careerPlan;
	private String familyAim;
	private String familyPlan;
	private String contactAim;
	private String contactPlan;
	private String financeAim;
	private String financePlan;
	private String spiritAim;
	private String spiritPlan;
	private String healthAim;
	private String healthPlan;
	private String otherAim;
	private String otherPlan;
	private Date limitTime;

	// Constructors

	/** default constructor */
	public AbstractUserMonthAimPlan() {
	}

	/** full constructor */
	public AbstractUserMonthAimPlan(Integer userId, Short year, Short month,
			String careerAim, String careerPlan, String familyAim,
			String familyPlan, String contactAim, String contactPlan,
			String financeAim, String financePlan, String spiritAim,
			String spiritPlan, String healthAim, String healthPlan,
			String otherAim, String otherPlan, Date limitTime) {
		this.userId = userId;
		this.year = year;
		this.month = month;
		this.careerAim = careerAim;
		this.careerPlan = careerPlan;
		this.familyAim = familyAim;
		this.familyPlan = familyPlan;
		this.contactAim = contactAim;
		this.contactPlan = contactPlan;
		this.financeAim = financeAim;
		this.financePlan = financePlan;
		this.spiritAim = spiritAim;
		this.spiritPlan = spiritPlan;
		this.healthAim = healthAim;
		this.healthPlan = healthPlan;
		this.otherAim = otherAim;
		this.otherPlan = otherPlan;
		this.limitTime = limitTime;
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

	public String getCareerAim() {
		return this.careerAim;
	}

	public void setCareerAim(String careerAim) {
		this.careerAim = careerAim;
	}

	public String getCareerPlan() {
		return this.careerPlan;
	}

	public void setCareerPlan(String careerPlan) {
		this.careerPlan = careerPlan;
	}

	public String getFamilyAim() {
		return this.familyAim;
	}

	public void setFamilyAim(String familyAim) {
		this.familyAim = familyAim;
	}

	public String getFamilyPlan() {
		return this.familyPlan;
	}

	public void setFamilyPlan(String familyPlan) {
		this.familyPlan = familyPlan;
	}

	public String getContactAim() {
		return this.contactAim;
	}

	public void setContactAim(String contactAim) {
		this.contactAim = contactAim;
	}

	public String getContactPlan() {
		return this.contactPlan;
	}

	public void setContactPlan(String contactPlan) {
		this.contactPlan = contactPlan;
	}

	public String getFinanceAim() {
		return this.financeAim;
	}

	public void setFinanceAim(String financeAim) {
		this.financeAim = financeAim;
	}

	public String getFinancePlan() {
		return this.financePlan;
	}

	public void setFinancePlan(String financePlan) {
		this.financePlan = financePlan;
	}

	public String getSpiritAim() {
		return this.spiritAim;
	}

	public void setSpiritAim(String spiritAim) {
		this.spiritAim = spiritAim;
	}

	public String getSpiritPlan() {
		return this.spiritPlan;
	}

	public void setSpiritPlan(String spiritPlan) {
		this.spiritPlan = spiritPlan;
	}

	public String getHealthAim() {
		return this.healthAim;
	}

	public void setHealthAim(String healthAim) {
		this.healthAim = healthAim;
	}

	public String getHealthPlan() {
		return this.healthPlan;
	}

	public void setHealthPlan(String healthPlan) {
		this.healthPlan = healthPlan;
	}

	public String getOtherAim() {
		return this.otherAim;
	}

	public void setOtherAim(String otherAim) {
		this.otherAim = otherAim;
	}

	public String getOtherPlan() {
		return this.otherPlan;
	}

	public void setOtherPlan(String otherPlan) {
		this.otherPlan = otherPlan;
	}

	public Date getLimitTime() {
		return this.limitTime;
	}

	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}

}