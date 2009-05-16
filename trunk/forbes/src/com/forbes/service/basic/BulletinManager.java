package com.forbes.service.basic;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Bulletin;
import com.forbes.hibernate.dao.BulletinDAO;
import com.forbes.util.Pager;

public interface BulletinManager {

	public BulletinDAO getBulletinDAO();

	public void setBulletinDAO(BulletinDAO bulletinDAO);

	public void addBulletin(Bulletin bulletin);

	public void deleteBulletin(Bulletin bulletin);

	public Bulletin getBulletin(Integer id);

	public Bulletin getNextBulletin(Integer id);

	public Bulletin getPreBulletin(Integer id);

	public void updateBulletin(Bulletin bulletin);

	public List getTopBulletin(String orderby, int begin, int length)
			throws ForbesException;

	public List getBulletinByPage(Pager pager, int pageNo, String keyword,
			String orderby) throws ForbesException;
}
