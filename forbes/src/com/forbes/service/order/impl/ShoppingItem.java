package com.forbes.service.order.impl;

import java.util.Date;
public class ShoppingItem {
	
	private String serviceId;
	private String serviceNameCh;
	private String serviceNameEn;
	private Short serviceType;
	private Short serviceCnt;
    private int price;
    private int discount;
    private int count;
    private String descs;
    private Date serviceDate;
    
	public String getDescs() {
		return descs;
	}
	public void setDescs(String descs) {
		this.descs = descs;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getServiceId() {
		return serviceId;
	}
	public void setServiceId(String serviceId) {
		this.serviceId = serviceId;
	}
	public String getServiceNameCh() {
		return serviceNameCh;
	}
	public void setServiceNameCh(String serviceNameCh) {
		this.serviceNameCh = serviceNameCh;
	}
	public String getServiceNameEn() {
		return serviceNameEn;
	}
	public void setServiceNameEn(String serviceNameEn) {
		this.serviceNameEn = serviceNameEn;
	}
	public Short getServiceType() {
		return serviceType;
	}
	public void setServiceType(Short serviceType) {
		this.serviceType = serviceType;
	}
	public Date getServiceDate() {
		return serviceDate;
	}
	public void setServiceDate(Date serviceDate) {
		this.serviceDate = serviceDate;
	}
	public Short getServiceCnt() {
		return serviceCnt;
	}
	public void setServiceCnt(Short serviceCnt) {
		this.serviceCnt = serviceCnt;
	}
}
