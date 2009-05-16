package com.forbes.hibernate.bean;

/**
 * AbstractUchomeBlog entity provides the base persistence definition of the
 * UchomeBlog entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUchomeBlog implements java.io.Serializable {

	// Fields

	private Integer blogid;
	private Integer uid;
	private String username;
	private String subject;
	private Short classid;
	private Integer viewnum;
	private Integer replynum;
	private Integer tracenum;
	private Integer dateline;
	private String pic;
	private Byte picflag;
	private Byte noreply;
	private Byte friend;
	private String password;

	// Constructors

	/** default constructor */
	public AbstractUchomeBlog() {
	}

	/** full constructor */
	public AbstractUchomeBlog(Integer uid, String username, String subject,
			Short classid, Integer viewnum, Integer replynum, Integer tracenum,
			Integer dateline, String pic, Byte picflag, Byte noreply,
			Byte friend, String password) {
		this.uid = uid;
		this.username = username;
		this.subject = subject;
		this.classid = classid;
		this.viewnum = viewnum;
		this.replynum = replynum;
		this.tracenum = tracenum;
		this.dateline = dateline;
		this.pic = pic;
		this.picflag = picflag;
		this.noreply = noreply;
		this.friend = friend;
		this.password = password;
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

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Short getClassid() {
		return this.classid;
	}

	public void setClassid(Short classid) {
		this.classid = classid;
	}

	public Integer getViewnum() {
		return this.viewnum;
	}

	public void setViewnum(Integer viewnum) {
		this.viewnum = viewnum;
	}

	public Integer getReplynum() {
		return this.replynum;
	}

	public void setReplynum(Integer replynum) {
		this.replynum = replynum;
	}

	public Integer getTracenum() {
		return this.tracenum;
	}

	public void setTracenum(Integer tracenum) {
		this.tracenum = tracenum;
	}

	public Integer getDateline() {
		return this.dateline;
	}

	public void setDateline(Integer dateline) {
		this.dateline = dateline;
	}

	public String getPic() {
		return this.pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public Byte getPicflag() {
		return this.picflag;
	}

	public void setPicflag(Byte picflag) {
		this.picflag = picflag;
	}

	public Byte getNoreply() {
		return this.noreply;
	}

	public void setNoreply(Byte noreply) {
		this.noreply = noreply;
	}

	public Byte getFriend() {
		return this.friend;
	}

	public void setFriend(Byte friend) {
		this.friend = friend;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}