/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
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
import com.forbes.hibernate.bean.UserWeekAimExam;
import com.forbes.service.plan.WeekAimExamManager;
import com.forbes.struts.form.client.ClientUserWeekAimExamForm;



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
public class ClientManageUserWeekAimExamAction extends DispatchAction {
	
	private WeekAimExamManager weekAimExamManager;	
	
	public WeekAimExamManager getWeekAimExamManager() {
		return weekAimExamManager;
	}

	public void setWeekAimExamManager(WeekAimExamManager weekAimExamManager) {
		this.weekAimExamManager = weekAimExamManager;
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
			UserWeekAimExam weekAttitude = weekAimExamManager.getWeekAimExam(user.getUid().toString(), date);

			request.setAttribute("PARA", map);
			request.setAttribute("USER_WEEK_AIM_EXAM", weekAttitude);

			return mapping.findForward("list");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

	
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		ClientUserWeekAimExamForm weekAimExamForm = (ClientUserWeekAimExamForm) form;
		
		UcMembers user = (UcMembers) request.getSession()
				.getAttribute("CLIENT");

		String id = request.getParameter("id");
		String date = request.getParameter("date");
				
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");

		try {
			if(id !=null && id.length() >0) {
				UserWeekAimExam weekAimExam = weekAimExamManager.getWeekAimExam(Integer.parseInt(id));
				weekAimExam.setUserId(user.getUid());
				weekAimExam.setDate(dateFormatter.parse(date));
				
				weekAimExam.setCareerDone(weekAimExamForm.getCareerDone());
				weekAimExam.setCareerNext(weekAimExamForm.getCareerNext());
				weekAimExam.setFamilyDone(weekAimExamForm.getFamilyDone());
				weekAimExam.setFamilyNext(weekAimExamForm.getFamilyNext());
				weekAimExam.setContactDone(weekAimExamForm.getContactDone());
				weekAimExam.setContactNext(weekAimExamForm.getContactNext());
				weekAimExam.setFinanceDone(weekAimExamForm.getFamilyDone());
				weekAimExam.setFinanceNext(weekAimExamForm.getFinanceNext());
				weekAimExam.setSpiritDone(weekAimExamForm.getSpiritDone());
				weekAimExam.setSpiritNext(weekAimExamForm.getSpiritNext());
				weekAimExam.setHealthDone(weekAimExamForm.getHealthDone());
				weekAimExam.setHealthNext(weekAimExamForm.getHealthNext());
				weekAimExam.setOtherDone(weekAimExamForm.getOtherDone());
				weekAimExam.setOtherNext(weekAimExamForm.getOtherNext());				
				
				weekAimExamManager.updateWeekAimExam(weekAimExam);
			}
			else {
				UserWeekAimExam weekAimExam = new UserWeekAimExam();
				weekAimExam.setUserId(user.getUid());
				weekAimExam.setDate(dateFormatter.parse(date));

				weekAimExam.setCareerDone(weekAimExamForm.getCareerDone());
				weekAimExam.setCareerNext(weekAimExamForm.getCareerNext());
				weekAimExam.setFamilyDone(weekAimExamForm.getFamilyDone());
				weekAimExam.setFamilyNext(weekAimExamForm.getFamilyNext());
				weekAimExam.setContactDone(weekAimExamForm.getContactDone());
				weekAimExam.setContactNext(weekAimExamForm.getContactNext());
				weekAimExam.setFinanceDone(weekAimExamForm.getFamilyDone());
				weekAimExam.setFinanceNext(weekAimExamForm.getFinanceNext());
				weekAimExam.setSpiritDone(weekAimExamForm.getSpiritDone());
				weekAimExam.setSpiritNext(weekAimExamForm.getSpiritNext());
				weekAimExam.setHealthDone(weekAimExamForm.getHealthDone());
				weekAimExam.setHealthNext(weekAimExamForm.getHealthNext());
				weekAimExam.setOtherDone(weekAimExamForm.getOtherDone());
				weekAimExam.setOtherNext(weekAimExamForm.getOtherNext());
				
				weekAimExamManager.addWeekAimExam(weekAimExam);
			}
			
			request.setAttribute("OK_MESSAGE", "�����ɹ�");
			request.setAttribute("RETURN_URL", "ClientManageUserWeekAimExam.do?act=list&date=" + date);
			
			return mapping.findForward("ok");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

}