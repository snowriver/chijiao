package com.forbes.hibernate.bean;

/**
 * NfMsgRelationship entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class NfMsgRelationship extends AbstractNfMsgRelationship implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public NfMsgRelationship() {
	}

	/** full constructor */
	public NfMsgRelationship( Integer userId, Short userType, Short viewTimes) {
		super( userId, userType, viewTimes);
	}

}
