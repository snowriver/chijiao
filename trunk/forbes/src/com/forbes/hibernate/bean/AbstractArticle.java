package com.forbes.hibernate.bean;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.forbes.hibernate.bean.ArticleType;
import com.forbes.hibernate.bean.User;

/**
 * AbstractArticle entity provides the base persistence definition of the
 * Article entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractArticle implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userid;
	private String username;
	private String userip;
	private String likeid;
	private Short iscommend;
	private Short isverify;
	private Integer click;
	private String title;
	private String shorttitle;
	private String writer;
	private String source;
	private Date pubdate;
	private Date senddate;
	//private String content;
	private String description;
	private String keywords;
	private Integer digg;
	private Date diggtime;
	private String isdelete;
	private Date lastpost;
	private String litpic;
	private Date sortrank;
	private String color;
	private Short arcrank;
	private Integer commentCnt;
	private Short isbuild;
	
	private String pubdateString;

	// Constructors
	private ArticleType articleType;
	private ArticleType articleType2;

	private ArticleContent articleContent;
	
	public String getPubdateString() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		return sdf.format(pubdate);
	}

	public ArticleType getArticleType() {
		return articleType;
	}

	public void setArticleType(ArticleType articleType) {
		this.articleType = articleType;
	}

	public ArticleType getArticleType2() {
		return articleType2;
	}

	public void setArticleType2(ArticleType articleType2) {
		this.articleType2 = articleType2;
	}

	/** default constructor */
	public AbstractArticle() {
	}

	/** full constructor */
	public AbstractArticle(Integer userid, String userip, String likeid, Short iscommend, Short isverify,
			Integer click, String title, String shorttitle, String writer,
			String source, Date pubdate, Date senddate, String description,
			String keywords, Integer digg, Date diggtime, String isdelete,
			Date lastpost, String litpic, Date sortrank, String color,
			Short arcrank) {
		this.userid = userid;
		this.userip = userip;
		this.likeid = likeid;
		this.iscommend = iscommend;
		this.isverify = isverify;
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
		this.lastpost = lastpost;
		this.litpic = litpic;
		this.sortrank = sortrank;
		this.color = color;
		this.arcrank = arcrank;
		//this.content = content;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/*public UcMembers getUser() {
		return user;
	}

	public void setUser(UcMembers user) {
		this.user = user;
	}*/

	public String getUserip() {
		return this.userip;
	}

	public void setUserip(String userip) {
		this.userip = userip;
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

	public Short getIsverify() {
		return this.isverify;
	}

	public void setIsverify(Short isverify) {
		this.isverify = isverify;
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

	public Date getLastpost() {
		return this.lastpost;
	}

	public void setLastpost(Date lastpost) {
		this.lastpost = lastpost;
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

	/*public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}*/

	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public ArticleContent getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(ArticleContent articleContent) {
		this.articleContent = articleContent;
	}

	public Integer getCommentCnt() {
		return commentCnt;
	}

	public void setCommentCnt(Integer commentCnt) {
		this.commentCnt = commentCnt;
	}

	public Short getIsbuild() {
		return isbuild;
	}

	public void setIsbuild(Short isbuild) {
		this.isbuild = isbuild;
	}

}