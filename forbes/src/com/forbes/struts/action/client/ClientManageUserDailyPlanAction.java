/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.client;

import java.text.ParseException;
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
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.UserDailyPlan;
import com.forbes.service.plan.DailyPlanManager;
import com.forbes.util.Pager;

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
public class ClientManageUserDailyPlanAction extends DispatchAction {
	/* #com.she.web.form.client.ClientLoginForm Dependency20 */
	/*
	 * Generated Methods
	 */

	private DailyPlanManager dailyPlanManager;

	/**
	 * �ͻ����
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 * @throws Exception 
	 */
	/*
	 * public ActionForward add(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * String id = request.getParameter("id");
	 * 
	 * UcMembers user = (UcMembers)request.getSession().getAttribute("CLIENT");
	 * 
	 * try{ FavoriteType favoriteType = favoriteManager.getFavoriteType(new
	 * Short("2"));
	 * 
	 * if(favoriteManager.checkFavorite(favoriteType, id)) { Favorite favorite =
	 * new Favorite(); favorite.setFavoriteType(favoriteType);
	 * favorite.setUserId(user.getUid());
	 * favorite.setObjectId(Integer.parseInt(id));
	 * 
	 * favoriteManager.addFavorite(favorite);
	 * request.setAttribute("RESULT_MESSAGE", "���ӳɹ���"); } else {
	 * request.setAttribute("RESULT_MESSAGE", "���ղص���Ѷ�Ѿ����ڣ�"); }
	 * 
	 * 
	 * return mapping.findForward("add"); }catch( Exception e ){
	 * e.printStackTrace(); return mapping.findForward("fail"); } }
	 */

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		UcMembers user = (UcMembers) request.getSession()
				.getAttribute("CLIENT");

		String pageNo = request.getParameter("pno");
		String keyword = request.getParameter("keyword");
		String iscomplete = request.getParameter("iscomplete");
		String date = request.getParameter("date");
		String orderby = request.getParameter("orderby");

		
		if(date == null || date.length() == 0) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			date = formatter.format(new Date());
		}

		// System.out.println("----------favType:" + favType);

		String parameter = "keyword=" + ((keyword == null) ? " " : keyword)
				+ "iscomplete=" + ((iscomplete == null) ? " " : iscomplete)
				+ "date=" + ((date == null) ? " " : date)
				+ "orderby=" + ((orderby == null) ? " " : orderby);

		Map map = new TreeMap();
		map.put("keyword", keyword);
		map.put("iscomplete", iscomplete);
		map.put("date", date);
		map.put("orderby", orderby);

		int iPageNo = 1;
		try {
			iPageNo = Integer.parseInt(pageNo);
		} catch (Exception e) {

		}

		try {
			Pager pager = new Pager();
			pager.setCntOfPage(10);
			pager.setCurPage(iPageNo);

			List plans = dailyPlanManager.getDailyPlanByPage(pager, iPageNo,
					user.getUid().toString(), date, iscomplete, keyword,
					orderby);

			request.setAttribute("PARA", map);
			request.setAttribute("USER_PLAN_LIST", plans);
			request.setAttribute("PAGER", pager);

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

		String title = request.getParameter("title");
		String date = request.getParameter("date");
		String limitTime = request.getParameter("limit_time");
		String startTime = request.getParameter("start_time");
		String endTime = request.getParameter("end_time");
		String content = request.getParameter("content");

		
		
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat fullFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		try {
			UserDailyPlan plan = new UserDailyPlan();
			plan.setUserId(user.getUid());
			plan.setDate(dateFormatter.parse(date));
			plan.setTitle(title);
			plan.setContent(content);
			plan.setStartTime(timeFormatter.parse(startTime+":00"));
			plan.setEndTime(timeFormatter.parse(endTime+":00"));
			plan.setLimitTime(fullFormatter.parse(limitTime));
			
			dailyPlanManager.addDailyPlan(plan);

			return mapping.findForward("list");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("fail");
		}
	}

	public DailyPlanManager getDailyPlanManager() {
		return dailyPlanManager;
	}

	public void setDailyPlanManager(DailyPlanManager dailyPlanManager) {
		this.dailyPlanManager = dailyPlanManager;
	}

}