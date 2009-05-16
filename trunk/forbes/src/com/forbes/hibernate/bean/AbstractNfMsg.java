package com.forbes.hibernate.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * AbstractNfMsg entity provides the base persistence definition of the NfMsg
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractNfMsg implements java.io.Serializable {

	// Fields

	private Long id;
	private Integer userId;
	//private Short msgTypeId;
	private Short userType;
	private NfMsgType nfMsgType;
	private String msgContent;
	private Date msgDate;
	private String msgTitle;
	
	private Set nfMsgRelationships = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractNfMsg() {
	}

	/** full constructor */
	public AbstractNfMsg(Integer userId, Short userType, String msgContent,
			Date msgDate, String msgTitle) {
		this.userId = userId;
		//this.msgTypeId = msgTypeId;
		this.userType = userType;
		this.msgContent = msgContent;
		this.msgDate = msgDate;
		this.msgTitle = msgTitle;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	/*public Short getMsgTypeId() {
		return this.msgTypeId;
	}

	public void setMsgTypeId(Short msgTypeId) {
		this.msgTypeId = msgTypeId;
	}*/

	public String getMsgContent() {
		return this.msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public Date getMsgDate() {
		return this.msgDate;
	}

	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}

	public String getMsgTitle() {
		return this.msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public NfMsgType getNfMsgType() {
		return nfMsgType;
	}

	public void setNfMsgType(NfMsgType nfMsgType) {
		this.nfMsgType = nfMsgType;
	}

	public Set getNfMsgRelationships() {
		return nfMsgRelationships;
	}

	public void setNfMsgRelationships(Set nfMsgRelationships) {
		this.nfMsgRelationships = nfMsgRelationships;
	}

	public Short getUserType() {
		return userType;
	}

	public void setUserType(Short userType) {
		this.userType = userType;
	}

}