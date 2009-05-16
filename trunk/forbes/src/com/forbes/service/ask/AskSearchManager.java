package com.forbes.service.ask;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Ask;
import com.forbes.hibernate.dao.AskDAO;
import com.forbes.util.Pager;

public interface AskSearchManager {
	
	public AskDAO getAskDAO();

	public void setAskDAO(AskDAO askDAO);

	public List getAskByPage(Pager pager, int pageNo, String userid, String typeid, String status, 
			String keyword, String orderby ) throws ForbesException;

	public List getAskByAnswerAndPage(Pager pager, int pageNo, String userid, String orderby ) throws ForbesException;
	
	public List getTopAsk(String typeid, String status, String orderby, int begin, int length ) throws ForbesException;
	
	public Ask getAsk(Integer id);
}
