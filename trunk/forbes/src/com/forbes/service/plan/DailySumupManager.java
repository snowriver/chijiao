package com.forbes.service.plan;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserDailySumup;
import com.forbes.hibernate.dao.UserDailySumupDAO;
import com.forbes.util.Pager;

public interface DailySumupManager {

	public UserDailySumupDAO getUserDailySumupDAO();

	public void setUserDailySumupDAO(UserDailySumupDAO userDailySumupDAO);

	public List getDailySumupByPage(Pager pager, int pageNo, String userid,
			String date, String keyword, String orderby) throws ForbesException;

	public int getDailySumupCount(String userid, String date)
			throws ForbesException;

	public void addDailySumup(UserDailySumup userDailySumup);

	public void deleteDailySumup(UserDailySumup userDailySumup);

	public UserDailySumup getDailySumup(Integer id);

	public void updateDailySumup(UserDailySumup userDailySumup);

}
