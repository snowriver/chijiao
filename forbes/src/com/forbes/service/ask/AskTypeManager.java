package com.forbes.service.ask;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.AskType;
import com.forbes.hibernate.dao.AskTypeDAO;
import com.forbes.util.Pager;

public interface AskTypeManager {

	
	public AskTypeDAO getAskTypeDAO();

	public void setAskTypeDAO(AskTypeDAO askTypeDAO);

	public List getTopAskTypeByPage( Pager pager, int pageNo ) throws ForbesException;
	
	public List getTopAskType( ) throws ForbesException;
	
	public List getAllAskType( ) throws ForbesException;

	public void addAskType(AskType askType);
	
	public void deleteAskType(AskType askType);
	
	public AskType getAskType(Integer id);

	public void updateAskType(AskType askType);
	
	public List getAskType() throws ForbesException;
	
	public List getAskTypeByPid(Integer pid) throws ForbesException;
	
}
