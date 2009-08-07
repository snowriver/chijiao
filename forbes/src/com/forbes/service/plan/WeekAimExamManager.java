package com.forbes.service.plan;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserWeekAimExam;
import com.forbes.hibernate.dao.UserWeekAimExamDAO;

public interface WeekAimExamManager {

	public UserWeekAimExamDAO getUserWeekAimExamDAO();

	public void setUserWeekAimExamDAO(UserWeekAimExamDAO userWeekAimExamDAO);

	public UserWeekAimExam getWeekAimExam(String userid, String date)
			throws ForbesException;

	public int getWeekAimExamCount(String userid, String date)
			throws ForbesException;

	public void addWeekAimExam(UserWeekAimExam userWeekAimExam);

	public void deleteWeekAimExam(UserWeekAimExam userWeekAimExam);

	public UserWeekAimExam getWeekAimExam(Integer id);

	public void updateWeekAimExam(UserWeekAimExam userWeekAimExam);
}
