package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * Bulletin entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Bulletin extends AbstractBulletin implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Bulletin() {
	}

	/** full constructor */
	public Bulletin(Integer click, String title, Date pubdate, Date deadline,
			String color, Short rank, String content) {
		super(click, title, pubdate, deadline, color, rank, content);
	}

}
