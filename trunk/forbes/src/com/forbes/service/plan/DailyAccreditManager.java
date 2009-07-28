package com.forbes.service.plan;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserDailyAccredit;
import com.forbes.hibernate.dao.UserDailyAccreditDAO;
import com.forbes.util.Pager;

public interface DailyAccreditManager {

	public UserDailyAccreditDAO getUserDailyAccreditDAO();

	public void setUserDailyAccreditDAO(
			UserDailyAccreditDAO userDailyAccreditDAO);

	public List getDailyPlanByPage(Pager pager, int pageNo, String userid,
			String date, String iscomplete, String keyword, String orderby)
			throws ForbesException;

	public int getDailyAccreditCount(String userid, String date, String iscomplete)
			throws ForbesException;

	public void addDailyPlan(UserDailyAccredit userDailyAccredit);

	public void deleteDailyPlan(UserDailyAccredit userDailyAccredit);

	public UserDailyAccredit getDailyPlan(Integer id);

	public void updateDailyPlan(UserDailyAccredit userDailyAccredit);
}
