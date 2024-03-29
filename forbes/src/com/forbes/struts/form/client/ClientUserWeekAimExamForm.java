/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.form.client;

import java.util.Date;
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
public class ClientUserWeekAimExamForm extends ActionForm {
	
	
	private Integer id;
	private Integer userId;
	private String date;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCareerDone() {
		return careerDone;
	}

	public void setCareerDone(String careerDone) {
		this.careerDone = careerDone;
	}

	public String getCareerNext() {
		return careerNext;
	}

	public void setCareerNext(String careerNext) {
		this.careerNext = careerNext;
	}

	public String getFamilyDone() {
		return familyDone;
	}

	public void setFamilyDone(String familyDone) {
		this.familyDone = familyDone;
	}

	public String getFamilyNext() {
		return familyNext;
	}

	public void setFamilyNext(String familyNext) {
		this.familyNext = familyNext;
	}

	public String getContactDone() {
		return contactDone;
	}

	public void setContactDone(String contactDone) {
		this.contactDone = contactDone;
	}

	public String getContactNext() {
		return contactNext;
	}

	public void setContactNext(String contactNext) {
		this.contactNext = contactNext;
	}

	public String getFinanceDone() {
		return financeDone;
	}

	public void setFinanceDone(String financeDone) {
		this.financeDone = financeDone;
	}

	public String getFinanceNext() {
		return financeNext;
	}

	public void setFinanceNext(String financeNext) {
		this.financeNext = financeNext;
	}

	public String getSpiritDone() {
		return spiritDone;
	}

	public void setSpiritDone(String spiritDone) {
		this.spiritDone = spiritDone;
	}

	public String getSpiritNext() {
		return spiritNext;
	}

	public void setSpiritNext(String spiritNext) {
		this.spiritNext = spiritNext;
	}

	public String getHealthDone() {
		return healthDone;
	}

	public void setHealthDone(String healthDone) {
		this.healthDone = healthDone;
	}

	public String getHealthNext() {
		return healthNext;
	}

	public void setHealthNext(String healthNext) {
		this.healthNext = healthNext;
	}

	public String getOtherDone() {
		return otherDone;
	}

	public void setOtherDone(String otherDone) {
		this.otherDone = otherDone;
	}

	public String getOtherNext() {
		return otherNext;
	}

	public void setOtherNext(String otherNext) {
		this.otherNext = otherNext;
	}

}