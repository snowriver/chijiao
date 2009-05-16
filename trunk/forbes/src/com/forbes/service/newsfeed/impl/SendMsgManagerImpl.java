package com.forbes.service.newsfeed.impl;

import java.util.Calendar;
import com.forbes.hibernate.bean.NfMsg;
import com.forbes.hibernate.bean.NfMsgRelationship;
import com.forbes.hibernate.bean.NfMsgType;
import com.forbes.hibernate.dao.NfMsgDAO;
import com.forbes.hibernate.dao.NfMsgRelationshipDAO;
import com.forbes.hibernate.dao.NfMsgTypeDAO;
import com.forbes.service.newsfeed.SendMsgManager;


public class SendMsgManagerImpl implements SendMsgManager{
	
	private NfMsgTypeDAO nfMsgTypeDAO;
	private NfMsgDAO  nfMsgDAO;
	private NfMsgRelationshipDAO nfMsgRelationshipDAO;
  
    
	
	/**
	 * ����Ϣ���딵�ݿ�
	 * @param msgTypeId
	 * @param genUsrId
	 * @param genUsrType
	 * @param targetUsrId
	 * @param targetUsrType
	 */
	public NfMsg insertMsg(String msgTypeId, String genUserId, 
			String msgTitle, String msgContent ){
		
		NfMsgType msgType = nfMsgTypeDAO.findById( new Short(msgTypeId) );
		
		NfMsg nfMsg = new NfMsg();
		nfMsg.setMsgTitle(msgTitle);
		nfMsg.setMsgContent(msgContent);
		nfMsg.setUserId( new Integer( genUserId ) );
		nfMsg.setNfMsgType( msgType );
		nfMsg.setMsgDate( Calendar.getInstance().getTime() );
		nfMsgDAO.save( nfMsg );
		return nfMsg;	
		
	}
	public void insetRelationShip( NfMsg userMsg, String targetUserId ){
		NfMsgRelationship msgRelationship =  new NfMsgRelationship();
		msgRelationship.setNfMsg( userMsg );
		msgRelationship.setUserId( new Integer(targetUserId) );
		msgRelationship.setViewTimes((short)0);
		nfMsgRelationshipDAO.save( msgRelationship );
	}
	
	
	/**
	 * ������Ϣ�b�����ˣ�������Ϣ�Č�����ϵ�������딵�ݿ�
	 */
	public void doGenMsg(String genUserId, String targetUserId, String msgTitle, String msgContent, String msgTypeid){	
      	//���딵�ݿ�		
		//System.out.println( "msg:" + msgTitle );
		NfMsg nfMsg = this.insertMsg(msgTypeid, genUserId, msgTitle, msgContent );
		this.insetRelationShip(nfMsg, targetUserId );
	}
	
	public NfMsgRelationshipDAO getNfMsgRelationshipDAO() {
		return nfMsgRelationshipDAO;
	}
	public void setNfMsgRelationshipDAO(NfMsgRelationshipDAO nfMsgRelationshipDAO) {
		this.nfMsgRelationshipDAO = nfMsgRelationshipDAO;
	}
	public NfMsgTypeDAO getNfMsgTypeDAO() {
		return nfMsgTypeDAO;
	}
	public void setNfMsgTypeDAO(NfMsgTypeDAO nfMsgTypeDAO) {
		this.nfMsgTypeDAO = nfMsgTypeDAO;
	}
	public NfMsgDAO getNfMsgDAO() {
		return nfMsgDAO;
	}
	public void setNfMsgDAO(NfMsgDAO nfMsgDAO) {
		this.nfMsgDAO = nfMsgDAO;
	}


}
