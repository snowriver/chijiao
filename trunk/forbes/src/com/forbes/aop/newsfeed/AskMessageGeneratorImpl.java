package com.forbes.aop.newsfeed;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;
import java.lang.reflect.Method;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;

import com.forbes.hibernate.bean.Ask;
import com.forbes.hibernate.bean.AskAnswer;
import com.forbes.hibernate.bean.NfMsg;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.bean.UserFriend;
import com.forbes.hibernate.dao.UcMembersDAO;
import com.forbes.hibernate.dao.UserFriendDAO;
import com.forbes.util.Constant;



public class AskMessageGeneratorImpl extends DefaultMessageGeneratorImpl{
	
	public static Map newsFeedMap  = new HashMap();
/*	public static String OP_CFM    = "CFM";
	public static String OP_CNCL   = "CNCL";*/
	
	public static String USER_ADMIN  = "UA"; //
	public static String USER_CLIENT = "UC"; //

	private UserFriendDAO userFriendDAO;
	
	private UcMembersDAO ucMembersDAO;

	static{
		//0 客戶 1 日期   2 问题ID  3 问题

		//client 客户提问后的消息
		newsFeedMap.put("ASK_QUESTION_TO_UC",   "[{0}]于[{1}]提出问题[{3}]");
		newsFeedMap.put("ANSWER_QUESTION_TO_UC",   "[{0}]于[{1}]回答了您提出的问题[{3}]");
		
	}
	public void genMessage(Object returnValue,Method method,Object[] args,Object target){
		

		/*System.out.println("-----------------spring aop test--------------:" + method.getName() 
				+ " target:" + target.getClass().getName());
		
		System.out.println(" method.getName() =" + method.getName());
		System.out.println(" args.length() =" + args.length);
		System.out.println(" args[0] =" + args[0]);*/


		if( method.getName().startsWith("askQuestion") ){
			afterAskQuestion(args);
		}
		if( method.getName().startsWith("answerQuestion") ){
			afterAnswerQuestion(args);
		}
		
	}
	
	public void afterAskQuestion(Object[] args){
		
		UcMembers user  = (UcMembers) args[0];
		Ask  ask   = (Ask) args[1];
				
		//根据操作類型産生不同的消息
		
		String userName = user.getUsername();
		String act = "ASK_QUESTION_TO_UC";
		int msgTypeId = 1;
				
		List friends = userFriendDAO.findByUserId(user.getUid());
				
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM月dd日");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH點mm分");
			
		String pubDate   = df.format(ask.getExpiredTime()) ;
		
		String genUserId   = "" + user.getUid();
		String genUserType = "" + Constant.ASK_USER_CLIENT;
			
		//String msg = "";
		
		//往數据库寫入消息
			
		/*if( act == null || act.length() < 1 ){
			return;
		}*/
	    String msgKey = act;
	    String message = "";


		//判断産生消息的用户
			
		
	    message = this.genMsg(msgKey, userName, pubDate, ask.getId().toString(), ask.getTitle() );
	    /*if( message != null && message.length() > 1 ){
	    	
	    	for(int i=0; i<friends.size(); i++) {
	    		UserFriend friend = (UserFriend)friends.get(i);
	    		doGenMsg(genUserId, genUserType, ""+ friend.getFriend().getId(), ""+Constant.ASK_USER_CLIENT, message, ""+msgTypeId );
	    	}
	    	
	    }*/
	    if( message != null && message.length() > 1 ){
	    	NfMsg nfMsg = this.insertMsg(""+msgTypeId, genUserId, message, ""+genUserType);
	    	for(int i=0; i<friends.size(); i++) {
	    		UserFriend friend = (UserFriend)friends.get(i);
	    		this.insetRelationShip(nfMsg, ""+ friend.getFriend().getId(), ""+Constant.ASK_USER_CLIENT );
	    	}
	    	
	    }

	}

	
	public void afterAnswerQuestion(Object[] args){
		
		UcMembers user  = (UcMembers) args[0];
		AskAnswer  aa   = (AskAnswer) args[1];
				
		//根据操作類型産生不同的消息
		
		String userName = user.getUsername();
		String act = "ANSWER_QUESTION_TO_UC";
		int msgTypeId = 2;
				
		List friends = userFriendDAO.findByUserId(user.getUid());
				
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM月dd日");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH點mm分");
			
		String pubDate   = df.format(aa.getPubdate()) ;
		
		String genUserId   = "" + user.getUid();
		String genUserType = "" + Constant.ASK_USER_CLIENT;
			
		//String msg = "";
		
		//往數据库寫入消息
			
		/*if( act == null || act.length() < 1 ){
			return;
		}*/
	    String msgKey = act;
	    String message = "";


		//判断産生消息的用户
			
		
	    message = this.genMsg(msgKey, userName, pubDate, aa.getAsk().getId().toString(), aa.getAsk().getTitle() );
	    /*if( message != null && message.length() > 1 ){
	    	
	    	for(int i=0; i<friends.size(); i++) {
	    		UserFriend friend = (UserFriend)friends.get(i);
	    		doGenMsg(genUserId, genUserType, ""+ friend.getFriend().getId(), ""+Constant.ASK_USER_CLIENT, message, ""+msgTypeId );
	    	}
	    	
	    }*/
	    if( message != null && message.length() > 1 ){
	    	NfMsg nfMsg = this.insertMsg(""+msgTypeId, genUserId, message, ""+genUserType);

	    	UcMembers asker = ucMembersDAO.findById(aa.getAsk().getUserId());
    		this.insetRelationShip(nfMsg, ""+ asker.getUid(), ""+Constant.ASK_USER_CLIENT );
	    	
	    }

	}
	
	//0 客戶	1 日期	2 问题ID	3 问题
	
	public String genMsg(String msgKey, String userName, String pubDate, String askId, String askTitle ){
		System.out.print("KEY:" + msgKey + " ");
		String msg = newsFeedMap.get( msgKey )==null ? ""+newsFeedMap.get( msgKey ) : ""+newsFeedMap.get( msgKey );
		if( msg == null || msg.length() < 1 || msg.equalsIgnoreCase("null")){
			//System.out.println(" NO MSG ");
			return "";
		}
		MessageFormat msgFmt = new MessageFormat(msg);
		msg = msgFmt.format(new Object[]{ userName, pubDate, askId, askTitle });		
	
		return msg;
	}
	
		
	/**
	 * 根据消息産生的人，建立消息的對應关系，并寫入數据库
	 */
	public void doGenMsg(String genUserId, String genUserType, String targetUserId,
			String targetUserType, String msg, String msgTypeid){
	
      	//插入數据库
		
		//System.out.println( "msg:" + msg );
		NfMsg nfMsg = this.insertMsg(msgTypeid, genUserId, msg, ""+genUserType);
		this.insetRelationShip(nfMsg, targetUserId, ""+targetUserType );

	}


	public UserFriendDAO getUserFriendDAO() {
		return userFriendDAO;
	}

	public void setUserFriendDAO(UserFriendDAO userFriendDAO) {
		this.userFriendDAO = userFriendDAO;
	}

	public UcMembersDAO getUcMembersDAO() {
		return ucMembersDAO;
	}

	public void setUcMembersDAO(UcMembersDAO ucMembersDAO) {
		this.ucMembersDAO = ucMembersDAO;
	}


}