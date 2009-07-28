package com.forbes.service.newsfeed.impl;

import java.util.List;

import com.forbes.hibernate.bean.NfMsgRelationship;
import com.forbes.hibernate.dao.NfMsgRelationshipDAO;
import com.forbes.service.newsfeed.NewsFeedManager;
import com.forbes.util.Pager;


public class NewsFeedManagerImpl implements NewsFeedManager{
	
	private NfMsgRelationshipDAO nfMsgRelationshipDAO;
	
	private int disCount;
	
	public String [][] getNewsFeed( String userId, String msgType ){
		try{
			if( msgType != null ){
				msgType = msgType.replaceAll("_", ",");
			}
			
			List <NfMsgRelationship> newsFeedList = nfMsgRelationshipDAO.findMsg(userId, msgType, disCount );
			String [][] rs = new String [newsFeedList.size()][];
			for( int i = 0; i < newsFeedList.size() ; i++ ){
				rs[i] = new String[8];
				NfMsgRelationship msgRs = newsFeedList.get( i );
				try{
					msgRs.setViewTimes( (short)(msgRs.getViewTimes().intValue() + 1) );
				}catch( Exception e ){
					msgRs.setViewTimes((short)1);
				}
				rs[i][0] = msgRs.getId().toString();
				rs[i][1] = msgRs.getNfMsg().getUserId().toString();
				rs[i][2] = msgRs.getNfMsg().getNfMsgType().getMsgTypeCh();
				rs[i][3] = msgRs.getNfMsg().getMsgTitle();
				rs[i][4] = msgRs.getNfMsg().getMsgContent();
				rs[i][5] = msgRs.getUserId().toString();
				rs[i][6] = "" + msgRs.getViewTimes();
			}
			return rs;
		}catch( Exception e ){
			e.printStackTrace();
			return null;
		}
	}
	public List <NfMsgRelationship> getNotReadNewsFeed( String userId, String msgType ){
		try{
			if( msgType != null ){
				msgType = msgType.replaceAll("_", ",");
			}
			
			List <NfMsgRelationship> newsFeedList = nfMsgRelationshipDAO.findNotReadMsg(userId, msgType, disCount );
			for(NfMsgRelationship msgRs : newsFeedList){
				try{
					msgRs.setViewTimes( (short)(msgRs.getViewTimes().intValue() + 1) );
				}catch( Exception e ){
					msgRs.setViewTimes((short)1);
				}
			}
			return newsFeedList;
		}catch( Exception e ){
			e.printStackTrace();
			return null;
		}
	}
	public List <NfMsgRelationship> getRecentNewsFeed( String userId, String msgType ){
		try{
			if( msgType != null ){
				msgType = msgType.replaceAll("_", ",");
			}
			
			List <NfMsgRelationship> newsFeedList = nfMsgRelationshipDAO.findMsg(userId, msgType, disCount );
			
			return newsFeedList;
		}catch( Exception e ){
			e.printStackTrace();
			return null;
		}
	}
	public  List <NfMsgRelationship> getNewsFeedByPage( String userId, String msgType, Pager pager ){
		try{
			if( msgType != null ){
				msgType = msgType.replaceAll("_", ",");
			}
			
			pager.setTotoalCnt( nfMsgRelationshipDAO.getCount(userId, msgType) );
			List <NfMsgRelationship> newsFeedList = nfMsgRelationshipDAO.findMsgByPage(
					userId, msgType, (pager.getCurPage()-1) * pager.getCntOfPage(),pager.getCntOfPage() );
			for(NfMsgRelationship msgRs : newsFeedList){
				try{
					msgRs.setViewTimes( (short)(msgRs.getViewTimes().intValue() + 1) );
				}catch( Exception e ){
					msgRs.setViewTimes((short)1);
				}
			}
			return newsFeedList;
		}catch( Exception e ){
			e.printStackTrace();
			return null;
		}
	}
	public  List <NfMsgRelationship> searchNewsFeedByPage( String userId, String msgType, 
			String startTime,String endTime ,String keyword, Pager pager){
		try{
			if( msgType != null ){
				msgType = msgType.replaceAll("_", ",");
			}
			
			pager.setTotoalCnt( nfMsgRelationshipDAO.getCount(userId, msgType, startTime,endTime,keyword) );
			List <NfMsgRelationship> newsFeedList = nfMsgRelationshipDAO.searchMsgByPage(
					userId, msgType, startTime,endTime,keyword, (pager.getCurPage()-1) * pager.getCntOfPage(),pager.getCntOfPage() );
			for(NfMsgRelationship msgRs : newsFeedList){
				try{
					msgRs.setViewTimes( (short)(msgRs.getViewTimes().intValue() + 1) );
				}catch( Exception e ){
					msgRs.setViewTimes((short)1);
				}
			}
			return newsFeedList;
		}catch( Exception e ){
			e.printStackTrace();
			return null;
		}
	}
	public int getCount( String userId, String msgType ){
		try{
			if( msgType != null ){
				msgType = msgType.replaceAll("_", ",");
			}
			
			return nfMsgRelationshipDAO.getCount( userId, msgType );
		}catch( Exception e ){
			e.printStackTrace();
			return 0;
		}
	}
	public int getNotViewCount( String userId, String msgType ){
		try{
			if( msgType != null ){
				msgType = msgType.replaceAll("_", ",");
			}
			
			return nfMsgRelationshipDAO.getNotViewCount(userId, msgType );
		}catch( Exception e ){
			e.printStackTrace();
			return 0;
		}
	}
	public NfMsgRelationshipDAO getNfMsgRelationshipDAO() {
		return nfMsgRelationshipDAO;
	}

	public void setNfMsgRelationshipDAO(NfMsgRelationshipDAO nfMsgRelationshipDAO) {
		this.nfMsgRelationshipDAO = nfMsgRelationshipDAO;
	}

	public int getDisCount() {
		return disCount;
	}

	public void setDisCount(int disCount) {
		this.disCount = disCount;
	}
}
