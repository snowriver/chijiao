package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * NfMsg entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class NfMsg extends AbstractNfMsg implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public NfMsg() {
	}

	/** full constructor */
	public NfMsg(Integer userId, Short userType, String msgContent,
			Date msgDate, String msgTitle) {
		super(userId, userType, msgContent, msgDate, msgTitle);
	}

}
