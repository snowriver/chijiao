package com.forbes.struts.action.ask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.service.ask.AskSearchManager;


public class IndexNewAction extends Action {
		
	private AskSearchManager askSearchManager;
	
	public AskSearchManager getAskSearchManager() {
		return askSearchManager;
	}

	public void setAskSearchManager(AskSearchManager askSearchManager) {
		this.askSearchManager = askSearchManager;
	}

	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {

			request.setAttribute( "NOT_SOLVE_ASK_LIST", 
					askSearchManager.getTopAsk(null, "0", "expiredTime desc", 0, 10));
			request.setAttribute( "HEIGHT_REWARDE_ASK_LIST", 
					askSearchManager.getTopAsk(null, "0_1", "reward desc", 0, 10));
			request.setAttribute( "ALREADY_SOLVE_ASK_LIST", 
					askSearchManager.getTopAsk(null, "1", "expiredTime desc", 0, 10));
			
			request.setAttribute( "POP_ASK_LIST", 
					askSearchManager.getTopAsk(null, "0_1", "views desc", 0, 10));
						
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}	
	
}