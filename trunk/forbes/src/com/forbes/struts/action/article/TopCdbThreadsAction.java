package com.forbes.struts.action.article;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.service.ucenter.UcbbsManager;

public class TopCdbThreadsAction extends Action {

	private UcbbsManager ucbbsManager;

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		List list = ucbbsManager.getCdbThreads("views", 0, 14);
		request.setAttribute("UC_BBS_THREAD_LIST", list);

		return mapping.findForward("ok");
	}

	public UcbbsManager getUcbbsManager() {
		return ucbbsManager;
	}

	public void setUcbbsManager(UcbbsManager ucbbsManager) {
		this.ucbbsManager = ucbbsManager;
	}

}