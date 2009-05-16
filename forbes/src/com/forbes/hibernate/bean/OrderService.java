package com.forbes.hibernate.bean;

/**
 * OrderService entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class OrderService extends AbstractOrderService implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public OrderService() {
	}

	/** full constructor */
	public OrderService(String serviceNameCh, String serviceNameEn,
			Short serviceType, Integer price, Short discount, String active,
			String dealClass, String serviceDisp, Short serviceCount,
			Short serviceUser, String serviceDescs, String needConfirm,
			String needCsDeal, String chargeNote) {
		super(serviceNameCh, serviceNameEn, serviceType, price, discount,
				active, dealClass, serviceDisp, serviceCount, serviceUser,
				serviceDescs, needConfirm, needCsDeal, chargeNote);
	}

}
