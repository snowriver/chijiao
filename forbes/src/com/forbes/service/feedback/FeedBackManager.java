package com.forbes.service.feedback;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.FeedBack;
import com.forbes.hibernate.dao.FeedBackDAO;
import com.forbes.util.Pager;

public interface FeedBackManager {

	public FeedBackDAO getFeedBackDAO();

	public void setFeedBackDAO(FeedBackDAO feedBackDAO);

	public void addFeedBack(FeedBack feedBack);
	
	public void deleteFeedBack(FeedBack feedBack);
	
	public FeedBack getFeedBack(Integer id);

	public void updateFeedBack(FeedBack feedBack);
	
	public List getFeedBackByPage( Pager pager, int pageNo, Short feedType, Short errorType, String keyword  ) throws ForbesException;
	
}
