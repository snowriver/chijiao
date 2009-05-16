package com.forbes.service.useraction.impl;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserActionLog;
import com.forbes.hibernate.bean.UserActionType;
import com.forbes.hibernate.dao.UserActionLogDAO;
import com.forbes.hibernate.dao.UserActionTypeDAO;
import com.forbes.service.useraction.UserActionManager;
import com.forbes.util.Pager;


public class UserActionManagerImpl implements UserActionManager{

	private UserActionTypeDAO   userActionTypeDAO;
	private UserActionLogDAO    userActionLogDAO;

	public UserActionManagerImpl (){
		
	}
	
	/**
	 * 获取用户活動類型
	 * @param id
	 * @return
	 */
	public UserActionType getUserActionType( String id ){
		return userActionTypeDAO.findById( new Short(id) );
	}
	
	/**
	 * 保存用户活動
	 * @param actionLog
	 * @throws ForbesException
	 */
	public void saveUserActionLog( UserActionLog actionLog )throws ForbesException{
		try{
			userActionLogDAO.save(actionLog);
		}catch(Exception e){
			throw new ForbesException("Save error");
		}
	}
   
	public UserActionLogDAO getUserActionLogDAO() {
		return userActionLogDAO;
	}
	public void setUserActionLogDAO(UserActionLogDAO userActionLogDAO) {
		this.userActionLogDAO = userActionLogDAO;
	}
	public UserActionTypeDAO getUserActionTypeDAO() {
		return userActionTypeDAO;
	}
	public void setUserActionTypeDAO(UserActionTypeDAO userActionTypeDAO) {
		this.userActionTypeDAO = userActionTypeDAO;
	}
	

	/**
	 * 查询动作信息
	 */
	/*public List<Object[]> getUserActionLog(Pager pager, String userId, String loginName, String actionType,
			String btime, String etime) {
		pager.setTotoalCnt(userActionLogDAO.findUsrLogCnt(userId, loginName, actionType, btime, etime));
    	return userActionLogDAO.findUsrLogByPage(userId, loginName, actionType, btime, etime, (pager.getCurPage() - 1)* pager.getCntOfPage(), pager.getCntOfPage() );
	}
	
	public List<Object[]> getUserActionLog(String actionType, Integer count, 
			String btime, String etime) {
		
		//System.out.println( "count count = " + userActionLogDAO.getUsrCntByCntAndPage(actionType, count, btime, etime) );
		//pager.setTotoalCnt(userActionLogDAO.getUsrCntByCntAndPage(actionType, count, btime, etime));
    	return userActionLogDAO.findUsrByCntAndPage(actionType, count, btime, etime ); //, (pager.getCurPage() - 1)* pager.getCntOfPage(), pager.getCntOfPage() );
	}*/

}
