package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * Content entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Content extends AbstractContent implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Content() {
	}

	/** full constructor */
	public Content( String content, Date pubdate,
			String ip,Integer reId) {
		super( content, pubdate, ip, reId);
	}

}
