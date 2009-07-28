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

	public List getDailyAccreditByPage(Pager pager, int pageNo, String userid,
			String date, String iscomplete, String keyword, String orderby)
			throws ForbesException;

	public int getDailyAccreditCount(String userid, String date, String iscomplete)
			throws ForbesException;

	public void addDailyAccredit(UserDailyAccredit userDailyAccredit);

	public void deleteDailyAccredit(UserDailyAccredit userDailyAccredit);

	public UserDailyAccredit getDailyAccredit(Integer id);

	public void updateDailyAccredit(UserDailyAccredit userDailyAccredit);
}
