package com.forbes.struts.action.client;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.UserYearAimPlan;
import com.forbes.service.plan.YearAimPlanManager;
import com.forbes.struts.form.client.ClientUserYearAimPlanForm;

public class ClientManageUserYearAimPlanAction extends DispatchAction {

	private YearAimPlanManager yearAimPlanManager;

	public YearAimPlanManager getYearAimPlanManager() {
		return yearAimPlanManager;
	}

	public void setYearAimPlanManager(YearAimPlanManager yearAimPlanManager) {
		this.yearAimPlanManager = yearAimPlanManager;
	}

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		UcMembers user = (UcMembers) request.getSession()
				.getAttribute("CLIENT");

		String year = request.getParameter("year");
		String quarter = request.getParameter("quarter");

		if (year == null || year.length() == 0) {
			year = new SimpleDateFormat("yyyy").format(new Date());
		}

		if (quarter == null || quarter.length() == 0) {
			int month = new Date().getMonth();
			if (month >= 1 && month <= 3) {
				quarter = "1";
			} else if (month >= 4 && month <= 6) {
				quarter = "2";
			} else if (month >= 7 && month <= 9) {
				quarter = "3";
			} else {
				quarter = "4";
			}
		}

		Map map = new TreeMap();
		map.put("year", year);
		map.put("quarter", quarter);

		try {
			UserYearAimPlan yearAimPlan = yearAimPlanManager.getYearAimPlan(
					user.getUid().toString(), year, quarter);

			request.setAttribute("PARA", map);
			request.setAttribute("USER_YEAR_AIM_PLAN", yearAimPlan);

			return mapping.findForward("list");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ClientUserYearAimPlanForm yearAimPlanForm = (ClientUserYearAimPlanForm) form;

		UcMembers user = (UcMembers) request.getSession()
				.getAttribute("CLIENT");

		String id = request.getParameter("id");

		try {
			if (id != null && id.length() > 0) {
				UserYearAimPlan yearAimPlan = yearAimPlanManager
						.getYearAimPlan(Integer.parseInt(id));
				yearAimPlan.setUserId(user.getUid());
				yearAimPlan.setYear(yearAimPlanForm.getYear());
				yearAimPlan.setQuarter(yearAimPlanForm.getQuarter());

				yearAimPlan.setFirstMonth(yearAimPlanForm.getFirstMonth());
				yearAimPlan.setSecondMonth(yearAimPlanForm.getSecondMonth());
				yearAimPlan.setThirdMonth(yearAimPlanForm.getThirdMonth());

				yearAimPlanManager.updateYearAimPlan(yearAimPlan);
			} else {
				UserYearAimPlan yearAimPlan = new UserYearAimPlan();
				yearAimPlan.setUserId(user.getUid());
				yearAimPlan.setYear(yearAimPlanForm.getYear());
				yearAimPlan.setQuarter(yearAimPlanForm.getQuarter());

				yearAimPlan.setFirstMonth(yearAimPlanForm.getFirstMonth());
				yearAimPlan.setSecondMonth(yearAimPlanForm.getSecondMonth());
				yearAimPlan.setThirdMonth(yearAimPlanForm.getThirdMonth());

				yearAimPlanManager.addYearAimPlan(yearAimPlan);
			}

			request.setAttribute("OK_MESSAGE", "²Ù×÷³É¹¦");
			request.setAttribute("RETURN_URL",
					"ClientManageUserYearAimPlan.do?act=list&year="
							+ yearAimPlanForm.getYear() + "&quarter="
							+ yearAimPlanForm.getQuarter());

			return mapping.findForward("ok");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

}