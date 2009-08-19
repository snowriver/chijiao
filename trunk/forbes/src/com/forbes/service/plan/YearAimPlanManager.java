package com.forbes.service.plan;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserYearAimPlan;
import com.forbes.hibernate.dao.UserYearAimPlanDAO;

public interface YearAimPlanManager {

	public UserYearAimPlanDAO getUserYearAimPlanDAO();

	public void setUserYearAimPlanDAO(UserYearAimPlanDAO userYearAimPlanDAO);

	public UserYearAimPlan getYearAimPlan(String userid, String year,
			String quarter) throws ForbesException;

	public int getYearAimPlanCount(String userid, String year, String quarter)
			throws ForbesException;

	public void addYearAimPlan(UserYearAimPlan userYearAimPlan);

	public void deleteYearAimPlan(UserYearAimPlan userYearAimPlan);

	public UserYearAimPlan getYearAimPlan(Integer id);

	public void updateYearAimPlan(UserYearAimPlan userYearAimPlan);
}
