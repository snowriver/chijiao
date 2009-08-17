package com.forbes.service.order.impl;

import java.util.*;

import com.forbes.hibernate.bean.OrderService;
import com.forbes.hibernate.bean.UserOrder;
import com.forbes.hibernate.bean.UserOrderItem;
import com.forbes.hibernate.bean.UserService;
import com.forbes.hibernate.dao.OrderServiceDAO;
import com.forbes.hibernate.dao.UserOrderDAO;
import com.forbes.hibernate.dao.UserOrderItemDAO;
import com.forbes.hibernate.dao.UserPaymentLogDAO;
import com.forbes.hibernate.dao.UserServiceDAO;
import com.forbes.service.order.OrderManager;

/*import com.she.hibernate.UserOrder;
import com.she.hibernate.OrdService;
import com.she.hibernate.UserOrderItem;
import com.she.hibernate.UsrPaymentLog;
import com.she.hibernate.dao.UserOrderDAO;
import com.she.hibernate.dao.UserOrderItemDAO;
import com.she.hibernate.dao.OrdServiceDAO;
import com.she.hibernate.dao.UsrPaymentLogDAO;
import com.she.service.ord.OrderManager;
import com.she.service.ord.impl.ShoppingCar;
import com.she.service.usrservice.impl.IProcessor;*/
public class OrderManagerImpl implements OrderManager{
	
	/*private UserOrderDAO     userOrderDAO;
	private UserOrderItemDAO userOrderItemDAO;
	private UserServiceDAO   userServiceDAO;
	private UserPaymentLogDAO uesrPaymentLogDAO;
	
	public List findServiceOfDay( String day ,String userId){
		return userOrderDAO.findServiceOfDay( day,userId );
	}
	public List findServiceOfMonth( String month ,String userId){
		return userOrderDAO.findServiceOfMonth( month,userId );
	}
	public UserOrder getOrder(String orderId){
		return userOrderDAO.findById( new Long(orderId) );
	}
	public UserOrder createOrder(int payMethod,ShoppingCar shoppingCar,String userId,String userType){
		UserOrder order = new UserOrder();
		order.setPayMethod((short)payMethod);
		order.setUserId(new Long(userId));
		order.setUserType(new Short(userType));
		order.setTotal( (long)(shoppingCar.getAmount() * 100 +0.5) );
		order.setStatus((short)0);
		order.setOrderDate( Calendar.getInstance().getTime() );
		userOrderDAO.save(order);
		
		Map <String,ShoppingItem> map = shoppingCar.getOrders();
		Iterator it = map.keySet().iterator();
		while ( it.hasNext() ){
			ShoppingItem shopItem = map.get( it.next() );
			UserService orderService = userServiceDAO.findById(new Integer(shopItem.getServiceId()));
			UserOrderItem orderItem = new UserOrderItem();
			orderItem.setUserOrder(order);
			orderItem.setOrdService(orderService);
			if( orderService!=null && orderService.getNeedConfirm() != null && orderService.getNeedConfirm().equals("Y") ){
				order.setStatus((short)-1);
				userOrderDAO.merge(order);
			}
			orderItem.setCount((short)shopItem.getCount());
			orderItem.setPrice( shopItem.getPrice()*100 * shopItem.getDiscount() /100);
			orderItem.setServiceDetail( shopItem.getDescs() );
			orderItem.setDealStatus((short)0);
			orderItem.setServiceDate( shopItem.getServiceDate() );
			order.getUserOrderItems().add(orderItem);
			userOrderItemDAO.save(orderItem);
		}
		//创建支付記錄
		
		UsrPaymentLog usrPayment = new UsrPaymentLog();
		usrPayment.setUserOrder( order );
		usrPayment.setPayMethod((short)payMethod);
		usrPayment.setAmount( order.getTotal() );
		usrPayment.setStatus((short)0);
		usrPayment.setPayDate( Calendar.getInstance().getTime() );
		uesrPaymentLogDAO.save(usrPayment);
		
		return order;
	}
	public UserOrder createOrder(int payMethod,String serviceId,Object [] param,String userId,String userType){
		OrdService orderService = userServiceDAO.findById(new Integer(serviceId));
		UserOrder order = new UserOrder();
		order.setPayMethod((short)payMethod);
		order.setUserId(new Long(userId));
		order.setUserType(new Short(userType));
		order.setTotal( (int)(orderService.getPrice() * 100 +0.5) );
		order.setStatus((short)0);
		order.setOrderDate( Calendar.getInstance().getTime() );
		userOrderDAO.save(order);
		
		UserOrderItem orderItem = new UserOrderItem();
		orderItem.setUserOrder(order);
		orderItem.setOrdService(orderService);
		if( orderService!=null && orderService.getNeedConfirm() != null && orderService.getNeedConfirm().equals("Y") ){
			order.setStatus((short)-1);
			userOrderDAO.merge(order);
		}
		orderItem.setCount((short)1);
		orderItem.setPrice( (int)(orderService.getPrice() * 100) );
		
		//不同業務需要記錄不同的參數
		try{
		    IProcessor userServiceProccessor = (IProcessor)Class.forName("com.she.service.usrservice.impl." + orderService.getDealClass()).newInstance();
		    //用detail來記錄參數，暫時之需要
		    orderItem.setServiceDetail( userServiceProccessor.processArgs(param) );
		}catch( Exception e){
			e.printStackTrace();
		}
		orderItem.setDealStatus((short)0);
		
		order.getUserOrderItems().add(orderItem);
		userOrderItemDAO.save(orderItem);
		
	
		return order;
	}*/
	
}
 