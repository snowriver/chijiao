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
import com.forbes.hibernate.bean.UserMonthSumup;
import com.forbes.service.plan.MonthSumupManager;
import com.forbes.struts.form.client.ClientUserMonthSumupForm;


public class ClientManageUserMonthSumupAction extends DispatchAction {
	
	private MonthSumupManager monthSumupManager;	
	
	public MonthSumupManager getMonthSumupManager() {
		return monthSumupManager;
	}

	public void setMonthSumupManager(MonthSumupManager monthSumupManager) {
		this.monthSumupManager = monthSumupManager;
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
			UserMonthSumup monthSumup = monthSumupManager.getMonthSumup(user.getUid().toString(), year, month);

			request.setAttribute("PARA", map);
			request.setAttribute("USER_MONTH_SUMUP", monthSumup);

			return mapping.findForward("list");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

	
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		ClientUserMonthSumupForm monthSumupForm = (ClientUserMonthSumupForm) form;
		
		UcMembers user = (UcMembers) request.getSession().getAttribute("CLIENT");

		String id = request.getParameter("id");		

		try {
			if(id !=null && id.length() >0) {
				UserMonthSumup monthSumup = monthSumupManager.getMonthSumup(Integer.parseInt(id));
				monthSumup.setUserId(user.getUid());
				monthSumup.setYear(new Short(monthSumupForm.getYear()));
				monthSumup.setMonth(new Short(monthSumupForm.getMonth()));
				
				monthSumup.setAim(monthSumupForm.getAim());
				monthSumup.setGain(monthSumupForm.getGain());
				monthSumup.setChallenge(monthSumupForm.getChallenge());
				monthSumup.setImprove(monthSumupForm.getImprove());
				monthSumup.setAnalyse(monthSumupForm.getAnalyse());
				
				monthSumupManager.updateMonthSumup(monthSumup);
			}
			else {
				UserMonthSumup monthSumup = new UserMonthSumup();
				monthSumup.setUserId(user.getUid());
				monthSumup.setYear(new Short(monthSumupForm.getYear()));
				monthSumup.setMonth(new Short(monthSumupForm.getMonth()));

				monthSumup.setAim(monthSumupForm.getAim());
				monthSumup.setGain(monthSumupForm.getGain());
				monthSumup.setChallenge(monthSumupForm.getChallenge());
				monthSumup.setImprove(monthSumupForm.getImprove());
				monthSumup.setAnalyse(monthSumupForm.getAnalyse());
				
				monthSumupManager.addMonthSumup(monthSumup);
			}
			
			request.setAttribute("OK_MESSAGE", "²Ù×÷³É¹¦");
			request.setAttribute("RETURN_URL", 
					"ClientManageUserMonthSumup.do?act=list&year=" + monthSumupForm.getYear() +
					"&month=" + monthSumupForm.getMonth());
			
			return mapping.findForward("ok");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

}