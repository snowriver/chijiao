package com.forbes.service.plan;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UserLifeStageAim;
import com.forbes.hibernate.dao.UserLifeStageAimDAO;

public interface LifeStageAimManager {

	public UserLifeStageAimDAO getUserLifeStageAimDAO();

	public void setUserLifeStageAimDAO(UserLifeStageAimDAO userLifeStageAimDAO);

	public UserLifeStageAim getLifeStageAim(String userid, String years)
			throws ForbesException;

	public int getLifeStageAimCount(String userid, String years) throws ForbesException;

	public void addLifeStageAim(UserLifeStageAim userLifeStageAim);

	public void deleteLifeStageAim(UserLifeStageAim userLifeStageAim);

	public UserLifeStageAim getLifeStageAim(Integer id);

	public void updateLifeStageAim(UserLifeStageAim userLifeStageAim);

}
