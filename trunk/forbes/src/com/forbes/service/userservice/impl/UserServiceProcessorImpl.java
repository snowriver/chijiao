package com.forbes.service.userservice.impl;

import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.forbes.hibernate.bean.UserOrderItem;
import com.forbes.hibernate.bean.UserService;
import com.forbes.hibernate.dao.OrderServiceDAO;
import com.forbes.hibernate.dao.UserServiceDAO;
import com.forbes.service.userservice.UserServiceProcessor;
import com.forbes.util.Pager;


public class UserServiceProcessorImpl implements UserServiceProcessor {
	
	private UserServiceDAO userServiceDAO;
	private OrderServiceDAO orderServiceDAO;
    private IProcessor processor = null;
    private static ApplicationContext ctx = null;
    static{
		ctx = new ClassPathXmlApplicationContext("applicationContext.xml");  
	}
	public void initUsrService(UserOrderItem orderItem){
		processor  = ( IProcessor )ctx.getBean( orderItem.getOrderService().getDealClass() );
		processor.initUsrService(orderItem);
	}
	public void process(UserService userService){
		processor  = ( IProcessor )ctx.getBean( userService.getDealClass() );
		processor.process(userService);
	}
	public void process(String userId,String dealClass){
		processor  = ( IProcessor )ctx.getBean( dealClass );
		processor.process(userId);
	}

	public boolean auth(String userId,String dealClass,String param){
		processor  = ( IProcessor )ctx.getBean( dealClass );
		return processor.auth(userId,param);
	}
	public List getUsrService(String userId){
		return userServiceDAO.findUserServiceByUser(userId);
	}
	
	public UserServiceDAO getUserServiceDAO() {
		return userServiceDAO;
	}
	public void setUserServiceDAO(UserServiceDAO userServiceDAO) {
		this.userServiceDAO = userServiceDAO;
	}
	public List getNeedCSUserService(Pager pager){
		pager.setTotoalCnt( userServiceDAO.getNeedCSUserServiceCnt() );
		return userServiceDAO.getNeedCSUserService(pager);
	}
	public List searchNeedCSUserService( String usrLoginName,String usrName,String begDate,String endDate,String agentId,Pager pager){
		pager.setTotoalCnt( userServiceDAO.searchNeedCSUserServiceCnt(usrLoginName, usrName, begDate, endDate, agentId, pager) );
		return userServiceDAO.searchNeedCSUserService(usrLoginName, usrName, begDate, endDate, agentId, pager);
	}
	public boolean checkBalance(String userId,String dealClass){
		processor  = ( IProcessor )ctx.getBean( dealClass );
		return processor.checkBalance(userId);
	}
	public List getOrderService(String [] dealClass){
		return orderServiceDAO.findUserServiceByUser(dealClass);
	}
	
}
