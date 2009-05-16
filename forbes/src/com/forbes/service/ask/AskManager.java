package com.forbes.service.ask;

import java.util.List;

import com.forbes.hibernate.bean.Ask;
import com.forbes.hibernate.bean.AskAnswer;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.dao.AskDAO;

public interface AskManager {
	
	public AskDAO getAskDAO();
	
	public void setAskDAO(AskDAO askDAO);

	public void askQuestion(UcMembers usr, Ask ask);
	
	public void deleteAsk(Ask ask);
	
	public Ask getAsk(Integer id);

	public void updateAsk(Ask ask);

	public boolean verifyTitle( String title );
	
	public boolean verifyTitle( Integer id, String title );
	
	public void setBestAnswer(UcMembers user, Ask ask, AskAnswer askAnswer);
}
