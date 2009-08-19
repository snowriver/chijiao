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
import com.forbes.hibernate.bean.UserMonthAimPlan;
import com.forbes.service.plan.MonthAimPlanManager;
import com.forbes.struts.form.client.ClientUserMonthAimPlanForm;


public class ClientManageUserMonthAimPlanAction extends DispatchAction {
	
	private MonthAimPlanManager monthAimPlanManager;	
	
	public MonthAimPlanManager getMonthAimPlanManager() {
		return monthAimPlanManager;
	}

	public void setMonthAimPlanManager(MonthAimPlanManager monthAimPlanManager) {
		this.monthAimPlanManager = monthAimPlanManager;
	}

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		UcMembers user = (UcMembers) request.getSession().getAttribute("CLIENT");
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");

		if(year == null || year.length() == 0) {		
			year = new SimpleDateFormat("yyyy").format(new Date());
		}
		
		if(month == null || month.length() == 0) {			
			month = String.valueOf(new Date().getMonth() + 1);
		}	
		
		Map map = new TreeMap();
		map.put("year", year);
		map.put("month", month);

		try {
			UserMonthAimPlan monthAimPlan = monthAimPlanManager.getMonthAimPlan(user.getUid().toString(), year, month);

			request.setAttribute("PARA", map);
			request.setAttribute("USER_MONTH_AIM_PLAN", monthAimPlan);

			return mapping.findForward("list");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

	
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		ClientUserMonthAimPlanForm monthAimPlanForm = (ClientUserMonthAimPlanForm) form;
		
		UcMembers user = (UcMembers) request.getSession().getAttribute("CLIENT");

		String id = request.getParameter("id");		

		try {
			if(id !=null && id.length() >0) {
				UserMonthAimPlan monthAimPlan = monthAimPlanManager.getMonthAimPlan(Integer.parseInt(id));
				monthAimPlan.setUserId(user.getUid());
				monthAimPlan.setYear(new Short(monthAimPlanForm.getYear()));
				monthAimPlan.setMonth(new Short(monthAimPlanForm.getMonth()));
				
				monthAimPlan.setCareerAim(monthAimPlanForm.getCareerAim());
				monthAimPlan.setCareerPlan(monthAimPlanForm.getCareerPlan());
				monthAimPlan.setFamilyAim(monthAimPlanForm.getFamilyAim());
				monthAimPlan.setFamilyPlan(monthAimPlanForm.getFamilyPlan());
				monthAimPlan.setContactAim(monthAimPlanForm.getContactAim());
				monthAimPlan.setContactPlan(monthAimPlanForm.getContactPlan());
				monthAimPlan.setFinanceAim(monthAimPlanForm.getFamilyAim());
				monthAimPlan.setFinancePlan(monthAimPlanForm.getFinancePlan());
				monthAimPlan.setSpiritAim(monthAimPlanForm.getSpiritAim());
				monthAimPlan.setSpiritPlan(monthAimPlanForm.getSpiritPlan());
				monthAimPlan.setHealthAim(monthAimPlanForm.getHealthAim());
				monthAimPlan.setHealthPlan(monthAimPlanForm.getHealthPlan());
				monthAimPlan.setOtherAim(monthAimPlanForm.getOtherAim());
				monthAimPlan.setOtherPlan(monthAimPlanForm.getOtherPlan());
				
				monthAimPlanManager.updateMonthAimPlan(monthAimPlan);
			}
			else {
				UserMonthAimPlan monthAimPlan = new UserMonthAimPlan();
				monthAimPlan.setUserId(user.getUid());
				monthAimPlan.setYear(new Short(monthAimPlanForm.getYear()));
				monthAimPlan.setMonth(new Short(monthAimPlanForm.getMonth()));

				monthAimPlan.setCareerAim(monthAimPlanForm.getCareerAim());
				monthAimPlan.setCareerPlan(monthAimPlanForm.getCareerPlan());
				monthAimPlan.setFamilyAim(monthAimPlanForm.getFamilyAim());
				monthAimPlan.setFamilyPlan(monthAimPlanForm.getFamilyPlan());
				monthAimPlan.setContactAim(monthAimPlanForm.getContactAim());
				monthAimPlan.setContactPlan(monthAimPlanForm.getContactPlan());
				monthAimPlan.setFinanceAim(monthAimPlanForm.getFamilyAim());
				monthAimPlan.setFinancePlan(monthAimPlanForm.getFinancePlan());
				monthAimPlan.setSpiritAim(monthAimPlanForm.getSpiritAim());
				monthAimPlan.setSpiritPlan(monthAimPlanForm.getSpiritPlan());
				monthAimPlan.setHealthAim(monthAimPlanForm.getHealthAim());
				monthAimPlan.setHealthPlan(monthAimPlanForm.getHealthPlan());
				monthAimPlan.setOtherAim(monthAimPlanForm.getOtherAim());
				monthAimPlan.setOtherPlan(monthAimPlanForm.getOtherPlan());
				
				monthAimPlanManager.addMonthAimPlan(monthAimPlan);
			}
			
			request.setAttribute("OK_MESSAGE", "²Ù×÷³É¹¦");
			request.setAttribute("RETURN_URL", 
					"ClientManageUserMonthAimPlan.do?act=list&year=" + monthAimPlanForm.getYear() +
					"&month=" + monthAimPlanForm.getMonth());
			
			return mapping.findForward("ok");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

}