package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * Ask entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Ask extends AbstractAsk implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Ask() {
	}

	/** minimal constructor */
	public Ask(Integer userId, Short anonymous, String title, Short digest,
			Short reward, Short status, Short disorder, Integer views,
			Integer replies, String content, String extra) {
		super(userId, anonymous, title, digest, reward, status, disorder,
				views, replies, content, extra);
	}

	/** full constructor */
	public Ask(Integer userId, String typeName, String typeName2, Short anonymous, String title,
			Short digest, Short reward, Date dateline, Date expiredTime,
			Date solveTime, Long bestAnswer, Short status, Short disorder,
			Integer views, Integer replies, String ip, String content,
			String extra) {
		super(userId, typeName, typeName2, anonymous, title,
				digest, reward, dateline, expiredTime, solveTime, bestAnswer,
				status, disorder, views, replies, ip, content, extra);
	}

}
