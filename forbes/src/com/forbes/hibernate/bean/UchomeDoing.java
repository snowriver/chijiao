package com.forbes.hibernate.bean;

/**
 * UchomeDoing entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UchomeDoing extends AbstractUchomeDoing implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UchomeDoing() {
	}

	/** full constructor */
	public UchomeDoing(Integer uid, String username, String from,
			Integer dateline, String message, String ip, Integer replynum,
			Short mood) {
		super(uid, username, from, dateline, message, ip, replynum, mood);
	}

}
