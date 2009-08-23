package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * Content entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Comment extends AbstractComment implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** full constructor */
	public Comment( String content, Date pubdate,
			String ip,Integer reId) {
		super( content, pubdate, ip, reId);
	}

}
