package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserWeekAttitude entity provides the base persistence definition of
 * the UserWeekAttitude entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserWeekAttitude implements java.io.Serializable {

	// Fields

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

	// Constructors

	/** default constructor */
	public AbstractUserWeekAttitude() {
	}

	/** full constructor */
	public AbstractUserWeekAttitude(Integer userId, Date date,
			String confident, String intent, String initiative,
			String ebullient, String love, String study, String autonomic,
			String pertinacious, String insist, String serious, String rapid,
			String optimism, String innovation, String honest,
			String responsibility, String sonsy, String diligence,
			String humility, String purpose, String clear, String dobest,
			String team, String sluggish, String inferiority, String fluke,
			String conceited, String pride, String boggle, String acedia,
			String anxiety, String falsity, String dream, String adamancy,
			String cynical, String vulgar, String recreance, String peacockery,
			String avarice, String asocial, String fussy, String testiness,
			String despair, String begrudge, String excuse) {
		this.userId = userId;
		this.date = date;
		this.confident = confident;
		this.intent = intent;
		this.initiative = initiative;
		this.ebullient = ebullient;
		this.love = love;
		this.study = study;
		this.autonomic = autonomic;
		this.pertinacious = pertinacious;
		this.insist = insist;
		this.serious = serious;
		this.rapid = rapid;
		this.optimism = optimism;
		this.innovation = innovation;
		this.honest = honest;
		this.responsibility = responsibility;
		this.sonsy = sonsy;
		this.diligence = diligence;
		this.humility = humility;
		this.purpose = purpose;
		this.clear = clear;
		this.dobest = dobest;
		this.team = team;
		this.sluggish = sluggish;
		this.inferiority = inferiority;
		this.fluke = fluke;
		this.conceited = conceited;
		this.pride = pride;
		this.boggle = boggle;
		this.acedia = acedia;
		this.anxiety = anxiety;
		this.falsity = falsity;
		this.dream = dream;
		this.adamancy = adamancy;
		this.cynical = cynical;
		this.vulgar = vulgar;
		this.recreance = recreance;
		this.peacockery = peacockery;
		this.avarice = avarice;
		this.asocial = asocial;
		this.fussy = fussy;
		this.testiness = testiness;
		this.despair = despair;
		this.begrudge = begrudge;
		this.excuse = excuse;
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

	public String getConfident() {
		return this.confident;
	}

	public void setConfident(String confident) {
		this.confident = confident;
	}

	public String getIntent() {
		return this.intent;
	}

	public void setIntent(String intent) {
		this.intent = intent;
	}

	public String getInitiative() {
		return this.initiative;
	}

	public void setInitiative(String initiative) {
		this.initiative = initiative;
	}

	public String getEbullient() {
		return this.ebullient;
	}

	public void setEbullient(String ebullient) {
		this.ebullient = ebullient;
	}

	public String getLove() {
		return this.love;
	}

	public void setLove(String love) {
		this.love = love;
	}

	public String getStudy() {
		return this.study;
	}

	public void setStudy(String study) {
		this.study = study;
	}

	public String getAutonomic() {
		return this.autonomic;
	}

	public void setAutonomic(String autonomic) {
		this.autonomic = autonomic;
	}

	public String getPertinacious() {
		return this.pertinacious;
	}

	public void setPertinacious(String pertinacious) {
		this.pertinacious = pertinacious;
	}

	public String getInsist() {
		return this.insist;
	}

	public void setInsist(String insist) {
		this.insist = insist;
	}

	public String getSerious() {
		return this.serious;
	}

	public void setSerious(String serious) {
		this.serious = serious;
	}

	public String getRapid() {
		return this.rapid;
	}

	public void setRapid(String rapid) {
		this.rapid = rapid;
	}

	public String getOptimism() {
		return this.optimism;
	}

	public void setOptimism(String optimism) {
		this.optimism = optimism;
	}

	public String getInnovation() {
		return this.innovation;
	}

	public void setInnovation(String innovation) {
		this.innovation = innovation;
	}

	public String getHonest() {
		return this.honest;
	}

	public void setHonest(String honest) {
		this.honest = honest;
	}

	public String getResponsibility() {
		return this.responsibility;
	}

	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}

	public String getSonsy() {
		return this.sonsy;
	}

	public void setSonsy(String sonsy) {
		this.sonsy = sonsy;
	}

	public String getDiligence() {
		return this.diligence;
	}

	public void setDiligence(String diligence) {
		this.diligence = diligence;
	}

	public String getHumility() {
		return this.humility;
	}

	public void setHumility(String humility) {
		this.humility = humility;
	}

	public String getPurpose() {
		return this.purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getClear() {
		return this.clear;
	}

	public void setClear(String clear) {
		this.clear = clear;
	}

	public String getDobest() {
		return this.dobest;
	}

	public void setDobest(String dobest) {
		this.dobest = dobest;
	}

	public String getTeam() {
		return this.team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getSluggish() {
		return this.sluggish;
	}

	public void setSluggish(String sluggish) {
		this.sluggish = sluggish;
	}

	public String getInferiority() {
		return this.inferiority;
	}

	public void setInferiority(String inferiority) {
		this.inferiority = inferiority;
	}

	public String getFluke() {
		return this.fluke;
	}

	public void setFluke(String fluke) {
		this.fluke = fluke;
	}

	public String getConceited() {
		return this.conceited;
	}

	public void setConceited(String conceited) {
		this.conceited = conceited;
	}

	public String getPride() {
		return this.pride;
	}

	public void setPride(String pride) {
		this.pride = pride;
	}

	public String getBoggle() {
		return this.boggle;
	}

	public void setBoggle(String boggle) {
		this.boggle = boggle;
	}

	public String getAcedia() {
		return this.acedia;
	}

	public void setAcedia(String acedia) {
		this.acedia = acedia;
	}

	public String getAnxiety() {
		return this.anxiety;
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
		return this.dream;
	}

	public void setDream(String dream) {
		this.dream = dream;
	}

	public String getAdamancy() {
		return this.adamancy;
	}

	public void setAdamancy(String adamancy) {
		this.adamancy = adamancy;
	}

	public String getCynical() {
		return this.cynical;
	}

	public void setCynical(String cynical) {
		this.cynical = cynical;
	}

	public String getVulgar() {
		return this.vulgar;
	}

	public void setVulgar(String vulgar) {
		this.vulgar = vulgar;
	}

	public String getRecreance() {
		return this.recreance;
	}

	public void setRecreance(String recreance) {
		this.recreance = recreance;
	}

	public String getPeacockery() {
		return this.peacockery;
	}

	public void setPeacockery(String peacockery) {
		this.peacockery = peacockery;
	}

	public String getAvarice() {
		return this.avarice;
	}

	public void setAvarice(String avarice) {
		this.avarice = avarice;
	}

	public String getAsocial() {
		return this.asocial;
	}

	public void setAsocial(String asocial) {
		this.asocial = asocial;
	}

	public String getFussy() {
		return this.fussy;
	}

	public void setFussy(String fussy) {
		this.fussy = fussy;
	}

	public String getTestiness() {
		return this.testiness;
	}

	public void setTestiness(String testiness) {
		this.testiness = testiness;
	}

	public String getDespair() {
		return this.despair;
	}

	public void setDespair(String despair) {
		this.despair = despair;
	}

	public String getBegrudge() {
		return this.begrudge;
	}

	public void setBegrudge(String begrudge) {
		this.begrudge = begrudge;
	}

	public String getExcuse() {
		return this.excuse;
	}

	public void setExcuse(String excuse) {
		this.excuse = excuse;
	}

}