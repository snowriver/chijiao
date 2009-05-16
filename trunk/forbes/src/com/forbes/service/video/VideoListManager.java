package com.forbes.service.video;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Video;
import com.forbes.hibernate.dao.VideoDAO;
import com.forbes.hibernate.dao.VideoTypeDAO;
import com.forbes.util.Pager;

public interface VideoListManager {

	
	public VideoTypeDAO getVideoTypeDAO() ;

	public void setVideoTypeDAO(VideoTypeDAO videoTypeDAO);
	
	public VideoDAO getVideoDAO();

	public void setVideoDAO(VideoDAO videoDAO);
	
	public List getVideoByPage(Pager pager, int pageNo, String deleteFlag, String userid, String typeid, String keyword, String orderby ) 
		throws ForbesException;

	public void addVideo(Video video) ;
	
	public void deleteVideo(Video video) ;
	
	public Video getVideo(Integer id);

	public void updateVideo(Video video);
	
	public boolean verifyTitle( String title );
	
	public boolean verifyTitle( Integer id, String title );
	
	public List getTopVideoByVideoType(String typeid, String orderby, int begin, int length ) throws ForbesException;
	
	public List getLikeVideo(String likeid, String orderby, int begin, int length ) throws ForbesException;
}
