package com.forbes.service.order.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.OrderService;
import com.forbes.hibernate.dao.OrderServiceDAO;
import com.forbes.service.order.OrderServiceManager;
import com.forbes.util.Pager;


public class OrderServiceManagerImpl implements OrderServiceManager {
	
	private OrderServiceDAO orderServiceDAO;
	
	public OrderService getOrderService(String orderServiceId){
		return orderServiceDAO.findById( new Integer(orderServiceId) );
	}
	public void addOrderService( OrderService orderService ) {
		orderService.setActive("Y");
		orderServiceDAO.save(orderService);
	}
	public void updateOrderService( OrderService orderService ) {
		//orderService.setActive("Y");
		orderServiceDAO.attachDirty(orderService);
	}
	public void delOrderService( String orderServiceId )  throws ForbesException{
		OrderService orderService = orderServiceDAO.findById( new Integer(orderServiceId) );
		orderService.setActive("N");
		orderServiceDAO.save(orderService);
	}
	public void modifyOrderService( OrderService orderService )  throws ForbesException{
		orderServiceDAO.merge(orderService);
	}
	
	public OrderServiceDAO getOrderServiceDAO() {
		return orderServiceDAO;
	}
	public void setOrderServiceDAO(OrderServiceDAO orderServiceDAO) {
		this.orderServiceDAO = orderServiceDAO;
	}
	public List listOrderService(){
		return orderServiceDAO.findByActive("Y");
	}
	
	public List getOrderServiceByPage( Pager pager, int pageNo, String type, String keyWord, String orderBy ) throws ForbesException{
		try {			
			pager.setTotoalCnt(orderServiceDAO.getCount(type, keyWord));
			List list = orderServiceDAO.findOrderServiceByPage( type, keyWord, orderBy, 
					(pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
}
