package com.forbes.service.newsfeed;

import java.util.List;

import com.forbes.hibernate.bean.NfMsgRelationship;
import com.forbes.hibernate.dao.NfMsgRelationshipDAO;
import com.forbes.util.Pager;

public interface NewsFeedManager {
	public String [][] getNewsFeed( String userId, String msgType );
	public List <NfMsgRelationship> getNotReadNewsFeed( String userId, String msgType );
	public List <NfMsgRelationship> getRecentNewsFeed( String userId, String msgType );
	public  List <NfMsgRelationship> getNewsFeedByPage( String userId, String msgType, Pager pager );
	public  List <NfMsgRelationship> searchNewsFeedByPage( String userId, String msgType, 
			String startTime,String endTime ,String keyWord, Pager pager);
	public int getCount( String userId, String msgType );
	public int getNotViewCount( String userId, String msgType );
	public NfMsgRelationshipDAO getNfMsgRelationshipDAO();
	public void setNfMsgRelationshipDAO(NfMsgRelationshipDAO nfMsgRelationshipDAO) ;

	public int getDisCount();

	public void setDisCount(int disCount);
}
