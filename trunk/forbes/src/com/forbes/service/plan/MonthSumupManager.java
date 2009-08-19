package com.forbes.service.plan;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserMonthSumup;
import com.forbes.hibernate.dao.UserMonthSumupDAO;

public interface MonthSumupManager {

	public UserMonthSumupDAO getUserMonthSumupDAO();

	public void setUserMonthSumupDAO(UserMonthSumupDAO userMonthSumupDAO);

	public UserMonthSumup getMonthSumup(String userid, String year, String month)
			throws ForbesException;

	public int getMonthSumupCount(String userid, String year, String month)
			throws ForbesException;

	public void addMonthSumup(UserMonthSumup userMonthSumup);

	public void deleteMonthSumup(UserMonthSumup userMonthSumup);

	public UserMonthSumup getMonthSumup(Integer id);

	public void updateMonthSumup(UserMonthSumup userMonthSumup);

}
