package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * SearchKeyword entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class SearchKeyword extends AbstractSearchKeyword implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public SearchKeyword() {
	}

	/** full constructor */
	public SearchKeyword(String keyword, String spwords, Integer count,
			Integer result, Date lasttime, Short istag, Integer weekcc,
			Integer monthcc, Integer starttime, Integer weekup, Integer monthup) {
		super(keyword, spwords, count, result, lasttime, istag, weekcc,
				monthcc, starttime, weekup, monthup);
	}

}
