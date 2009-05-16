package com.forbes.service.newsfeed;

import com.forbes.hibernate.bean.NfMsg;
import com.forbes.hibernate.dao.NfMsgDAO;
import com.forbes.hibernate.dao.NfMsgRelationshipDAO;
import com.forbes.hibernate.dao.NfMsgTypeDAO;

public interface SendMsgManager {
	
	public NfMsg insertMsg(String msgTypeId, String genUserId, 
			String msgTitle, String msgContent );
	public void insetRelationShip( NfMsg userMsg, String targetUserId );
	
	
	/**
	 * ������Ϣ�b�����ˣ�������Ϣ�Č�����ϵ�������딵�ݿ�
	 */
	public void doGenMsg(String genUserId, String targetUserId, String msgTitle, String msgContent, String msgTypeid);
	
	public NfMsgRelationshipDAO getNfMsgRelationshipDAO();
	public void setNfMsgRelationshipDAO(NfMsgRelationshipDAO nfMsgRelationshipDAO);
	public NfMsgTypeDAO getNfMsgTypeDAO();
	public void setNfMsgTypeDAO(NfMsgTypeDAO nfMsgTypeDAO);
	public NfMsgDAO getNfMsgDAO();
	public void setNfMsgDAO(NfMsgDAO nfMsgDAO);

}
