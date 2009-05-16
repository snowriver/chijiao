package com.forbes.service.ask.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.AskType;
import com.forbes.hibernate.dao.AskTypeDAO;
import com.forbes.service.ask.AskTypeManager;
import com.forbes.util.Pager;


public class AskTypeManagerImpl implements AskTypeManager {
	
	
	
	private AskTypeDAO askTypeDAO;
	
	public AskTypeDAO getAskTypeDAO() {
		return askTypeDAO;
	}

	public void setAskTypeDAO(AskTypeDAO askTypeDAO) {
		this.askTypeDAO = askTypeDAO;
	}

	public List getTopAskTypeByPage( Pager pager, int pageNo ) throws ForbesException{
		try {			
			pager.setTotoalCnt(askTypeDAO.getCount("0"));
			List list = askTypeDAO.findAskTypeByPage("0", (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getTopAskType( ) throws ForbesException{
		try {
			List list = askTypeDAO.findByProperty("pid", 0);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAllAskType( ) throws ForbesException{
		try {
			List list = askTypeDAO.findAll();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	public void addAskType(AskType askType) {
		askTypeDAO.save(askType);
	}
	
	public void deleteAskType(AskType askType) {
		askTypeDAO.delete(askType);
	}
	
	public AskType getAskType(Integer id) {
		return askTypeDAO.findById(id);
	}

	public void updateAskType(AskType askType) {
		askTypeDAO.attachDirty(askType);
	}

	
	public List getAskType() throws ForbesException{
		try {
			List list = askTypeDAO.findAll();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAskTypeByPid(Integer pid) throws ForbesException{
		try {
			List list = askTypeDAO.findByPid( pid );
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	
}
