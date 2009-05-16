package com.forbes.service.userservice.impl;

import com.forbes.hibernate.bean.UserOrderItem;
import com.forbes.hibernate.bean.UserService;


public interface IProcessor {
	public void initUsrService(UserOrderItem orderItem);
	public void process(UserService userService);
	public void process(String userId);
	public boolean auth(String userId,String param);
	public String processArgs(Object [] args );
	public boolean checkBalance(String userId);
}
