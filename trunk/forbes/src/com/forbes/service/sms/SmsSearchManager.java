package com.forbes.service.sms;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.dao.UcPmsDAO;
import com.forbes.util.Pager;

public interface SmsSearchManager {
	
	public UcPmsDAO getUcPmsDAO();

	public void setUcPmsDAO(UcPmsDAO ucPmsDAO);
	
	public List getUcPmsByPage(Pager pager, int pageNo, String msgfromid,
			String msgtoid, String folder, String new_, String dateline,
			String delstatus, String related, String fromappid, String orderby)
			throws ForbesException;

	public int getPmsCount(String msgfromid, String msgtoid, String folder,
			String new_, String dateline, String delstatus, String related,
			String fromappid) throws ForbesException;
}
