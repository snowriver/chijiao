package com.forbes.hibernate.bean;

/**
 * AbstractUchomeDoing entity provides the base persistence definition of the
 * UchomeDoing entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUchomeDoing implements java.io.Serializable {

	// Fields

	private Integer doid;
	private Integer uid;
	private String username;
	private String from;
	private Integer dateline;
	private String message;
	private String ip;
	private Integer replynum;
	private Short mood;

	// Constructors

	/** default constructor */
	public AbstractUchomeDoing() {
	}

	/** full constructor */
	public AbstractUchomeDoing(Integer uid, String username, String from,
			Integer dateline, String message, String ip, Integer replynum,
			Short mood) {
		this.uid = uid;
		this.username = username;
		this.from = from;
		this.dateline = dateline;
		this.message = message;
		this.ip = ip;
		this.replynum = replynum;
		this.mood = mood;
	}

	// Property accessors

	public Integer getDoid() {
		return this.doid;
	}

	public void setDoid(Integer doid) {
		this.doid = doid;
	}

	public Integer getUid() {
		return this.uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFrom() {
		return this.from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public Integer getDateline() {
		return this.dateline;
	}

	public void setDateline(Integer dateline) {
		this.dateline = dateline;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Integer getReplynum() {
		return this.replynum;
	}

	public void setReplynum(Integer replynum) {
		this.replynum = replynum;
	}

	public Short getMood() {
		return this.mood;
	}

	public void setMood(Short mood) {
		this.mood = mood;
	}

}