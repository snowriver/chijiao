package com.forbes.hibernate.bean;

/**
 * AbstractUchomeBlogfield entity provides the base persistence definition of
 * the UchomeBlogfield entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUchomeBlogfield implements java.io.Serializable {

	// Fields

	private Integer blogid;
	private Integer uid;
	private String tag;
	private String message;
	private String postip;
	private String related;
	private Integer relatedtime;
	private String targetIds;

	// Constructors

	/** default constructor */
	public AbstractUchomeBlogfield() {
	}

	/** full constructor */
	public AbstractUchomeBlogfield(Integer uid, String tag, String message,
			String postip, String related, Integer relatedtime, String targetIds) {
		this.uid = uid;
		this.tag = tag;
		this.message = message;
		this.postip = postip;
		this.related = related;
		this.relatedtime = relatedtime;
		this.targetIds = targetIds;
	}

	// Property accessors

	public Integer getBlogid() {
		return this.blogid;
	}

	public void setBlogid(Integer blogid) {
		this.blogid = blogid;
	}

	public Integer getUid() {
		return this.uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getTag() {
		return this.tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPostip() {
		return this.postip;
	}

	public void setPostip(String postip) {
		this.postip = postip;
	}

	public String getRelated() {
		return this.related;
	}

	public void setRelated(String related) {
		this.related = related;
	}

	public Integer getRelatedtime() {
		return this.relatedtime;
	}

	public void setRelatedtime(Integer relatedtime) {
		this.relatedtime = relatedtime;
	}

	public String getTargetIds() {
		return this.targetIds;
	}

	public void setTargetIds(String targetIds) {
		this.targetIds = targetIds;
	}

}