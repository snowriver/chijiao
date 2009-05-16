package com.forbes.hibernate.bean;

/**
 * AbstractUchomeFeed entity provides the base persistence definition of the
 * UchomeFeed entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUchomeFeed implements java.io.Serializable {

	// Fields

	private Integer feedid;
	private Short appid;
	private String icon;
	private Integer uid;
	private String username;
	private Integer dateline;
	private Byte friend;
	private String hashTemplate;
	private String hashData;
	private String titleTemplate;
	private String titleData;
	private String bodyTemplate;
	private String bodyData;
	private String bodyGeneral;
	private String image1;
	private String image1Link;
	private String image2;
	private String image2Link;
	private String image3;
	private String image3Link;
	private String image4;
	private String image4Link;
	private String targetIds;

	// Constructors

	/** default constructor */
	public AbstractUchomeFeed() {
	}

	/** full constructor */
	public AbstractUchomeFeed(Short appid, String icon, Integer uid,
			String username, Integer dateline, Byte friend,
			String hashTemplate, String hashData, String titleTemplate,
			String titleData, String bodyTemplate, String bodyData,
			String bodyGeneral, String image1, String image1Link,
			String image2, String image2Link, String image3, String image3Link,
			String image4, String image4Link, String targetIds) {
		this.appid = appid;
		this.icon = icon;
		this.uid = uid;
		this.username = username;
		this.dateline = dateline;
		this.friend = friend;
		this.hashTemplate = hashTemplate;
		this.hashData = hashData;
		this.titleTemplate = titleTemplate;
		this.titleData = titleData;
		this.bodyTemplate = bodyTemplate;
		this.bodyData = bodyData;
		this.bodyGeneral = bodyGeneral;
		this.image1 = image1;
		this.image1Link = image1Link;
		this.image2 = image2;
		this.image2Link = image2Link;
		this.image3 = image3;
		this.image3Link = image3Link;
		this.image4 = image4;
		this.image4Link = image4Link;
		this.targetIds = targetIds;
	}

	// Property accessors

	public Integer getFeedid() {
		return this.feedid;
	}

	public void setFeedid(Integer feedid) {
		this.feedid = feedid;
	}

	public Short getAppid() {
		return this.appid;
	}

	public void setAppid(Short appid) {
		this.appid = appid;
	}

	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
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

	public Integer getDateline() {
		return this.dateline;
	}

	public void setDateline(Integer dateline) {
		this.dateline = dateline;
	}

	public Byte getFriend() {
		return this.friend;
	}

	public void setFriend(Byte friend) {
		this.friend = friend;
	}

	public String getHashTemplate() {
		return this.hashTemplate;
	}

	public void setHashTemplate(String hashTemplate) {
		this.hashTemplate = hashTemplate;
	}

	public String getHashData() {
		return this.hashData;
	}

	public void setHashData(String hashData) {
		this.hashData = hashData;
	}

	public String getTitleTemplate() {
		return this.titleTemplate;
	}

	public void setTitleTemplate(String titleTemplate) {
		this.titleTemplate = titleTemplate;
	}

	public String getTitleData() {
		return this.titleData;
	}

	public void setTitleData(String titleData) {
		this.titleData = titleData;
	}

	public String getBodyTemplate() {
		return this.bodyTemplate;
	}

	public void setBodyTemplate(String bodyTemplate) {
		this.bodyTemplate = bodyTemplate;
	}

	public String getBodyData() {
		return this.bodyData;
	}

	public void setBodyData(String bodyData) {
		this.bodyData = bodyData;
	}

	public String getBodyGeneral() {
		return this.bodyGeneral;
	}

	public void setBodyGeneral(String bodyGeneral) {
		this.bodyGeneral = bodyGeneral;
	}

	public String getImage1() {
		return this.image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage1Link() {
		return this.image1Link;
	}

	public void setImage1Link(String image1Link) {
		this.image1Link = image1Link;
	}

	public String getImage2() {
		return this.image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage2Link() {
		return this.image2Link;
	}

	public void setImage2Link(String image2Link) {
		this.image2Link = image2Link;
	}

	public String getImage3() {
		return this.image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage3Link() {
		return this.image3Link;
	}

	public void setImage3Link(String image3Link) {
		this.image3Link = image3Link;
	}

	public String getImage4() {
		return this.image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getImage4Link() {
		return this.image4Link;
	}

	public void setImage4Link(String image4Link) {
		this.image4Link = image4Link;
	}

	public String getTargetIds() {
		return this.targetIds;
	}

	public void setTargetIds(String targetIds) {
		this.targetIds = targetIds;
	}

}