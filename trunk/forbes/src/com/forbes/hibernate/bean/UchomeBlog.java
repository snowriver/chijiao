package com.forbes.hibernate.bean;

/**
 * UchomeBlog entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UchomeBlog extends AbstractUchomeBlog implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UchomeBlog() {
	}

	/** full constructor */
	public UchomeBlog(Integer uid, String username, String subject,
			Short classid, Integer viewnum, Integer replynum, Integer tracenum,
			Integer dateline, String pic, Byte picflag, Byte noreply,
			Byte friend, String password) {
		super(uid, username, subject, classid, viewnum, replynum, tracenum,
				dateline, pic, picflag, noreply, friend, password);
	}

}
