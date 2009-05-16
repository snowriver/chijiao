package com.forbes.service.order;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.OrderService;
import com.forbes.hibernate.dao.OrderServiceDAO;
import com.forbes.util.Pager;

public interface OrderServiceManager {
	
	
	public OrderServiceDAO getOrderServiceDAO();
	public void setOrderServiceDAO(OrderServiceDAO orderServiceDAO);

	public OrderService getOrderService(String orderServiceId);
	
	public void addOrderService( OrderService orderService );
	
	public void updateOrderService( OrderService orderService );
	
	public void delOrderService( String orderServiceId )  throws ForbesException;
	
	public void modifyOrderService( OrderService orderService )  throws ForbesException;
	
	public List listOrderService();
	
	public List getOrderServiceByPage( Pager pager, int pageNo, String type, String keyWord, String orderBy ) throws ForbesException;
	
}
