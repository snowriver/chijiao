package com.forbes.hibernate.bean;

/**
 * AbstractOrderService entity provides the base persistence definition of the
 * OrderService entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractOrderService implements java.io.Serializable {

	// Fields

	private Integer id;
	private String serviceNameCh;
	private String serviceNameEn;
	private Short serviceType;
	private Integer price;
	private Short discount;
	private String active;
	private String dealClass;
	private String serviceDisp;
	private Short serviceCount;
	private Short serviceUser;
	private String serviceDescs;
	private String needConfirm;
	private String needCsDeal;
	private String chargeNote;

	// Constructors

	/** default constructor */
	public AbstractOrderService() {
	}

	/** full constructor */
	public AbstractOrderService(String serviceNameCh, String serviceNameEn,
			Short serviceType, Integer price, Short discount, String active,
			String dealClass, String serviceDisp, Short serviceCount,
			Short serviceUser, String serviceDescs, String needConfirm,
			String needCsDeal, String chargeNote) {
		this.serviceNameCh = serviceNameCh;
		this.serviceNameEn = serviceNameEn;
		this.serviceType = serviceType;
		this.price = price;
		this.discount = discount;
		this.active = active;
		this.dealClass = dealClass;
		this.serviceDisp = serviceDisp;
		this.serviceCount = serviceCount;
		this.serviceUser = serviceUser;
		this.serviceDescs = serviceDescs;
		this.needConfirm = needConfirm;
		this.needCsDeal = needCsDeal;
		this.chargeNote = chargeNote;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getServiceNameCh() {
		return this.serviceNameCh;
	}

	public void setServiceNameCh(String serviceNameCh) {
		this.serviceNameCh = serviceNameCh;
	}

	public String getServiceNameEn() {
		return this.serviceNameEn;
	}

	public void setServiceNameEn(String serviceNameEn) {
		this.serviceNameEn = serviceNameEn;
	}

	public Short getServiceType() {
		return this.serviceType;
	}

	public void setServiceType(Short serviceType) {
		this.serviceType = serviceType;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Short getDiscount() {
		return this.discount;
	}

	public void setDiscount(Short discount) {
		this.discount = discount;
	}

	public String getActive() {
		return this.active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getDealClass() {
		return this.dealClass;
	}

	public void setDealClass(String dealClass) {
		this.dealClass = dealClass;
	}

	public String getServiceDisp() {
		return this.serviceDisp;
	}

	public void setServiceDisp(String serviceDisp) {
		this.serviceDisp = serviceDisp;
	}

	public Short getServiceCount() {
		return this.serviceCount;
	}

	public void setServiceCount(Short serviceCount) {
		this.serviceCount = serviceCount;
	}

	public Short getServiceUser() {
		return this.serviceUser;
	}

	public void setServiceUser(Short serviceUser) {
		this.serviceUser = serviceUser;
	}

	public String getServiceDescs() {
		return this.serviceDescs;
	}

	public void setServiceDescs(String serviceDescs) {
		this.serviceDescs = serviceDescs;
	}

	public String getNeedConfirm() {
		return this.needConfirm;
	}

	public void setNeedConfirm(String needConfirm) {
		this.needConfirm = needConfirm;
	}

	public String getNeedCsDeal() {
		return this.needCsDeal;
	}

	public void setNeedCsDeal(String needCsDeal) {
		this.needCsDeal = needCsDeal;
	}

	public String getChargeNote() {
		return this.chargeNote;
	}

	public void setChargeNote(String chargeNote) {
		this.chargeNote = chargeNote;
	}

}