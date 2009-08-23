package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * Article entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Video extends AbstractVideo implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Video() {
	}

	/** full constructor */
	public Video(Integer userid, String userip, String likeid, Short iscommend, Short isverify,
			Integer click, String title, String shorttitle, String writer,
			String source, Date pubdate, Date senddate, String description,
			String keywords, Integer digg, Date diggtime, String isdelete,
			Date lastpost, String litpic, Short litpictype, Date sortrank, String color,
			Short arcrank, String content ) {
		super(userid, userip, likeid, iscommend, isverify,
				click, title, shorttitle, writer, source, pubdate, senddate,
				description, keywords, digg, diggtime, isdelete, lastpost,
				litpic, litpictype, sortrank, color, arcrank, content );
	}

}
