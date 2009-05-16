package com.forbes.service.video.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Article;
import com.forbes.hibernate.bean.Video;
import com.forbes.hibernate.dao.VideoDAO;
import com.forbes.hibernate.dao.VideoTypeDAO;
import com.forbes.service.video.VideoListManager;
import com.forbes.util.Pager;


public class VideoListManagerImpl implements VideoListManager {
	
	private VideoTypeDAO videoTypeDAO;
	private VideoDAO videoDAO;
	
	public VideoTypeDAO getVideoTypeDAO() {
		return videoTypeDAO;
	}

	public void setVideoTypeDAO(VideoTypeDAO videoTypeDAO) {
		this.videoTypeDAO = videoTypeDAO;
	}
	
	public VideoDAO getVideoDAO() {
		return videoDAO;
	}

	public void setVideoDAO(VideoDAO videoDAO) {
		this.videoDAO = videoDAO;
	}
	
	

	public List getVideoByPage(Pager pager, int pageNo, String deleteFlag, String userid, String typeid, String keyword, String orderby ) throws ForbesException{
		try {			
			pager.setTotoalCnt(videoDAO.getCount(deleteFlag, userid, typeid, keyword));
			List list = videoDAO.findVideoByPage(deleteFlag, userid, typeid, keyword, orderby, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	

	public void addVideo(Video video) {
		videoDAO.save(video);
	}
	
	public void deleteVideo(Video video) {
		videoDAO.delete(video);
	}
	
	public Video getVideo(Integer id) {
		return videoDAO.findById(id);
	}

	public void updateVideo(Video video) {
		videoDAO.attachDirty(video);
	}

	public boolean verifyTitle( String title ){
		List list = videoDAO.findByTitle(title);
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}

	
	public boolean verifyTitle( Integer id, String title ){
		Video a = videoDAO.findById(id);
		List list = videoDAO.findByTitle(title);
		if ( list.contains(a) ) {
			list.remove(a);
		}
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}
	
	
	public List getTopVideoByVideoType(String typeid, String orderby, int begin, int length ) throws ForbesException{
		try {
			List list = videoDAO.findTopVideoeByVideoType(typeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	
	public List getLikeVideo(String likeid, String orderby, int begin, int length ) throws ForbesException{
		if( likeid != null ){
			likeid = likeid.replaceAll("_", ",");
		}
		try {
			List list = videoDAO.findVideoById(likeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
}
