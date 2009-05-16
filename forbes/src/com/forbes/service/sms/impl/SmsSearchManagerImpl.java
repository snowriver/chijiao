package com.forbes.service.sms.impl;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.FeedBack;
import com.forbes.hibernate.bean.UcPms;
import com.forbes.hibernate.dao.FeedBackDAO;
import com.forbes.hibernate.dao.UcPmsDAO;
import com.forbes.service.sms.SmsSearchManager;
import com.forbes.util.Pager;

public class SmsSearchManagerImpl implements SmsSearchManager {

	private UcPmsDAO ucPmsDAO;

	public UcPmsDAO getUcPmsDAO() {
		return ucPmsDAO;
	}

	public void setUcPmsDAO(UcPmsDAO ucPmsDAO) {
		this.ucPmsDAO = ucPmsDAO;
	}

	/*public void addUcPms(UcPms ucPms) {
		ucPmsDAO.save(ucPms);
	}

	public void deleteUcPms(UcPms ucPms) {
		ucPmsDAO.delete(ucPms);
	}

	public UcPms getUcPms(Integer id) {
		return ucPmsDAO.findById(id);
	}

	public void updateUcPms(UcPms ucPms) {
		ucPmsDAO.attachDirty(ucPms);
	}*/

	public List getUcPmsByPage(Pager pager, int pageNo, String msgfromid,
			String msgtoid, String folder, String new_, String dateline,
			String delstatus, String related, String fromappid, String orderby)
			throws ForbesException {
		try {
			if( delstatus != null ){
				delstatus = delstatus.replaceAll("_", ",");
			}
			pager.setTotoalCnt(ucPmsDAO.getCount(msgfromid, msgtoid, folder,
					new_, dateline, delstatus, related, fromappid));
			List list = ucPmsDAO.getUcPmsByPage(msgfromid, msgtoid, folder,
					new_, dateline, delstatus, related, fromappid, orderby,
					(pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public int getPmsCount(String msgfromid, String msgtoid, String folder,
			String new_, String dateline, String delstatus, String related,
			String fromappid) throws ForbesException {
		try {
			if( delstatus != null ){
				delstatus = delstatus.replaceAll("_", ",");
			}
			
			return ucPmsDAO.getCount(msgfromid, msgtoid, folder,
					new_, dateline, delstatus, related, fromappid);
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

}
