package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractSearchKeyword entity provides the base persistence definition of the
 * SearchKeyword entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractSearchKeyword implements java.io.Serializable {

	// Fields

	private Integer id;
	private String keyword;
	private String spwords;
	private Integer count;
	private Integer result;
	private Date lasttime;
	private Short istag;
	private Integer weekcc;
	private Integer monthcc;
	private Integer starttime;
	private Integer weekup;
	private Integer monthup;

	// Constructors

	/** default constructor */
	public AbstractSearchKeyword() {
	}

	/** full constructor */
	public AbstractSearchKeyword(String keyword, String spwords, Integer count,
			Integer result, Date lasttime, Short istag, Integer weekcc,
			Integer monthcc, Integer starttime, Integer weekup, Integer monthup) {
		this.keyword = keyword;
		this.spwords = spwords;
		this.count = count;
		this.result = result;
		this.lasttime = lasttime;
		this.istag = istag;
		this.weekcc = weekcc;
		this.monthcc = monthcc;
		this.starttime = starttime;
		this.weekup = weekup;
		this.monthup = monthup;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getKeyword() {
		return this.keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSpwords() {
		return this.spwords;
	}

	public void setSpwords(String spwords) {
		this.spwords = spwords;
	}

	public Integer getCount() {
		return this.count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getResult() {
		return this.result;
	}

	public void setResult(Integer result) {
		this.result = result;
	}

	public Date getLasttime() {
		return this.lasttime;
	}

	public void setLasttime(Date lasttime) {
		this.lasttime = lasttime;
	}

	public Short getIstag() {
		return this.istag;
	}

	public void setIstag(Short istag) {
		this.istag = istag;
	}

	public Integer getWeekcc() {
		return this.weekcc;
	}

	public void setWeekcc(Integer weekcc) {
		this.weekcc = weekcc;
	}

	public Integer getMonthcc() {
		return this.monthcc;
	}

	public void setMonthcc(Integer monthcc) {
		this.monthcc = monthcc;
	}

	public Integer getStarttime() {
		return this.starttime;
	}

	public void setStarttime(Integer starttime) {
		this.starttime = starttime;
	}

	public Integer getWeekup() {
		return this.weekup;
	}

	public void setWeekup(Integer weekup) {
		this.weekup = weekup;
	}

	public Integer getMonthup() {
		return this.monthup;
	}

	public void setMonthup(Integer monthup) {
		this.monthup = monthup;
	}

}