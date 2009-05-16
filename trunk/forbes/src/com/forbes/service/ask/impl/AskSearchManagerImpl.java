package com.forbes.service.ask.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Ask;
import com.forbes.hibernate.dao.AskDAO;
import com.forbes.hibernate.dao.AskTypeDAO;
import com.forbes.service.ask.AskSearchManager;
import com.forbes.util.Pager;


public class AskSearchManagerImpl implements AskSearchManager {
	

	private AskDAO askDAO;
	//public AskTypeDAO askTypeDAO;

	public AskDAO getAskDAO() {
		return askDAO;
	}

	public void setAskDAO(AskDAO askDAO) {
		this.askDAO = askDAO;
	}

	/*public AskTypeDAO getAskTypeDAO() {
		return askTypeDAO;
	}

	public void setAskTypeDAO(AskTypeDAO askTypeDAO) {
		this.askTypeDAO = askTypeDAO;
	}*/


	public List getAskByPage(Pager pager, int pageNo, String userid, String typeid, String status, String keyword, String orderby ) throws ForbesException{
		if( status != null ){
			status = status.replaceAll("_", ",");
		}
		try {			
			pager.setTotoalCnt(askDAO.getCount( userid, typeid, status, keyword));
			List list = askDAO.findAskByPage( userid, typeid, status, keyword, orderby, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAskByAnswerAndPage(Pager pager, int pageNo, String userid, String orderby ) throws ForbesException{
		try {			
			pager.setTotoalCnt(askDAO.getCountByAnswer( userid ) );
			List list = askDAO.findAskByAnswerAndPage(userid, orderby, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public List getTopAsk(String typeid, String status, String orderby, int begin, int length ) throws ForbesException{
		if( status != null ){
			status = status.replaceAll("_", ",");
		}
		try {
			List list = askDAO.findTopAsk(typeid, status, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public Ask getAsk(Integer id) {
		return askDAO.findById(id);
	}
	
	
}
