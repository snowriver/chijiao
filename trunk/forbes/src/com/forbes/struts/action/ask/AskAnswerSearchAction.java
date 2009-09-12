package com.forbes.struts.action.ask;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.service.ask.AskAnswerManager;

public class AskAnswerSearchAction extends DispatchAction {
	
	private AskAnswerManager askAnswerManager;
	
	public ActionForward top(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");

		try {

			List list = askAnswerManager.getTopAskAnswerByAsk(Integer
					.parseInt(id), null, 0, 20);
			request.setAttribute("ASK_ANSWER_LIST", list);
			return mapping.findForward("top");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}

	public AskAnswerManager getAskAnswerManager() {
		return askAnswerManager;
	}

	public void setAskAnswerManager(AskAnswerManager askAnswerManager) {
		this.askAnswerManager = askAnswerManager;
	}

}