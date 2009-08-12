package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUserWeekAbility entity provides the base persistence definition of
 * the UserWeekAbility entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserWeekAbility implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Date date;
	private String ardour;
	private String promises;
	private String responsibility;
	private String admire;
	private String contribute;
	private String believe;
	private String winwin;
	private String listen;
	private String focus;
	private String echo;
	private String praise;
	private String convince;
	private String feedback;
	private String thank;
	private String visualize;
	private String study;
	private String innovation;
	private String love;
	private String gumption;
	private String purpose;
	private String intent;
	private String professional;
	private String willpower;

	// Constructors

	/** default constructor */
	public AbstractUserWeekAbility() {
	}

	/** full constructor */
	public AbstractUserWeekAbility(Integer userId, Date date, String ardour,
			String promises, String responsibility, String admire,
			String contribute, String believe, String winwin, String listen,
			String focus, String echo, String praise, String convince,
			String feedback, String thank, String visualize, String study,
			String innovation, String love, String gumption, String purpose,
			String intent, String professional, String willpower) {
		this.userId = userId;
		this.date = date;
		this.ardour = ardour;
		this.promises = promises;
		this.responsibility = responsibility;
		this.admire = admire;
		this.contribute = contribute;
		this.believe = believe;
		this.winwin = winwin;
		this.listen = listen;
		this.focus = focus;
		this.echo = echo;
		this.praise = praise;
		this.convince = convince;
		this.feedback = feedback;
		this.thank = thank;
		this.visualize = visualize;
		this.study = study;
		this.innovation = innovation;
		this.love = love;
		this.gumption = gumption;
		this.purpose = purpose;
		this.intent = intent;
		this.professional = professional;
		this.willpower = willpower;
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

	public String getArdour() {
		return this.ardour;
	}

	public void setArdour(String ardour) {
		this.ardour = ardour;
	}

	public String getPromises() {
		return this.promises;
	}

	public void setPromises(String promises) {
		this.promises = promises;
	}

	public String getResponsibility() {
		return this.responsibility;
	}

	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}

	public String getAdmire() {
		return this.admire;
	}

	public void setAdmire(String admire) {
		this.admire = admire;
	}

	public String getContribute() {
		return this.contribute;
	}

	public void setContribute(String contribute) {
		this.contribute = contribute;
	}

	public String getBelieve() {
		return this.believe;
	}

	public void setBelieve(String believe) {
		this.believe = believe;
	}

	public String getWinwin() {
		return this.winwin;
	}

	public void setWinwin(String winwin) {
		this.winwin = winwin;
	}

	public String getListen() {
		return this.listen;
	}

	public void setListen(String listen) {
		this.listen = listen;
	}

	public String getFocus() {
		return this.focus;
	}

	public void setFocus(String focus) {
		this.focus = focus;
	}

	public String getEcho() {
		return this.echo;
	}

	public void setEcho(String echo) {
		this.echo = echo;
	}

	public String getPraise() {
		return this.praise;
	}

	public void setPraise(String praise) {
		this.praise = praise;
	}

	public String getConvince() {
		return this.convince;
	}

	public void setConvince(String convince) {
		this.convince = convince;
	}

	public String getFeedback() {
		return this.feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public String getThank() {
		return this.thank;
	}

	public void setThank(String thank) {
		this.thank = thank;
	}

	public String getVisualize() {
		return this.visualize;
	}

	public void setVisualize(String visualize) {
		this.visualize = visualize;
	}

	public String getStudy() {
		return this.study;
	}

	public void setStudy(String study) {
		this.study = study;
	}

	public String getInnovation() {
		return this.innovation;
	}

	public void setInnovation(String innovation) {
		this.innovation = innovation;
	}

	public String getLove() {
		return this.love;
	}

	public void setLove(String love) {
		this.love = love;
	}

	public String getGumption() {
		return this.gumption;
	}

	public void setGumption(String gumption) {
		this.gumption = gumption;
	}

	public String getPurpose() {
		return this.purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getIntent() {
		return this.intent;
	}

	public void setIntent(String intent) {
		this.intent = intent;
	}

	public String getProfessional() {
		return this.professional;
	}

	public void setProfessional(String professional) {
		this.professional = professional;
	}

	public String getWillpower() {
		return this.willpower;
	}

	public void setWillpower(String willpower) {
		this.willpower = willpower;
	}

}