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
public class ClientUserWeekAttitudeForm extends ActionForm {
	
	private Integer id;
	private Integer userId;
	private Date date;
	private String confident;
	private String intent;
	private String initiative;
	private String ebullient;
	private String love;
	private String study;
	private String autonomic;
	private String pertinacious;
	private String insist;
	private String serious;
	private String rapid;
	private String optimism;
	private String innovation;
	private String honest;
	private String responsibility;
	private String sonsy;
	private String diligence;
	private String humility;
	private String purpose;
	private String clear;
	private String dobest;
	private String team;
	private String sluggish;
	private String inferiority;
	private String fluke;
	private String conceited;
	private String pride;
	private String boggle;
	private String acedia;
	private String anxiety;
	private String falsity;
	private String dream;
	private String adamancy;
	private String cynical;
	private String vulgar;
	private String recreance;
	private String peacockery;
	private String avarice;
	private String asocial;
	private String fussy;
	private String testiness;
	private String despair;
	private String begrudge;
	private String excuse;
	
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
		ActionErrors errors = new ActionErrors();		
		
		if ( confident == null || confident.length() < 1 ){
			setConfident("N");
		}
		
		if ( intent == null || intent.length() < 1 ){
			setIntent("N");
		}
		
		if ( initiative == null || initiative.length() < 1 ){
			setInitiative("N");
		}
		
		if ( ebullient == null || ebullient.length() < 1 ){
			setEbullient("N");
		}
		
		if ( love == null || love.length() < 1 ){
			setLove("N");
		}
		
		if ( study == null || study.length() < 1 ){
			setStudy("N");
		}
		
		if ( autonomic == null || autonomic.length() < 1 ){
			setAutonomic("N");
		}
		
		if ( pertinacious == null || pertinacious.length() < 1 ){
			setPertinacious("N");
		}
		
		if ( insist == null || insist.length() < 1 ){
			setInsist("N");
		}
		
		if ( serious == null || serious.length() < 1 ){
			setSerious("N");
		}
		
		if ( rapid == null || rapid.length() < 1 ){
			setRapid("N");
		}
		
		if ( optimism == null || optimism.length() < 1 ){
			setOptimism("N");
		}
		
		if ( innovation == null || innovation.length() < 1 ){
			setInitiative("N");
		}
		
		if ( honest == null || honest.length() < 1 ){
			setHonest("N");
		}
		
		if ( responsibility == null || responsibility.length() < 1 ){
			setResponsibility("N");
		}
		
		if ( sonsy == null || sonsy.length() < 1 ){
			setSonsy("N");
		}
		
		if ( diligence == null || diligence.length() < 1 ){
			setDiligence("N");
		}
		
		if ( humility == null || humility.length() < 1 ){
			setHumility("N");
		}
		
		return errors;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getConfident() {
		return confident;
	}

	public void setConfident(String confident) {
		this.confident = confident;
	}

	public String getIntent() {
		return intent;
	}

	public void setIntent(String intent) {
		this.intent = intent;
	}

	public String getInitiative() {
		return initiative;
	}

	public void setInitiative(String initiative) {
		this.initiative = initiative;
	}

	public String getEbullient() {
		return ebullient;
	}

	public void setEbullient(String ebullient) {
		this.ebullient = ebullient;
	}

	public String getLove() {
		return love;
	}

	public void setLove(String love) {
		this.love = love;
	}

	public String getStudy() {
		return study;
	}

	public void setStudy(String study) {
		this.study = study;
	}

	public String getAutonomic() {
		return autonomic;
	}

	public void setAutonomic(String autonomic) {
		this.autonomic = autonomic;
	}

	public String getPertinacious() {
		return pertinacious;
	}

	public void setPertinacious(String pertinacious) {
		this.pertinacious = pertinacious;
	}

	public String getInsist() {
		return insist;
	}

	public void setInsist(String insist) {
		this.insist = insist;
	}

	public String getSerious() {
		return serious;
	}

	public void setSerious(String serious) {
		this.serious = serious;
	}

	public String getRapid() {
		return rapid;
	}

