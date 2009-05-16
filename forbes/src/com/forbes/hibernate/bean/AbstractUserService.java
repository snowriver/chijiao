package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserService entity provides the base persistence definition of the
 * UserService entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserService implements java.io.Serializable {

	// Fields

	private Integer id;
	private Date serviceDate;
	private String dealClass;
	private Integer userId;
	private String cmdParam;
	private Short processRst;
	private String serviceDesc;
	private Integer serviceId;
	private Integer serviceTimes;
	private Date serviceEndDate;

	// Constructors

	/** default constructor */
	public AbstractUserService() {
	}

	/** full constructor */
	public AbstractUserService(Date serviceDate, String dealClass,
			Integer userId, String cmdParam, Short processRst,
			String serviceDesc, Integer serviceId, Integer serviceTimes,
			Date serviceEndDate) {
		this.serviceDate = serviceDate;
		this.dealClass = dealClass;
		this.userId = userId;
		this.cmdParam = cmdParam;
		this.processRst = processRst;
		this.serviceDesc = serviceDesc;
		this.serviceId = serviceId;
		this.serviceTimes = serviceTimes;
		this.serviceEndDate = serviceEndDate;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getServiceDate() {
		return this.serviceDate;
	}

	public void setServiceDate(Date serviceDate) {
		this.serviceDate = serviceDate;
	}

	public String getDealClass() {
		return this.dealClass;
	}

	public void setDealClass(String dealClass) {
		this.dealClass = dealClass;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getCmdParam() {
		return this.cmdParam;
	}

	public void setCmdParam(String cmdParam) {
		this.cmdParam = cmdParam;
	}

	public Short getProcessRst() {
		return this.processRst;
	}

	public void setProcessRst(Short processRst) {
		this.processRst = processRst;
	}

	public String getServiceDesc() {
		return this.serviceDesc;
	}

	public void setServiceDesc(String serviceDesc) {
		this.serviceDesc = serviceDesc;
	}

	public Integer getServiceId() {
		return this.serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Integer getServiceTimes() {
		return this.serviceTimes;
	}

	public void setServiceTimes(Integer serviceTimes) {
		this.serviceTimes = serviceTimes;
	}

	public Date getServiceEndDate() {
		return this.serviceEndDate;
	}

	public void setServiceEndDate(Date serviceEndDate) {
		this.serviceEndDate = serviceEndDate;
	}

}