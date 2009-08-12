package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserWeekAimExam entity provides the base persistence definition of
 * the UserWeekAimExam entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserWeekAimExam implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Date date;
	private String careerDone;
	private String careerNext;
	private String familyDone;
	private String familyNext;
	private String contactDone;
	private String contactNext;
	private String financeDone;
	private String financeNext;
	private String spiritDone;
	private String spiritNext;
	private String healthDone;
	private String healthNext;
	private String otherDone;
	private String otherNext;
	private Date limitTime;
	
	// Constructors

	public Date getLimitTime() {
		return limitTime;
	}

	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}

	/** default constructor */
	public AbstractUserWeekAimExam() {
	}

	/** full constructor */
	public AbstractUserWeekAimExam(Integer userId, Date date,
			String careerDone, String careerNext, String familyDone,
			String familyNext, String contactDone, String contactNext,
			String financeDone, String financeNext, String spiritDone,
			String spiritNext, String healthDone, String healthNext,
			String otherDone, String otherNext) {
		this.userId = userId;
		this.date = date;
		this.careerDone = careerDone;
		this.careerNext = careerNext;
		this.familyDone = familyDone;
		this.familyNext = familyNext;
		this.contactDone = contactDone;
		this.contactNext = contactNext;
		this.financeDone = financeDone;
		this.financeNext = financeNext;
		this.spiritDone = spiritDone;
		this.spiritNext = spiritNext;
		this.healthDone = healthDone;
		this.healthNext = healthNext;
		this.otherDone = otherDone;
		this.otherNext = otherNext;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCareerDone() {
		return this.careerDone;
	}

	public void setCareerDone(String careerDone) {
		this.careerDone = careerDone;
	}

	public String getCareerNext() {
		return this.careerNext;
	}

	public void setCareerNext(String careerNext) {
		this.careerNext = careerNext;
	}

	public String getFamilyDone() {
		return this.familyDone;
	}

	public void setFamilyDone(String familyDone) {
		this.familyDone = familyDone;
	}

	public String getFamilyNext() {
		return this.familyNext;
	}

	public void setFamilyNext(String familyNext) {
		this.familyNext = familyNext;
	}

	public String getContactDone() {
		return this.contactDone;
	}

	public void setContactDone(String contactDone) {
		this.contactDone = contactDone;
	}

	public String getContactNext() {
		return this.contactNext;
	}

	public void setContactNext(String contactNext) {
		this.contactNext = contactNext;
	}

	public String getFinanceDone() {
		return this.financeDone;
	}

	public void setFinanceDone(String financeDone) {
		this.financeDone = financeDone;
	}

	public String getFinanceNext() {
		return this.financeNext;
	}

	public void setFinanceNext(String financeNext) {
		this.financeNext = financeNext;
	}

	public String getSpiritDone() {
		return this.spiritDone;
	}

	public void setSpiritDone(String spiritDone) {
		this.spiritDone = spiritDone;
	}

	public String getSpiritNext() {
		return this.spiritNext;
	}

	public void setSpiritNext(String spiritNext) {
		this.spiritNext = spiritNext;
	}

	public String getHealthDone() {
		return this.healthDone;
	}

	public void setHealthDone(String healthDone) {
		this.healthDone = healthDone;
	}

	public String getHealthNext() {
		return this.healthNext;
	}

	public void setHealthNext(String healthNext) {
		this.healthNext = healthNext;
	}

	public String getOtherDone() {
		return this.otherDone;
	}

	public void setOtherDone(String otherDone) {
		this.otherDone = otherDone;
	}

	public String getOtherNext() {
		return this.otherNext;
	}

	public void setOtherNext(String otherNext) {
		this.otherNext = otherNext;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}