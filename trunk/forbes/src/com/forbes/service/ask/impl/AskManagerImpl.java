package com.forbes.service.ask.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Ask;
import com.forbes.hibernate.bean.AskAnswer;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.dao.AskDAO;
import com.forbes.hibernate.dao.AskTypeDAO;
import com.forbes.service.ask.AskManager;
import com.forbes.service.ask.AskSearchManager;
import com.forbes.util.Pager;


public class AskManagerImpl implements AskManager {
	

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

	public void askQuestion(UcMembers usr, Ask ask) {
		askDAO.save(ask);
	}
	
	public void deleteAsk(Ask ask) {
		askDAO.delete(ask);
	}
	
	public Ask getAsk(Integer id) {
		return askDAO.findById(id);
	}

	public void updateAsk(Ask ask) {
		askDAO.attachDirty(ask);
	}

	public boolean verifyTitle( String title ){
		List list = askDAO.findByTitle(title);
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}
	
	public boolean verifyTitle( Integer id, String title ){
		Ask a = askDAO.findById(id);
		List list = askDAO.findByTitle(title);
		if ( list.contains(a) ) {
			list.remove(a);
		}
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}
	
	public void setBestAnswer(UcMembers user, Ask ask, AskAnswer askAnswer) {
		askDAO.attachDirty(ask);
	}
}
