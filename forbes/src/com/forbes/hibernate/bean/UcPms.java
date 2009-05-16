package com.forbes.hibernate.bean;

/**
 * UcPms entity. @author MyEclipse Persistence Tools
 */
public class UcPms extends AbstractUcPms implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public UcPms() {
	}

	/** full constructor */
	public UcPms(String msgfrom, Integer msgfromid, Integer msgtoid,
			String folder, Boolean new_, String subject, Integer dateline,
			String message, Boolean delstatus, Integer related, Short fromappid) {
		super(msgfrom, msgfromid, msgtoid, folder, new_, subject, dateline,
				message, delstatus, related, fromappid);
	}

}
