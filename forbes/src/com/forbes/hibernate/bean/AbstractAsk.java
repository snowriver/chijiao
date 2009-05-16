package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractAsk entity provides the base persistence definition of the Ask
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractAsk implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	//private UcMembers user;
	private String username;
	//private Integer typeId;
	private String typeName;
	//private Integer typeId2;
	
	private AskType askType;
	private AskType askType2;
	
	private String typeName2;
	private Short anonymous;
	private String title;
	private Short digest;
	private Short reward;
	private Date dateline;
	private Date expiredTime;
	private Date solveTime;
	private Long bestAnswer;
	private Short status;
	private Short disorder;
	private Integer views;
	private Integer replies;
	private String ip;
	private String content;
	private String extra;
	
	private Integer answerCnt;

	// Constructors

	public Integer getAnswerCnt() {
		return answerCnt;
	}

	public void setAnswerCnt(Integer answerCnt) {
		this.answerCnt = answerCnt;
	}

	/** default constructor */
	public AbstractAsk() {
	}

	/** minimal constructor */
	public AbstractAsk(Integer userId, Short anonymous, String title,
			Short digest, Short reward, Short status, Short disorder,
			Integer views, Integer replies, String content, String extra) {
		this.userId = userId;
		this.anonymous = anonymous;
		this.title = title;
		this.digest = digest;
		this.reward = reward;
		this.status = status;
		this.disorder = disorder;
		this.views = views;
		this.replies = replies;
		this.content = content;
		this.extra = extra;
	}

	/** full constructor */
	public AbstractAsk( Integer userId, String typeName, String typeName2, Short anonymous, String title,
			Short digest, Short reward, Date dateline, Date expiredTime,
			Date solveTime, Long bestAnswer, Short status, Short disorder,
			Integer views, Integer replies, String ip, String content,
			String extra) {
		this.userId = userId;
		//this.typeId = typeId;
		this.typeName = typeName;
		//this.typeId2 = typeId2;
		this.typeName2 = typeName2;
		this.anonymous = anonymous;
		this.title = title;
		this.digest = digest;
		this.reward = reward;
		this.dateline = dateline;
		this.expiredTime = expiredTime;
		this.solveTime = solveTime;
		this.bestAnswer = bestAnswer;
		this.status = status;
		this.disorder = disorder;
		this.views = views;
		this.replies = replies;
		this.ip = ip;
		this.content = content;
		this.extra = extra;
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

	/*public Integer getTypeId() {
		return this.typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}*/

	public String getTypeName() {
		return this.typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	/*public Integer getTypeId2() {
		return this.typeId2;
	}

	public void setTypeId2(Integer typeId2) {
		this.typeId2 = typeId2;
	}*/

	public String getTypeName2() {
		return this.typeName2;
	}

	public void setTypeName2(String typeName2) {
		this.typeName2 = typeName2;
	}

	public Short getAnonymous() {
		return this.anonymous;
	}

	public void setAnonymous(Short anonymous) {
		this.anonymous = anonymous;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Short getDigest() {
		return this.digest;
	}

	public void setDigest(Short digest) {
		this.digest = digest;
	}

	public Short getReward() {
		return this.reward;
	}

	public void setReward(Short reward) {
		this.reward = reward;
	}

	public Date getDateline() {
		return this.dateline;
	}

	public void setDateline(Date dateline) {
		this.dateline = dateline;
	}

	public Date getExpiredTime() {
		return this.expiredTime;
	}

	public void setExpiredTime(Date expiredTime) {
		this.expiredTime = expiredTime;
	}

	public Date getSolveTime() {
		return this.solveTime;
	}

	public void setSolveTime(Date solveTime) {
		this.solveTime = solveTime;
	}

	public Long getBestAnswer() {
		return this.bestAnswer;
	}

	public void setBestAnswer(Long bestAnswer) {
		this.bestAnswer = bestAnswer;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public Short getDisorder() {
		return this.disorder;
	}

	public void setDisorder(Short disorder) {
		this.disorder = disorder;
	}

	public Integer getViews() {
		return this.views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public Integer getReplies() {
		return this.replies;
	}

	public void setReplies(Integer replies) {
		this.replies = replies;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getExtra() {
		return this.extra;
	}

	public void setExtra(String extra) {
		this.extra = extra;
	}

	

	/*public UcMembers getUser() {
		return user;
	}

	public void setUser(UcMembers user) {
		this.user = user;
	}*/

	public AskType getAskType() {
		return askType;
	}

	public void setAskType(AskType askType) {
		this.askType = askType;
	}

	public AskType getAskType2() {
		return askType2;
	}

	public void setAskType2(AskType askType2) {
		this.askType2 = askType2;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}