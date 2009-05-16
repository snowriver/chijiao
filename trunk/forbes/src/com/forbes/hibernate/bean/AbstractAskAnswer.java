package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractAskAnswer entity provides the base persistence definition of the
 * AskAnswer entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractAskAnswer implements java.io.Serializable {

	// Fields

	private Long id;
	//private Integer askId;
	private Ask ask;
	private Short ifAnswer;
	private Integer userId;
	//private UcMembers user;
	private String loginName;
	private Short anonymous;
	private Short goodRate;
	private Short badRate;
	private String userIp;
	private Date pubdate;
	private Date modifyDate;
	private String brief;
	private String content;
	private Short ifCheck;
	private String referTo;
	// Constructors

	/** default constructor */
	public AbstractAskAnswer() {
	}

	/** minimal constructor */
	public AbstractAskAnswer(Ask ask, Short ifAnswer, String loginName,
			Short anonymous, Short goodRate, Short badRate, String content, String referTo) {
		this.ask = ask;
		this.ifAnswer = ifAnswer;
		this.loginName = loginName;
		this.anonymous = anonymous;
		this.goodRate = goodRate;
		this.badRate = badRate;
		this.content = content;
		this.referTo = referTo;
	}

	/** full constructor */
	public AbstractAskAnswer(Ask ask, Short ifAnswer, Integer userId, String loginName, Short anonymous,
			Short goodRate, Short badRate, String userIp, Date pubdate,
			String brief, String content, Short ifCheck, String referTo) {
		this.ask = ask;
		this.ifAnswer = ifAnswer;
		this.userId = userId;
		this.loginName = loginName;
		this.anonymous = anonymous;
		this.goodRate = goodRate;
		this.badRate = badRate;
		this.userIp = userIp;
		this.pubdate = pubdate;
		this.brief = brief;
		this.content = content;
		this.ifCheck = ifCheck;
		this.referTo = referTo;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/*public Integer getAskId() {
		return this.askId;
	}

	public void setAskId(Integer askId) {
		this.askId = askId;
	}*/

	public Short getIfAnswer() {
		return this.ifAnswer;
	}

	public void setIfAnswer(Short ifAnswer) {
		this.ifAnswer = ifAnswer;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public Short getAnonymous() {
		return this.anonymous;
	}

	public void setAnonymous(Short anonymous) {
		this.anonymous = anonymous;
	}

	public Short getGoodRate() {
		return this.goodRate;
	}

	public void setGoodRate(Short goodRate) {
		this.goodRate = goodRate;
	}

	public Short getBadRate() {
		return this.badRate;
	}

	public void setBadRate(Short badRate) {
		this.badRate = badRate;
	}

	public String getUserIp() {
		return this.userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

	public Date getPubdate() {
		return this.pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public String getBrief() {
		return this.brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Short getIfCheck() {
		return this.ifCheck;
	}

	public void setIfCheck(Short ifCheck) {
		this.ifCheck = ifCheck;
	}

	public String getReferTo() {
		return referTo;
	}

	public void setReferTo(String referTo) {
		this.referTo = referTo;
	}

	

	/*public UcMembers getUser() {
		return user;
	}

	public void setUser(UcMembers user) {
		this.user = user;
	}*/

	public Ask getAsk() {
		return ask;
	}

	public void setAsk(Ask ask) {
		this.ask = ask;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

}