package com.forbes.service.useraction;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserActionLog;
import com.forbes.hibernate.bean.UserActionType;


public abstract class AbstractAction implements IUesrAction{
	private static ApplicationContext ctx = null;
	private static UserActionManager actionManager = null;
	static {
		ctx = new ClassPathXmlApplicationContext("com/forbes/spring/applicationContext.xml");  
		actionManager  = ( UserActionManager )ctx.getBean("userActionManager");
		
	}

	public UserActionType getUserActionType(String id){
		return actionManager.getUserActionType(id);
	}
	public void saveUserActionLog( UserActionLog actionLog ){
		try {
			actionManager.saveUserActionLog( actionLog );
		} catch (ForbesException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*public AnalysisItems getAnalysisItems( String id ){
		return actionManager.getAnalysisItem( id );
	}
	public void saveAnalysis( AnalysisUsrAnalysis analysis ){
		
		try {
			actionManager.saveAnalysis( analysis );
		} catch (ForbesException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void saveUsrMark( AnalysisUsrMark mark ){
		try {
			actionManager.saveUsrMark(mark);
		} catch (ForbesException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
}
