package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * UserScoreLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserScoreLog extends AbstractUserScoreLog implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserScoreLog() {
	}

	/** full constructor */
	public UserScoreLog(Long objectId, Integer amount, Short status,
			Date genDate, Long accountId, String remark, Integer balance,
			Integer presentBalance, Integer presentAmount) {
		super(objectId, amount, status, genDate, accountId, remark, balance,
				presentBalance, presentAmount);
	}

}
