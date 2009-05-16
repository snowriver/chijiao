package com.forbes.hibernate.bean;

/**
 * CdbThreads entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class CdbThreads extends AbstractCdbThreads implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public CdbThreads() {
	}

	/** full constructor */
	public CdbThreads(Short fid, Short iconid, Short typeid, Short sortid,
			Short readperm, Short price, String author, Integer authorid,
			String subject, Integer dateline, Integer lastpost,
			String lastposter, Integer views, Integer replies,
			Byte displayorder, Byte highlight, Byte digest, Byte rate,
			Byte special, Byte attachment, Byte subscribed, Byte moderated,
			Integer closed, Integer itemid, Byte supePushstatus) {
		super(fid, iconid, typeid, sortid, readperm, price, author, authorid,
				subject, dateline, lastpost, lastposter, views, replies,
				displayorder, highlight, digest, rate, special, attachment,
				subscribed, moderated, closed, itemid, supePushstatus);
	}

}
