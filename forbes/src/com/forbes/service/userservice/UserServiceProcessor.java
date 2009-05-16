package com.forbes.service.userservice;

import java.util.List;

import com.forbes.hibernate.bean.UserOrderItem;
import com.forbes.hibernate.bean.UserService;
import com.forbes.util.Pager;


public interface UserServiceProcessor {
	public void initUserService(UserOrderItem orderItem);
	public void process(UserService userService);
	public void process(String userId,String dealClass);
	public boolean checkBalance(String userId,String dealClass);
	public List getUserService(String userId);
	public List getOrderService(String [] dealClass);
	public boolean auth(String userId,String dealClass,String param);
	public List getNeedCSUserService(Pager pager);
	public List searchNeedCSUserService( String usrLoginName,String usrName,String begDate,String endDate,String agentId,Pager pager);
}
