/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.client;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.hibernate.bean.Article;
import com.forbes.hibernate.bean.Content;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.UserDailyPlan;
import com.forbes.hibernate.bean.UserDailySumup;
import com.forbes.service.plan.DailyPlanManager;
import com.forbes.service.plan.DailySumupManager;
import com.forbes.util.Pager;
import com.forbes.util.UrlTool;

/**
 * MyEclipse Struts Creation date: 07-09-2007
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/client/ClientLogin" name="clientLoginForm"
 *                attribute="ClientLoginForm" input="/client/ClientLogin.jsp"
 *                scope="request" validate="true"
 * @struts.action-forward name="success" path="/client/ClientLoginOk.jsp"
 * @struts.action-forward name="fail" path="/client/ClientLoginFail.jsp"
 */
public class ClientManageUserDailySumupAction extends DispatchAction {
	/* #com.she.web.form.client.ClientLoginForm Dependency20 */
	/*
	 * Generated Methods
	 */

	private DailySumupManager dailySumupManager;


	public DailySumupManager getDailySumupManager() {
		return dailySumupManager;
	}


	public void setDailySumupManager(DailySumupManager dailySumupManager) {
		this.dailySumupManager = dailySumupManager;
	}
	
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		UcMembers user = (UcMembers) request.getSession()
				.getAttribute("CLIENT");
		
		String date = request.getParameter("date");

		if(date == null || date.length() == 0) {
			//SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());			
		}
		request.setAttribute("DATE", new SimpleDateFormat("yyyy-MM-dd E").format( new SimpleDateFormat("yyyy-MM-dd").parse(date) ));

		Map map = new TreeMap();
		map.put("date", date);


		try {
			UserDailySumup sumup = dailySumupManager.getDailySumup(user.getUid().toString(), date);

			request.setAttribute("PARA", map);
			request.setAttribute("USER_DAILY_SUMUP", sumup);

			return mapping.findForward("list");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		UcMembers user = (UcMembers) request.getSession()
				.getAttribute("CLIENT");

		String id = request.getParameter("id");
		String date = request.getParameter("date");
		String advance = request.getParameter("advance");
		String meditate = request.getParameter("meditate");
				
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");

		try {
			if(id !=null && id.length() >0) {
				UserDailySumup sumup = dailySumupManager.getDailySumup(Integer.parseInt(id));
				sumup.setUserId(user.getUid());
				sumup.setDate(dateFormatter.parse(date));
				sumup.setAdvance(advance);
				sumup.setMeditate(meditate);
				sumup.setSn(0);				
				dailySumupManager.updateDailySumup(sumup);
			}
			else {
				UserDailySumup sumup = new UserDailySumup();
				sumup.setUserId(user.getUid());
				sumup.setDate(dateFormatter.parse(date));
				sumup.setAdvance(advance);
				sumup.setMeditate(meditate);
				sumup.setSn(0);
				dailySumupManager.addDailySumup(sumup);
			}
			
			request.setAttribute("OK_MESSAGE", "�����ɹ�");
			request.setAttribute("RETURN_URL", "ClientManageUserDailySumup.do?act=list&date=" + date);
			
			return mapping.findForward("ok");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

	/*
	
	public ActionForward edit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		String limitTime = request.getParameter("limit_time");
		String startTimeHh = request.getParameter("start_time_hh");
		String startTimeMm = request.getParameter("start_time_mm");
		
		String endTimeHh = request.getParameter("end_time_hh");
		String endTimeMm = request.getParameter("end_time_mm");
		
		String content = request.getParameter("content");
		String isComplete = request.getParameter("is_complete");
		
		
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat fullFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		try {
			UserDailyPlan plan = dailyPlanManager.getDailyPlan(Integer.parseInt(id));
			plan.setDate(dateFormatter.parse(date));
			plan.setTitle(title);
			plan.setContent(content);
			plan.setStartTime(timeFormatter.parse(startTimeHh +":" + startTimeMm +":00"));
			plan.setEndTime(timeFormatter.parse(endTimeHh +":" + endTimeMm +":00"));
			if(limitTime !=null && limitTime.length() >0) {
				plan.setLimitTime(fullFormatter.parse(limitTime));
			}
			else {
				plan.setLimitTime(null);				
			}
			plan.setIsComplete(new Short(isComplete));
			plan.setSn(0);
			
			dailyPlanManager.updateDailyPlan(plan);
			
			//request.setAttribute("RETURN_URL", "ClientManageUserDailyPlan.do?act=edit&id="+id);
			
			return mapping.findForward("return");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward complete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = request.getParameter("id");
		String isComplete = request.getParameter("is_complete");

		try {
			UserDailyPlan plan = dailyPlanManager.getDailyPlan(Integer.parseInt(id));
			plan.setIsComplete(new Short(isComplete));
			
			dailyPlanManager.updateDailyPlan(plan);
			request.setAttribute("RESULT_MESSAGE", "OK");
			
			return mapping.findForward("ok");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("RESULT_MESSAGE", "FAIL");
			return mapping.findForward("ok");
			
		}
	}

	public DailyPlanManager getDailyPlanManager() {
		return dailyPlanManager;
	}

	public void setDailyPlanManager(DailyPlanManager dailyPlanManager) {
		this.dailyPlanManager = dailyPlanManager;
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//String returnUrl = request.getParameter("returnUrl");
		String planID     = request.getParameter("planID");
		String id = ""; //`
		System.out.println(planID);
		String planIDs [] = planID.split("`");
		try {
			for(int i=0; i<planIDs.length; i++) {
				id = planIDs[i];
				System.out.println(id);
				UserDailyPlan plan = dailyPlanManager.getDailyPlan(Integer.parseInt(id));
				dailyPlanManager.deleteDailyPlan(plan);
			}
			request.setAttribute("RESULT_MESSAGE", "OK");
			return mapping.findForward("ok");
		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("RESULT_MESSAGE", "FAIL");
			return mapping.findForward("ok");
		}
	}
	
	public ActionForward get(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//String returnUrl = request.getParameter("returnUrl");
		String id = request.getParameter("id");

		try {
			UserDailyPlan plan = dailyPlanManager.getDailyPlan(Integer.parseInt(id));
			request.setAttribute("USER_DETAILY_PLAN", plan);
			return mapping.findForward("get");
		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("RESULT_MESSAGE", "FAIL");
			return mapping.findForward("ok");
		}
	}*/
}