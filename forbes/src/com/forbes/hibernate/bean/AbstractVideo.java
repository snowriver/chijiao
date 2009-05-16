package com.forbes.hibernate.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import com.forbes.hibernate.bean.User;



/**
 * AbstractArticle entity provides the base persistence definition of the
 * Article entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractVideo implements java.io.Serializable {

	// Fields

	private Integer id;
	private UcMembers user;
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
	private String content;
	private String description;
	private String keywords;
	private Integer digg;
	private Date diggtime;
	private String isdelete;
	private Date lastpost;
	private String litpic;
	private Short litpictype;
	private Date sortrank;
	private String color;
	private Short videorank;

	// Constructors
	private VideoType videoType;
	private VideoType videoType2;
	
	private VideoUrl firstVideoUrl;

	private Set videoUrls = new HashSet(0); 

	public VideoType getVideoType() {
		return videoType;
	}

	public void setVideoType(VideoType videoType) {
		this.videoType = videoType;
	}

	public VideoType getVideoType2() {
		return videoType2;
	}

	public void setVideoType2(VideoType videoType2) {
		this.videoType2 = videoType2;
	}

	/** default constructor */
	public AbstractVideo() {
	}

	/** full constructor */
	public AbstractVideo(UcMembers user, String userip, String likeid, Short iscommend, Short isverify,
			Integer click, String title, String shorttitle, String writer,
			String source, Date pubdate, Date senddate, String description,
			String keywords, Integer digg, Date diggtime, String isdelete,
			Date lastpost, String litpic, Short litpictype, Date sortrank, String color,
			Short videorank, String content ) {
		this.user = user;
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
		this.litpictype = litpictype;
		this.sortrank = sortrank;
		this.color = color;
		this.videorank = videorank;
		this.content = content;
		
		/*this.width = width;
		this.height = height;
		this.videourl = videourl;
		this.fromweb = fromweb;*/
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}



	

	public UcMembers getUser() {
		return user;
	}

	public void setUser(UcMembers user) {
		this.user = user;
	}

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


	public Short getVideorank() {
		return videorank;
	}

	public void setVideorank(Short videorank) {
		this.videorank = videorank;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	/*public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public String getVideourl() {
		return videourl;
	}

	public void setVideourl(String videourl) {
		this.videourl = videourl;
	}

	public String getFromweb() {
		return fromweb;
	}

	public void setFromweb(String fromweb) {
		this.fromweb = fromweb;
	}*/

	public Set getVideoUrls() {
		return videoUrls;
	}

	public void setVideoUrls(Set videoUrls) {
		this.videoUrls = videoUrls;
	}

	public Short getLitpictype() {
		return litpictype;
	}

	public void setLitpictype(Short litpictype) {
		this.litpictype = litpictype;
	}

	public VideoUrl getFirstVideoUrl() {
		if ( !videoUrls.isEmpty() ) {
			List <VideoUrl> urls = new ArrayList(this.getVideoUrls());
			return urls.get(0);
		}
		else return null;
	}

	public void setFirstVideoUrl(VideoUrl firstVideoUrl) {
		if ( !videoUrls.isEmpty() ) {
			List <VideoUrl> urls = new ArrayList(this.getVideoUrls());
			this.firstVideoUrl = urls.get(0);
		}
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	


}