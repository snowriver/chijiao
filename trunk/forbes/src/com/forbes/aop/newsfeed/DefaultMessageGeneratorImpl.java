package com.forbes.aop.newsfeed;

import java.util.Calendar;
import java.lang.reflect.Method;
import com.forbes.hibernate.bean.NfMsg;
import com.forbes.hibernate.bean.NfMsgRelationship;
import com.forbes.hibernate.bean.NfMsgType;
import com.forbes.hibernate.dao.NfMsgDAO;
import com.forbes.hibernate.dao.NfMsgRelationshipDAO;
import com.forbes.hibernate.dao.NfMsgTypeDAO;


public class DefaultMessageGeneratorImpl implements MessageGeneratorInf{
	
	protected NfMsgTypeDAO nfMsgTypeDAO;
	protected NfMsgDAO  nfMsgDAO;
    protected NfMsgRelationshipDAO nfMsgRelationshipDAO;
    
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
	public NfMsgRelationshipDAO getNfMsgRelationshipDAO() {
		return nfMsgRelationshipDAO;
	}
	public void setNfMsgRelationshipDAO(NfMsgRelationshipDAO nfMsgRelationshipDAO) {
		this.nfMsgRelationshipDAO = nfMsgRelationshipDAO;
	}
    
	public void genMessage(Object returnValue,Method method,Object[] args,Object target){
	}
	
	
	/**
	 * 把消息放入數据库
	 * @param msgTypeId
	 * @param genUsrId
	 * @param genUsrType
	 * @param targetUsrId
	 * @param targetUsrType
	 */
	public NfMsg insertMsg(String msgTypeId,String genUserId,String msgBody, String genUserType ){
		
		NfMsgType msgType = nfMsgTypeDAO.findById( new Short(msgTypeId) );
		
		NfMsg nfMsg = new NfMsg();
		nfMsg.setMsgTitle(msgBody);
		nfMsg.setMsgContent(msgBody);
		nfMsg.setUserId( new Integer( genUserId ) );
		nfMsg.setUserType( new Short(genUserType) );
		nfMsg.setNfMsgType( msgType );
		nfMsg.setMsgDate( Calendar.getInstance().getTime() );
		nfMsgDAO.save( nfMsg );
		return nfMsg;

		
		
	}
	public void insetRelationShip( NfMsg nfMsg,String targetUserId,String targetUserType){
		NfMsgRelationship msgRelationship =  new NfMsgRelationship();
		msgRelationship.setNfMsg( nfMsg );
		msgRelationship.setUserId( new Integer(targetUserId) );
		msgRelationship.setUserType( new Short(targetUserType) );
		msgRelationship.setMsgTypeId(nfMsg.getNfMsgType().getId());
		msgRelationship.setViewTimes((short)0);
		nfMsgRelationshipDAO.save( msgRelationship );
	}
	
	
}