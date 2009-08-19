package com.forbes.service.plan.impl;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserYearAimPlan;
import com.forbes.hibernate.dao.UserYearAimPlanDAO;
import com.forbes.service.plan.YearAimPlanManager;

public class YearAimPlanManagerImpl implements YearAimPlanManager {

	private UserYearAimPlanDAO userYearAimPlanDAO;

	public UserYearAimPlanDAO getUserYearAimPlanDAO() {
		return userYearAimPlanDAO;
	}

	public void setUserYearAimPlanDAO(UserYearAimPlanDAO userYearAimPlanDAO) {
		this.userYearAimPlanDAO = userYearAimPlanDAO;
	}

	public UserYearAimPlan getYearAimPlan(String userid, String year,
			String quarter) throws ForbesException {
		try {
			List list = userYearAimPlanDAO.findYearAimPlan(userid, year,
					quarter);
			if (list.size() > 0) {
				return (UserYearAimPlan) list.get(0);
			} else {
				return null;
			}
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public int getYearAimPlanCount(String userid, String year, String quarter)
			throws ForbesException {
		try {
			return userYearAimPlanDAO.getCount(userid, year, quarter);

		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public void addYearAimPlan(UserYearAimPlan userYearAimPlan) {
		userYearAimPlanDAO.save(userYearAimPlan);
	}

	public void deleteYearAimPlan(UserYearAimPlan userYearAimPlan) {
		userYearAimPlanDAO.delete(userYearAimPlan);
	}

	public UserYearAimPlan getYearAimPlan(Integer id) {
		return userYearAimPlanDAO.findById(id);
	}

	public void updateYearAimPlan(UserYearAimPlan userYearAimPlan) {
		userYearAimPlanDAO.merge(userYearAimPlan);
	}

}
