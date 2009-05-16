package com.forbes.service.video;

import java.util.List;
import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.VideoUrl;
import com.forbes.hibernate.dao.VideoUrlDAO;
import com.forbes.util.Pager;

public interface VideoUrlManager {

	public VideoUrlDAO getVideoUrlDAO();

	public void setVideoUrlDAO(VideoUrlDAO videoUrlDAO);

	public List getVideoUrlByPage( Pager pager, int pageNo, String videoid, String keyword, String orderby ) throws ForbesException;

	public void addVideoUrl(VideoUrl videoUrl);
	
	public void deleteVideoUrl(VideoUrl videoUrl);
	
	public VideoUrl getVideoUrl(Integer id);

	public void updateVideoUrl(VideoUrl videoUrl);

	public List getVideoUrl() throws ForbesException;

}
