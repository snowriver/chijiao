package com.forbes.hibernate.bean;

/**
 * AbstractVideoUrl entity provides the base persistence definition of the
 * VideoUrl entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractVideoUrl implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String url;

	private Integer width;
	private Integer height;
	private String fromweb;

	private String litpic;
	private Short litpictype;

	private Video video;

	// Constructors

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	/** default constructor */
	public AbstractVideoUrl() {
	}

	/** full constructor */
	public AbstractVideoUrl(String title, String url, Integer width,
			Integer height, String fromweb, Short litpictype, String litpic) {
		this.title = title;
		this.url = url;

		this.width = width;
		this.height = height;
		this.fromweb = fromweb;
		
		this.litpictype = litpictype;
		this.litpic = litpic;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getWidth() {
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

	public String getFromweb() {
		return fromweb;
	}

	public void setFromweb(String fromweb) {
		this.fromweb = fromweb;
	}

	public String getLitpic() {
		return litpic;
	}

	public void setLitpic(String litpic) {
		this.litpic = litpic;
	}

	public Short getLitpictype() {
		return litpictype;
	}

	public void setLitpictype(Short litpictype) {
		this.litpictype = litpictype;
	}

}