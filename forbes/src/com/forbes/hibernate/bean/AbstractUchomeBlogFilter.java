package com.forbes.hibernate.bean;

/**
 * AbstractUchomeBlogFilter entity provides the base persistence definition of
 * the UchomeBlogFilter entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUchomeBlogFilter implements java.io.Serializable {

	// Fields

	private Integer filterid;
	private String name;
	private String url;
	private String note;

	// Constructors

	/** default constructor */
	public AbstractUchomeBlogFilter() {
	}

	/** full constructor */
	public AbstractUchomeBlogFilter(String name, String url, String note) {
		this.name = name;
		this.url = url;
		this.note = note;
	}

	// Property accessors

	public Integer getFilterid() {
		return this.filterid;
	}

	public void setFilterid(Integer filterid) {
		this.filterid = filterid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}