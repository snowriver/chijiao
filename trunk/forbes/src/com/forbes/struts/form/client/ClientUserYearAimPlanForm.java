package com.forbes.struts.form.client;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 * MyEclipse Struts Creation date: 07-09-2007
 * 
 * XDoclet definition:
 * 
 * @struts.form name="ClientLoginForm"
 */
public class ClientUserYearAimPlanForm extends ActionForm {

	private Integer id;
	private Integer userId;
	private Short year;
	private Short quarter;
	private String firstMonth;
	private String secondMonth;
	private String thirdMonth;

	/*
	 * Generated Methods
	 */

	/**
	 * Method validate
	 * 
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// ActionErrors errors = new ActionErrors();

		// return errors;
		return null;
	}

	/**
	 * Method reset
	 * 
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Short getYear() {
		return year;
	}

	public void setYear(Short year) {
		this.year = year;
	}

	public Short getQuarter() {
		return quarter;
	}

	public void setQuarter(Short quarter) {
		this.quarter = quarter;
	}

	public String getFirstMonth() {
		return firstMonth;
	}

	public void setFirstMonth(String firstMonth) {
		this.firstMonth = firstMonth;
	}

	public String getSecondMonth() {
		return secondMonth;
	}

	public void setSecondMonth(String secondMonth) {
		this.secondMonth = secondMonth;
	}

	public String getThirdMonth() {
		return thirdMonth;
	}

	public void setThirdMonth(String thirdMonth) {
		this.thirdMonth = thirdMonth;
	}

}