package com.forbes.service.useraction;

import java.util.List;
import java.util.Map;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserActionLog;
import com.forbes.hibernate.bean.UserActionType;
import com.forbes.hibernate.dao.UserActionLogDAO;
import com.forbes.hibernate.dao.UserActionTypeDAO;


public interface UserActionManager {
	
	/**
	 * 获取用户活動類型
	 * @param id
	 * @return
	 */
	public UserActionType getUserActionType( String id );
	
	/**
	 * 保存用户活動
	 * @param actionLog
	 * @throws ForbesException
	 */
	public void saveUserActionLog( UserActionLog actionLog )throws ForbesException;
   
	public UserActionLogDAO getUserActionLogDAO();
	public void setUserActionLogDAO(UserActionLogDAO userActionLogDAO);
	public UserActionTypeDAO getUserActionTypeDAO();
	public void setUserActionTypeDAO(UserActionTypeDAO userActionTypeDAO);
}
