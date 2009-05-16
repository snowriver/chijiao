package com.forbes.hibernate.bean;

/**
 * AbstractNfMsgRelationship entity provides the base persistence definition of
 * the NfMsgRelationship entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractNfMsgRelationship implements java.io.Serializable {

	// Fields

	private Long id;
	//private Long msgId;
	private NfMsg nfMsg;
	private Integer userId;
	private Short userType;
	private Short msgTypeId;
	
	private Short viewTimes;

	// Constructors

	/** default constructor */
	public AbstractNfMsgRelationship() {
	}

	/** full constructor */
	public AbstractNfMsgRelationship(Integer userId, Short userType, Short viewTimes) {
		//this.msgId = msgId;
		this.userId = userId;
		this.userType = userType;
		this.viewTimes = viewTimes;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/*public Long getMsgId() {
		return this.msgId;
	}

	public void setMsgId(Long msgId) {
		this.msgId = msgId;
	}*/

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Short getViewTimes() {
		return this.viewTimes;
	}

	public void setViewTimes(Short viewTimes) {
		this.viewTimes = viewTimes;
	}

	public NfMsg getNfMsg() {
		return nfMsg;
	}

	public void setNfMsg(NfMsg nfMsg) {
		this.nfMsg = nfMsg;
	}

	public Short getUserType() {
		return userType;
	}

	public void setUserType(Short userType) {
		this.userType = userType;
	}

	public Short getMsgTypeId() {
		return msgTypeId;
	}

	public void setMsgTypeId(Short msgTypeId) {
		this.msgTypeId = msgTypeId;
	}

}