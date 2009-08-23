package com.forbes.hibernate.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * AbstractNews entity provides the base persistence definition of the News
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractNews implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userid;
	private String likeid;
	private Short iscommend;
	private Integer click;
	private String title;
	private String shorttitle;
	private String writer;
	private String source;
	private Date pubdate;
	private Date senddate;
	private String description;
	private String keywords;
	private Integer digg;
	private Date diggtime;
	private String isdelete;
	private String litpic;
	private Date sortrank;
	private String color;
	private Short arcrank;
	private String content;
	private Integer commentCnt;

	private String pubdateString;
	
	public String getPubdateString() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		return sdf.format(pubdate);
	}
	// Constructors

	

	/** default constructor */
	public AbstractNews() {
	}

	/** full constructor */
	public AbstractNews(Integer userid, String likeid, Short iscommend,
			Integer click, String title, String shorttitle, String writer,
			String source, Date pubdate, Date senddate, String description,
			String keywords, Integer digg, Date diggtime, String isdelete,
			String litpic, Date sortrank, String color, Short arcrank,
			String content) {
		this.userid = userid;
		this.likeid = likeid;
		this.iscommend = iscommend;
		this.click = click;
		this.title = title;
		this.shorttitle = shorttitle;
		this.writer = writer;
		this.source = source;
		this.pubdate = pubdate;
		this.senddate = senddate;
		this.description = description;
		this.keywords = keywords;
		this.digg = digg;
		this.diggtime = diggtime;
		this.isdelete = isdelete;
		this.litpic = litpic;
		this.sortrank = sortrank;
		this.color = color;
		this.arcrank = arcrank;
		this.content = content;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getLikeid() {
		return this.likeid;
	}

	public void setLikeid(String likeid) {
		this.likeid = likeid;
	}

	public Short getIscommend() {
		return this.iscommend;
	}

	public void setIscommend(Short iscommend) {
		this.iscommend = iscommend;
	}

	public Integer getClick() {
		return this.click;
	}

	public void setClick(Integer click) {
		this.click = click;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getShorttitle() {
		return this.shorttitle;
	}

	public void setShorttitle(String shorttitle) {
		this.shorttitle = shorttitle;
	}

	public String getWriter() {
		return this.writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSource() {
		return this.source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Date getPubdate() {
		return this.pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public Date getSenddate() {
		return this.senddate;
	}

	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKeywords() {
		return this.keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Integer getDigg() {
		return this.digg;
	}

	public void setDigg(Integer digg) {
		this.digg = digg;
	}

	public Date getDiggtime() {
		return this.diggtime;
	}

	public void setDiggtime(Date diggtime) {
		this.diggtime = diggtime;
	}

	public String getIsdelete() {
		return this.isdelete;
	}

	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}

	public String getLitpic() {
		return this.litpic;
	}

	public void setLitpic(String litpic) {
		this.litpic = litpic;
	}

	public Date getSortrank() {
		return this.sortrank;
	}

	public void setSortrank(Date sortrank) {
		this.sortrank = sortrank;
	}

	public String getColor() {
		return this.color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Short getArcrank() {
		return this.arcrank;
	}

	public void setArcrank(Short arcrank) {
		this.arcrank = arcrank;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}



	public Integer getCommentCnt() {
		return commentCnt;
	}



	public void setCommentCnt(Integer commentCnt) {
		this.commentCnt = commentCnt;
	}

}