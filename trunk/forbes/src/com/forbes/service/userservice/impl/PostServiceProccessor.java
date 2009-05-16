package com.forbes.service.userservice.impl;

import com.she.hibernate.OrdOrderItem;

public class PostServiceProccessor extends DefaultProcessor{
	public void initUsrService(OrdOrderItem orderItem){
		super.initUsrService(orderItem);
		super.changeUserType(orderItem, "A");
	}
}
