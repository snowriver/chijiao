package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * UserPaymentLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserPaymentLog extends AbstractUserPaymentLog implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserPaymentLog() {
	}

	/** full constructor */
	public UserPaymentLog(Long orderId, Short payMethod, String checkNo,
			String bankOrderId, Integer amount, Short status, Date payDate,
			Long accountId, String remark, Integer balance,
			Integer presentBalance, Integer presentAmount) {
		super(orderId, payMethod, checkNo, bankOrderId, amount, status,
				payDate, accountId, remark, balance, presentBalance,
				presentAmount);
	}

}
