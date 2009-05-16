package com.forbes.service.order.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;

public class ShoppingCar {
	
	private Map <String,ShoppingItem> orders = new HashMap();
	private float amount=0;
	
	public void addItem( ShoppingItem item ){
		ShoppingItem oldItem = orders.get(item.getServiceId());
		if ( oldItem != null ){
			oldItem.setCount(oldItem.getCount() + item.getCount() );
		}else{
			orders.put(item.getServiceId(), item);
		}
		calAmount();
	}
	public void reset(){
		amount = 0;
		orders.clear();
	}
	public void modifyItem( ShoppingItem item ){
		orders.put(item.getServiceId(), item);
	}
	public void removeItem( String serviceId){
		orders.remove(serviceId);
		calAmount();
	}
	public void calAmount(){
		amount = 0;
		Iterator it = orders.keySet().iterator();
		while ( it.hasNext() ){
			ShoppingItem item = orders.get(it.next());
			amount = amount + (float) (item.getPrice() * 1.0 * item.getDiscount()/100)*item.getCount();
		}

	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public Map<String, ShoppingItem> getOrders() {
		return orders;
	}
	public void setOrders(Map<String, ShoppingItem> orders) {
		this.orders = orders;
	}

}
