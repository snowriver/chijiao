package com.forbes.struts.action.client;

import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.UserLifeStageAim;
import com.forbes.service.plan.LifeStageAimManager;
import com.forbes.struts.form.client.ClientUserLifeStageAimForm;

public class ClientManageUserLifeStageAimAction extends DispatchAction {

	private LifeStageAimManager lifeStageAimManager;

	public LifeStageAimManager getLifeStageAimManager() {
		return lifeStageAimManager;
	}

	public void setLifeStageAimManager(LifeStageAimManager lifeStageAimManager) {
		this.lifeStageAimManager = lifeStageAimManager;
	}

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		UcMembers user = (UcMembers) request.getSession()
				.getAttribute("CLIENT");

		String years = request.getParameter("years");

		if (years == null || years.length() == 0) {
			years = "3";
		}

		Map map = new TreeMap();
		map.put("years", years);

		try {
			UserLifeStageAim lifeStageAim = lifeStageAimManager
					.getLifeStageAim(user.getUid().toString(), years);

			request.setAttribute("USER_LIFE_STAGE_AIM", lifeStageAim);
			request.setAttribute("PARA", map);
			return mapping.findForward("list");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ClientUserLifeStageAimForm lifeStageAimForm = (ClientUserLifeStageAimForm) form;

		UcMembers user = (UcMembers) request.getSession()
				.getAttribute("CLIENT");

		String id = request.getParameter("id");

		try {
			if (id != null && id.length() > 0) {
				UserLifeStageAim lifeStageAim = lifeStageAimManager
						.getLifeStageAim(Integer.parseInt(id));
				lifeStageAim.setUserId(user.getUid());

				lifeStageAim.setYears(lifeStageAimForm.getYears());
				lifeStageAim.setAim(lifeStageAimForm.getAim());
			

				lifeStageAimManager.updateLifeStageAim(lifeStageAim);
			} else {
				UserLifeStageAim lifeStageAim = new UserLifeStageAim();
				lifeStageAim.setUserId(user.getUid());

				lifeStageAim.setYears(lifeStageAimForm.getYears());
				lifeStageAim.setAim(lifeStageAimForm.getAim());

				lifeStageAimManager.addLifeStageAim(lifeStageAim);
			}

			request.setAttribute("OK_MESSAGE", "²Ù×÷³É¹¦");
			request.setAttribute("RETURN_URL",
					"ClientManageUserLifeStageAim.do?act=list&years=" + lifeStageAimForm.getYears());

			return mapping.findForward("ok");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

}