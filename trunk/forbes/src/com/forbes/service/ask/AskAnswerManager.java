package com.forbes.service.ask;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.AskAnswer;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.dao.AskAnswerDAO;
import com.forbes.util.Pager;

public interface AskAnswerManager {
	

	public List getAskAnswerByPage( Pager pager, int pageNo, Integer askId, String orderby ) throws ForbesException;
	

	public void answerQuestion(UcMembers user, AskAnswer askAnswer);
	
	public void deleteAskAnswer(AskAnswer askAnswer);
	
	public AskAnswer getAskAnswer(Long id);

	public void updateAskAnswer(AskAnswer askAnswer);

	public AskAnswerDAO getAskAnswerDAO();

	public void setAskAnswerDAO(AskAnswerDAO askAnswerDAO);
	
	public List getTopAskAnswerByAsk( Integer askId, String orderby, int begin, int length ) throws ForbesException;
	
	public List getAskAnswerByAsk( Integer askId ) throws ForbesException;
	
	public boolean checkIfAnswer( Integer userId, Integer askId ) throws ForbesException;
}
