package com.forbes.hibernate.bean;

/**
 * VideoUrl entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class VideoUrl extends AbstractVideoUrl implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public VideoUrl() {
	}

	/** full constructor */
	public VideoUrl(String title, String url, Integer width, Integer height, String fromweb) {
		super(title, url, width, height, fromweb);
	}

}
