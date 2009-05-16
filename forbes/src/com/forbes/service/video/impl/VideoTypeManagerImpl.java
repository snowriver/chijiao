package com.forbes.service.video.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.VideoType;
import com.forbes.hibernate.dao.VideoTypeDAO;
import com.forbes.service.video.VideoTypeManager;
import com.forbes.util.Pager;


public class VideoTypeManagerImpl implements VideoTypeManager {
	
	
	
	private VideoTypeDAO videoTypeDAO;
	
	public VideoTypeDAO getVideoTypeDAO() {
		return videoTypeDAO;
	}

	public void setVideoTypeDAO(VideoTypeDAO articleTypeDAO) {
		this.videoTypeDAO = articleTypeDAO;
	}

	public List getTopVideoTypeByPage( Pager pager, int pageNo ) throws ForbesException{
		try {			
			pager.setTotoalCnt(videoTypeDAO.getCount("0"));
			List list = videoTypeDAO.findVideoTypeByPage("0", (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getTopVideoType( ) throws ForbesException{
		try {
			List list = videoTypeDAO.findByProperty("pid", 0);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAllVideoType( ) throws ForbesException{
		try {
			List list = videoTypeDAO.findAll();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	public void addVideoType(VideoType videoType) {
		videoTypeDAO.save(videoType);
	}
	
	public void deleteVideoType(VideoType videoType) {
		videoTypeDAO.delete(videoType);
	}
	
	public VideoType getVideoType(Integer id) {
		return videoTypeDAO.findById(id);
	}

	public void updateVideoType(VideoType videoType) {
		videoTypeDAO.attachDirty(videoType);
	}

	
	public List getVideoType() throws ForbesException{
		try {
			List list = videoTypeDAO.findAll();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getVideoTypes(String pid ) throws ForbesException{
		try {
			List list = videoTypeDAO.findByPid(pid);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	
}
