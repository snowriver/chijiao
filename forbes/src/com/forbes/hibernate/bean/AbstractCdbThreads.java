package com.forbes.hibernate.bean;

/**
 * AbstractCdbThreads entity provides the base persistence definition of the
 * CdbThreads entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractCdbThreads implements java.io.Serializable {

	// Fields

	private Integer tid;
	private Short fid;
	private Short iconid;
	private Short typeid;
	private Short sortid;
	private Short readperm;
	private Short price;
	private String author;
	private Integer authorid;
	private String subject;
	private Integer dateline;
	private Integer lastpost;
	private String lastposter;
	private Integer views;
	private Integer replies;
	private Byte displayorder;
	private Byte highlight;
	private Byte digest;
	private Byte rate;
	private Byte special;
	private Byte attachment;
	private Byte subscribed;
	private Byte moderated;
	private Integer closed;
	private Integer itemid;
	private Byte supePushstatus;

	// Constructors

	/** default constructor */
	public AbstractCdbThreads() {
	}

	/** full constructor */
	public AbstractCdbThreads(Short fid, Short iconid, Short typeid,
			Short sortid, Short readperm, Short price, String author,
			Integer authorid, String subject, Integer dateline,
			Integer lastpost, String lastposter, Integer views,
			Integer replies, Byte displayorder, Byte highlight, Byte digest,
			Byte rate, Byte special, Byte attachment, Byte subscribed,
			Byte moderated, Integer closed, Integer itemid, Byte supePushstatus) {
		this.fid = fid;
		this.iconid = iconid;
		this.typeid = typeid;
		this.sortid = sortid;
		this.readperm = readperm;
		this.price = price;
		this.author = author;
		this.authorid = authorid;
		this.subject = subject;
		this.dateline = dateline;
		this.lastpost = lastpost;
		this.lastposter = lastposter;
		this.views = views;
		this.replies = replies;
		this.displayorder = displayorder;
		this.highlight = highlight;
		this.digest = digest;
		this.rate = rate;
		this.special = special;
		this.attachment = attachment;
		this.subscribed = subscribed;
		this.moderated = moderated;
		this.closed = closed;
		this.itemid = itemid;
		this.supePushstatus = supePushstatus;
	}

	// Property accessors

	public Integer getTid() {
		return this.tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public Short getFid() {
		return this.fid;
	}

	public void setFid(Short fid) {
		this.fid = fid;
	}

	public Short getIconid() {
		return this.iconid;
	}

	public void setIconid(Short iconid) {
		this.iconid = iconid;
	}

	public Short getTypeid() {
		return this.typeid;
	}

	public void setTypeid(Short typeid) {
		this.typeid = typeid;
	}

	public Short getSortid() {
		return this.sortid;
	}

	public void setSortid(Short sortid) {
		this.sortid = sortid;
	}

	public Short getReadperm() {
		return this.readperm;
	}

	public void setReadperm(Short readperm) {
		this.readperm = readperm;
	}

	public Short getPrice() {
		return this.price;
	}

	public void setPrice(Short price) {
		this.price = price;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Integer getAuthorid() {
		return this.authorid;
	}

	public void setAuthorid(Integer authorid) {
		this.authorid = authorid;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Integer getDateline() {
		return this.dateline;
	}

	public void setDateline(Integer dateline) {
		this.dateline = dateline;
	}

	public Integer getLastpost() {
		return this.lastpost;
	}

	public void setLastpost(Integer lastpost) {
		this.lastpost = lastpost;
	}

	public String getLastposter() {
		return this.lastposter;
	}

	public void setLastposter(String lastposter) {
		this.lastposter = lastposter;
	}

	public Integer getViews() {
		return this.views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public Integer getReplies() {
		return this.replies;
	}

	public void setReplies(Integer replies) {
		this.replies = replies;
	}

	public Byte getDisplayorder() {
		return this.displayorder;
	}

	public void setDisplayorder(Byte displayorder) {
		this.displayorder = displayorder;
	}

	public Byte getHighlight() {
		return this.highlight;
	}

	public void setHighlight(Byte highlight) {
		this.highlight = highlight;
	}

	public Byte getDigest() {
		return this.digest;
	}

	public void setDigest(Byte digest) {
		this.digest = digest;
	}

	public Byte getRate() {
		return this.rate;
	}

	public void setRate(Byte rate) {
		this.rate = rate;
	}

	public Byte getSpecial() {
		return this.special;
	}

	public void setSpecial(Byte special) {
		this.special = special;
	}

	public Byte getAttachment() {
		return this.attachment;
	}

	public void setAttachment(Byte attachment) {
		this.attachment = attachment;
	}

	public Byte getSubscribed() {
		return this.subscribed;
	}

	public void setSubscribed(Byte subscribed) {
		this.subscribed = subscribed;
	}

	public Byte getModerated() {
		return this.moderated;
	}

	public void setModerated(Byte moderated) {
		this.moderated = moderated;
	}

	public Integer getClosed() {
		return this.closed;
	}

	public void setClosed(Integer closed) {
		this.closed = closed;
	}

	public Integer getItemid() {
		return this.itemid;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}

	public Byte getSupePushstatus() {
		return this.supePushstatus;
	}

	public void setSupePushstatus(Byte supePushstatus) {
		this.supePushstatus = supePushstatus;
	}

}