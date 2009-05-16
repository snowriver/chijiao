package com.forbes.service.video.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.VideoUrl;
import com.forbes.hibernate.dao.VideoUrlDAO;
import com.forbes.service.video.VideoUrlManager;
import com.forbes.util.Pager;


public class VideoUrlManagerImpl implements VideoUrlManager {
	

	private VideoUrlDAO videoUrlDAO;

	public VideoUrlDAO getVideoUrlDAO() {
		return videoUrlDAO;
	}

	public void setVideoUrlDAO(VideoUrlDAO videoUrlDAO) {
		this.videoUrlDAO = videoUrlDAO;
	}

	public List getVideoUrlByPage( Pager pager, int pageNo, String videoid, String keyword, String orderby ) throws ForbesException {
		try {			
			pager.setTotoalCnt( videoUrlDAO.getCount(videoid, keyword) );
			List list = videoUrlDAO.findVideoUrlByPage(videoid, keyword, orderby, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public void addVideoUrl(VideoUrl videoUrl) {
		videoUrlDAO.save(videoUrl);
	}
	
	public void deleteVideoUrl(VideoUrl videoUrl) {
		videoUrlDAO.delete(videoUrl);
	}
	
	public VideoUrl getVideoUrl(Integer id) {
		return videoUrlDAO.findById(id);
	}

	public void updateVideoUrl(VideoUrl videoUrl) {
		videoUrlDAO.attachDirty(videoUrl);
	}

	
	public List getVideoUrl() throws ForbesException{
		try {
			List list = videoUrlDAO.findAll();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	
	
}
