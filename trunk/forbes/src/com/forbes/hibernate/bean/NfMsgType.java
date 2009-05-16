package com.forbes.hibernate.bean;

/**
 * NfMsgType entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class NfMsgType extends AbstractNfMsgType implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public NfMsgType() {
	}

	/** full constructor */
	public NfMsgType(String msgTypeCh, String msgTypeEn, Short level) {
		super(msgTypeCh, level);
	}

}
