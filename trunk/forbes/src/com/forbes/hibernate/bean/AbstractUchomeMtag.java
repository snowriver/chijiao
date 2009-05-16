package com.forbes.hibernate.bean;

/**
 * AbstractUchomeMtag entity provides the base persistence definition of the
 * UchomeMtag entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUchomeMtag implements java.io.Serializable {

	// Fields

	private Integer tagid;
	private String tagname;
	private Short fieldid;
	private Integer membernum;
	private Byte close;
	private String announcement;
	private String pic;
	private Byte closeapply;
	private Byte joinperm;
	private Byte viewperm;
	private String moderator;

	// Constructors

	/** default constructor */
	public AbstractUchomeMtag() {
	}

	/** full constructor */
	public AbstractUchomeMtag(String tagname, Short fieldid, Integer membernum,
			Byte close, String announcement, String pic, Byte closeapply,
			Byte joinperm, Byte viewperm, String moderator) {
		this.tagname = tagname;
		this.fieldid = fieldid;
		this.membernum = membernum;
		this.close = close;
		this.announcement = announcement;
		this.pic = pic;
		this.closeapply = closeapply;
		this.joinperm = joinperm;
		this.viewperm = viewperm;
		this.moderator = moderator;
	}

	// Property accessors

	public Integer getTagid() {
		return this.tagid;
	}

	public void setTagid(Integer tagid) {
		this.tagid = tagid;
	}

	public String getTagname() {
		return this.tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

	public Short getFieldid() {
		return this.fieldid;
	}

	public void setFieldid(Short fieldid) {
		this.fieldid = fieldid;
	}

	public Integer getMembernum() {
		return this.membernum;
	}

	public void setMembernum(Integer membernum) {
		this.membernum = membernum;
	}

	public Byte getClose() {
		return this.close;
	}

	public void setClose(Byte close) {
		this.close = close;
	}

	public String getAnnouncement() {
		return this.announcement;
	}

	public void setAnnouncement(String announcement) {
		this.announcement = announcement;
	}

	public String getPic() {
		return this.pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public Byte getCloseapply() {
		return this.closeapply;
	}

	public void setCloseapply(Byte closeapply) {
		this.closeapply = closeapply;
	}

	public Byte getJoinperm() {
		return this.joinperm;
	}

	public void setJoinperm(Byte joinperm) {
		this.joinperm = joinperm;
	}

	public Byte getViewperm() {
		return this.viewperm;
	}

	public void setViewperm(Byte viewperm) {
		this.viewperm = viewperm;
	}

	public String getModerator() {
		return this.moderator;
	}

	public void setModerator(String moderator) {
		this.moderator = moderator;
	}

}