	public void setRapid(String rapid) {
		this.rapid = rapid;
	}

	public String getOptimism() {
		return optimism;
	}

	public void setOptimism(String optimism) {
		this.optimism = optimism;
	}

	public String getInnovation() {
		return innovation;
	}

	public void setInnovation(String innovation) {
		this.innovation = innovation;
	}

	public String getHonest() {
		return honest;
	}

	public void setHonest(String honest) {
		this.honest = honest;
	}

	public String getResponsibility() {
		return responsibility;
	}

	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}

	public String getSonsy() {
		return sonsy;
	}

	public void setSonsy(String sonsy) {
		this.sonsy = sonsy;
	}

	public String getDiligence() {
		return diligence;
	}

	public void setDiligence(String diligence) {
		this.diligence = diligence;
	}

	public String getHumility() {
		return humility;
	}

	public void setHumility(String humility) {
		this.humility = humility;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getClear() {
		return clear;
	}

	public void setClear(String clear) {
		this.clear = clear;
	}

	public String getDobest() {
		return dobest;
	}

	public void setDobest(String dobest) {
		this.dobest = dobest;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getSluggish() {
		return sluggish;
	}

	public void setSluggish(String sluggish) {
		this.sluggish = sluggish;
	}

	public String getInferiority() {
		return inferiority;
	}

	public void setInferiority(String inferiority) {
		this.inferiority = inferiority;
	}

	public String getFluke() {
		return fluke;
	}

	public void setFluke(String fluke) {
		this.fluke = fluke;
	}

	public String getConceited() {
		return conceited;
	}

	public void setConceited(String conceited) {
		this.conceited = conceited;
	}

	public String getPride() {
		return pride;
	}

	public void setPride(String pride) {
		this.pride = pride;
	}

	public String getBoggle() {
		return boggle;
	}

	public void setBoggle(String boggle) {
		this.boggle = boggle;
	}

	public String getAcedia() {
		return acedia;
	}

	public void setAcedia(String acedia) {
		this.acedia = acedia;
	}

	public String getAnxiety() {
		return anxiety;
	}

	public void setAnxiety(String anxiety) {
		this.anxiety = anxiety;
	}

	public String getFalsity() {
		return falsity;
	}

	public void setFalsity(String falsity) {
		this.falsity = falsity;
	}

	public String getDream() {
		return dream;
	}

	public void setDream(String dream) {
		this.dream = dream;
	}

	public String getAdamancy() {
		return adamancy;
	}

	public void setAdamancy(String adamancy) {
		this.adamancy = adamancy;
	}

	public String getCynical() {
		return cynical;
	}

	public void setCynical(String cynical) {
		this.cynical = cynical;
	}

	public String getVulgar() {
		return vulgar;
	}

	public void setVulgar(String vulgar) {
		this.vulgar = vulgar;
	}

	public String getRecreance() {
		return recreance;
	}

	public void setRecreance(String recreance) {
		this.recreance = recreance;
	}

	public String getPeacockery() {
		return peacockery;
	}

	public void setPeacockery(String peacockery) {
		this.peacockery = peacockery;
	}

	public String getAvarice() {
		return avarice;
	}

	public void setAvarice(String avarice) {
		this.avarice = avarice;
	}

	public String getAsocial() {
		return asocial;
	}

	public void setAsocial(String asocial) {
		this.asocial = asocial;
	}

	public String getFussy() {
		return fussy;
	}

	public void setFussy(String fussy) {
		this.fussy = fussy;
	}

	public String getTestiness() {
		return testiness;
	}

	public void setTestiness(String testiness) {
		this.testiness = testiness;
	}

	public String getDespair() {
		return despair;
	}

	public void setDespair(String despair) {
		this.despair = despair;
	}

	public String getBegrudge() {
		return begrudge;
	}

	public void setBegrudge(String begrudge) {
		this.begrudge = begrudge;
	}

	public String getExcuse() {
		return excuse;
	}

	public void setExcuse(String excuse) {
		this.excuse = excuse;
	}

	

	

}