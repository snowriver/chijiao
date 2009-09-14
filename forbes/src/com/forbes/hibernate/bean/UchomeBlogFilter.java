package com.forbes.hibernate.bean;

/**
 * UchomeBlogFilter entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UchomeBlogFilter extends AbstractUchomeBlogFilter implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UchomeBlogFilter() {
	}

	/** full constructor */
	public UchomeBlogFilter(String name, String url, String note) {
		super(name, url, note);
	}

}
