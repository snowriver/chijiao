package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AskAnswer entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class AskAnswer extends AbstractAskAnswer implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public AskAnswer() {
	}

	/** minimal constructor */
	public AskAnswer(Ask ask, Short ifAnswer, String loginName,
			Short anonymous, Short goodRate, Short badRate, String content, String referTo) {
		super(ask, ifAnswer, loginName, anonymous, goodRate, badRate, content, referTo);
	}

	/** full constructor */
	public AskAnswer(Ask ask, Short ifAnswer, Integer userId, String loginName, Short anonymous,
			Short goodRate, Short badRate, String userIp, Date pubdate,
			String brief, String content, Short ifCheck, String referTo) {
		super(ask, ifAnswer, userId, loginName, anonymous,
				goodRate, badRate, userIp, pubdate, brief, content, ifCheck, referTo);
	}

}
