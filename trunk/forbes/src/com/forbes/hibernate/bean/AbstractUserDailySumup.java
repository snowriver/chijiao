package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserDailySumup entity provides the base persistence definition of the
 * UserDailySumup entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserDailySumup implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Date date;
	private Integer sn;
	private String advance;
	private String meditate;
	private String note;

	// Constructors

	/** default constructor */
	public AbstractUserDailySumup() {
	}

	/** full constructor */
	public AbstractUserDailySumup(Integer userId, Date date, Integer sn,
			String advance, String meditate, String note) {
		this.userId = userId;
		this.date = date;
		this.sn = sn;
		this.advance = advance;
		this.meditate = meditate;
		this.note = note;
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

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getSn() {
		return this.sn;
	}

	public void setSn(Integer sn) {
		this.sn = sn;
	}

	public String getAdvance() {
		return this.advance;
	}

	public void setAdvance(String advance) {
		this.advance = advance;
	}

	public String getMeditate() {
		return this.meditate;
	}

	public void setMeditate(String meditate) {
		this.meditate = meditate;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}