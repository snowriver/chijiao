package com.forbes.service.basic.impl;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Bulletin;
import com.forbes.hibernate.dao.BulletinDAO;
import com.forbes.service.basic.BulletinManager;
import com.forbes.util.Pager;

public class BulletinManagerImpl implements BulletinManager {

	private BulletinDAO bulletinDAO;

	public BulletinDAO getBulletinDAO() {
		return bulletinDAO;
	}

	public void setBulletinDAO(BulletinDAO bulletinDAO) {
		this.bulletinDAO = bulletinDAO;
	}

	public void addBulletin(Bulletin bulletin) {
		bulletinDAO.save(bulletin);
	}

	public void deleteBulletin(Bulletin bulletin) {
		bulletinDAO.delete(bulletin);
	}

	public Bulletin getBulletin(Integer id) {
		return bulletinDAO.findById(id);
	}

	public Bulletin getNextBulletin(Integer id) {
		List list = bulletinDAO.findNextBulletin(id.toString());
		if (list.size() > 0)
			return (Bulletin) list.get(0);
		else
			return null;
	}

	public Bulletin getPreBulletin(Integer id) {
		List list = bulletinDAO.findPreBulletin(id.toString());
		if (list.size() > 0)
			return (Bulletin) list.get(0);
		else
			return null;
	}

	public void updateBulletin(Bulletin bulletin) {
		bulletinDAO.attachDirty(bulletin);
	}

	public List getTopBulletin(String orderby, int begin, int length)
			throws ForbesException {
		try {
			return bulletinDAO.findTopBulletin(orderby, begin, length);
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public List getBulletinByPage(Pager pager, int pageNo, String keyword,
			String orderby) throws ForbesException {
		try {
			pager.setTotoalCnt(bulletinDAO.getCount(keyword));
			List list = bulletinDAO.findBulletinByPage(keyword, orderby,
					(pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

}
