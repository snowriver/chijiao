package com.forbes.service.plan.impl;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserLifeStageAim;
import com.forbes.hibernate.dao.UserLifeStageAimDAO;
import com.forbes.service.plan.LifeStageAimManager;

public class LifeStageAimManagerImpl implements LifeStageAimManager {

	private UserLifeStageAimDAO userLifeStageAimDAO;

	public UserLifeStageAimDAO getUserLifeStageAimDAO() {
		return userLifeStageAimDAO;
	}

	public void setUserLifeStageAimDAO(UserLifeStageAimDAO userLifeStageAimDAO) {
		this.userLifeStageAimDAO = userLifeStageAimDAO;
	}

	public UserLifeStageAim getLifeStageAim(String userid, String years) throws ForbesException {
		try {
			List list = userLifeStageAimDAO.findLifeStageAim(userid,years);
			if (list.size() > 0) {
				return (UserLifeStageAim) list.get(0);
			} else {
				return null;
			}
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public int getLifeStageAimCount(String userid, String years)
			throws ForbesException {
		try {
			return userLifeStageAimDAO.getCount(userid,years);

		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public void addLifeStageAim(UserLifeStageAim userLifeStageAim) {
		userLifeStageAimDAO.save(userLifeStageAim);
	}

	public void deleteLifeStageAim(UserLifeStageAim userLifeStageAim) {
		userLifeStageAimDAO.delete(userLifeStageAim);
	}

	public UserLifeStageAim getLifeStageAim(Integer id) {
		return userLifeStageAimDAO.findById(id);
	}

	public void updateLifeStageAim(UserLifeStageAim userLifeStageAim) {
		userLifeStageAimDAO.merge(userLifeStageAim);
	}

}
