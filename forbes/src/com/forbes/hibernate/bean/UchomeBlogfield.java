package com.forbes.hibernate.bean;

/**
 * UchomeBlogfield entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UchomeBlogfield extends AbstractUchomeBlogfield implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UchomeBlogfield() {
	}

	/** full constructor */
	public UchomeBlogfield(Integer uid, String tag, String message,
			String postip, String related, Integer relatedtime, String targetIds) {
		super(uid, tag, message, postip, related, relatedtime, targetIds);
	}

}
