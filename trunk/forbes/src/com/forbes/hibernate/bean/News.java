package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * News entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class News extends AbstractNews implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public News() {
	}

	/** full constructor */
	public News(Integer userid, String likeid, Short iscommend, Integer click,
			String title, String shorttitle, String writer, String source,
			Date pubdate, Date senddate, String description, String keywords,
			Integer digg, Date diggtime, String isdelete, String litpic,
			Date sortrank, String color, Short arcrank) {
		super(userid, likeid, iscommend, click, title, shorttitle, writer,
				source, pubdate, senddate, description, keywords, digg,
				diggtime, isdelete, litpic, sortrank, color, arcrank);
	}

}
