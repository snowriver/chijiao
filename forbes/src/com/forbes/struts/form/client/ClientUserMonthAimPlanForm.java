package com.forbes.struts.form.client;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 07-09-2007
 * 
 * XDoclet definition:
 * @struts.form name="ClientLoginForm"
 */
public class ClientUserMonthAimPlanForm extends ActionForm {
	
	
	private Integer id;
	private Integer userId;
	private String year;
	private String month;
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
	
	/*
	 * Generated Methods
	 */
	

	

	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		//ActionErrors errors = new ActionErrors();		
		
		
		
		//return errors;
		return null;
	}

	/** 
	 * Method reset
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
	

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getCareerAim() {
		return careerAim;
	}

	public void setCareerAim(String careerAim) {
		this.careerAim = careerAim;
	}

	public String getCareerPlan() {
		return careerPlan;
	}

	public void setCareerPlan(String careerPlan) {
		this.careerPlan = careerPlan;
	}

	public String getFamilyAim() {
		return familyAim;
	}

	public void setFamilyAim(String familyAim) {
		this.familyAim = familyAim;
	}

	public String getFamilyPlan() {
		return familyPlan;
	}

	public void setFamilyPlan(String familyPlan) {
		this.familyPlan = familyPlan;
	}

	public String getContactAim() {
		return contactAim;
	}

	public void setContactAim(String contactAim) {
		this.contactAim = contactAim;
	}

	public String getContactPlan() {
		return contactPlan;
	}

	public void setContactPlan(String contactPlan) {
		this.contactPlan = contactPlan;
	}

	public String getFinanceAim() {
		return financeAim;
	}

	public void setFinanceAim(String financeAim) {
		this.financeAim = financeAim;
	}

	public String getFinancePlan() {
		return financePlan;
	}

	public void setFinancePlan(String financePlan) {
		this.financePlan = financePlan;
	}

	public String getSpiritAim() {
		return spiritAim;
	}

	public void setSpiritAim(String spiritAim) {
		this.spiritAim = spiritAim;
	}

	public String getSpiritPlan() {
		return spiritPlan;
	}

	public void setSpiritPlan(String spiritPlan) {
		this.spiritPlan = spiritPlan;
	}

	public String getHealthAim() {
		return healthAim;
	}

	public void setHealthAim(String healthAim) {
		this.healthAim = healthAim;
	}

	public String getHealthPlan() {
		return healthPlan;
	}

	public void setHealthPlan(String healthPlan) {
		this.healthPlan = healthPlan;
	}

	public String getOtherAim() {
		return otherAim;
	}

	public void setOtherAim(String otherAim) {
		this.otherAim = otherAim;
	}

	public String getOtherPlan() {
		return otherPlan;
	}

	public void setOtherPlan(String otherPlan) {
		this.otherPlan = otherPlan;
	}

}