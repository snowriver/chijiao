package com.forbes.service.ask.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.AskAnswer;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.dao.AskAnswerDAO;
import com.forbes.service.ask.AskAnswerManager;
import com.forbes.util.Pager;


public class AskAnswerManagerImpl implements AskAnswerManager {
	
	
	
	private AskAnswerDAO askAnswerDAO;
	
	

	public List getAskAnswerByPage( Pager pager, int pageNo, Integer askId, String orderby ) throws ForbesException{
		try {			
			pager.setTotoalCnt(askAnswerDAO.getCount(askId));
			List list = askAnswerDAO.findAskAnswerByPage(askId, orderby, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	public void answerQuestion(UcMembers user, AskAnswer askAnswer) {
		askAnswerDAO.save(askAnswer);
	}
	
	public void deleteAskAnswer(AskAnswer askAnswer) {
		askAnswerDAO.delete(askAnswer);
	}
	
	public AskAnswer getAskAnswer(Long id) {
		return askAnswerDAO.findById(id);
	}

	public void updateAskAnswer(AskAnswer askAnswer) {
		askAnswerDAO.attachDirty(askAnswer);
	}

	public AskAnswerDAO getAskAnswerDAO() {
		return askAnswerDAO;
	}

	public void setAskAnswerDAO(AskAnswerDAO askAnswerDAO) {
		this.askAnswerDAO = askAnswerDAO;
	}
	
	public List getTopAskAnswerByAsk( Integer askId, String orderby, int begin, int length ) throws ForbesException{
		try {
			List list = askAnswerDAO.findAskAnswerByAsk(askId, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAskAnswerByAsk( Integer askId ) throws ForbesException{
		try {
			List list = askAnswerDAO.findAskAnswerByAsk(askId);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	
	public boolean checkIfAnswer( Integer userId, Integer askId ) throws ForbesException{
		try {
			int list = askAnswerDAO.getCount(userId, askId);
			if( list > 0)
				return true;
			else
				return false;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
	
		}
	}
	
}
