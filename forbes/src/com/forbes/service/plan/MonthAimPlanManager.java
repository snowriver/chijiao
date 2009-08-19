package com.forbes.service.plan;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserMonthAimPlan;
import com.forbes.hibernate.dao.UserMonthAimPlanDAO;

public interface MonthAimPlanManager {

	public UserMonthAimPlanDAO getUserMonthAimPlanDAO();

	public void setUserMonthAimPlanDAO(UserMonthAimPlanDAO userMonthAimPlanDAO);

	public UserMonthAimPlan getMonthAimPlan(String userid, String year,
			String month) throws ForbesException;

	public int getMonthAimPlanCount(String userid, String year, String month)
			throws ForbesException;

	public void addMonthAimPlan(UserMonthAimPlan userMonthAimPlan);

	public void deleteMonthAimPlan(UserMonthAimPlan userMonthAimPlan);

	public UserMonthAimPlan getMonthAimPlan(Integer id);

	public void updateMonthAimPlan(UserMonthAimPlan userMonthAimPlan);
}
