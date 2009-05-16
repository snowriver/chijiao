package com.forbes.hibernate.bean;

/**
 * AbstractNfMsgType entity provides the base persistence definition of the
 * NfMsgType entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractNfMsgType implements java.io.Serializable {

	// Fields

	private Short id;
	private String msgTypeCh;
	private Short level;

	// Constructors

	/** default constructor */
	public AbstractNfMsgType() {
	}

	/** full constructor */
	public AbstractNfMsgType(String msgTypeCh, Short level) {
		this.msgTypeCh = msgTypeCh;
		this.level = level;
	}

	// Property accessors

	public Short getId() {
		return this.id;
	}

	public void setId(Short id) {
		this.id = id;
	}

	public String getMsgTypeCh() {
		return this.msgTypeCh;
	}

	public void setMsgTypeCh(String msgTypeCh) {
		this.msgTypeCh = msgTypeCh;
	}

	public Short getLevel() {
		return this.level;
	}

	public void setLevel(Short level) {
		this.level = level;
	}

}