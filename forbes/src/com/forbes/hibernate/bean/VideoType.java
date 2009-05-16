package com.forbes.hibernate.bean;

/**
 * City entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class VideoType extends AbstractVideoType implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public VideoType() {
	}

	/** full constructor */
	public VideoType(Integer pid, String name, Integer disorder, String issend, String description, String keywords) {
		super(pid, name, disorder, issend, description, keywords);
	}

}
