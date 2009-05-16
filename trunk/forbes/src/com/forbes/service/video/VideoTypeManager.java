package com.forbes.service.video;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.VideoType;
import com.forbes.hibernate.dao.VideoTypeDAO;
import com.forbes.util.Pager;

public interface VideoTypeManager {

	
	public VideoTypeDAO getVideoTypeDAO() ;

	public void setVideoTypeDAO(VideoTypeDAO articleTypeDAO) ;

	public List getTopVideoTypeByPage( Pager pager, int pageNo ) throws ForbesException;
	
	public List getTopVideoType( ) throws ForbesException;
	
	public List getAllVideoType( ) throws ForbesException;

	public void addVideoType(VideoType videoType) ;
	
	public void deleteVideoType(VideoType videoType);
	
	public VideoType getVideoType(Integer id) ;

	public void updateVideoType(VideoType videoType);
	
	public List getVideoType() throws ForbesException;
	
	public List getVideoTypes(String pid ) throws ForbesException;
	
}
