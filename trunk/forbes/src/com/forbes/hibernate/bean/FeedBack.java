package com.forbes.hibernate.bean;

/**
 * FeedBack entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class FeedBack extends AbstractFeedBack implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public FeedBack() {
	}

	/** full constructor */
	public FeedBack(Short feedType, Short errorType, String errorContent,
			String errorUrl, Integer userId, String userName, String email) {
		super(feedType, errorType, errorContent, errorUrl, userId, userName, email);
	}

}
