package com.forbes.service.userservice.impl;

import java.text.SimpleDateFormat;
import java.util.*;
import com.she.hibernate.*;



public class SecServiceForBuyerProccessor extends DefaultProcessor{
	public void initUsrService(OrdOrderItem orderItem){
		super.initUsrService(orderItem);
		super.changeUserType(orderItem, "A");
	}
}
