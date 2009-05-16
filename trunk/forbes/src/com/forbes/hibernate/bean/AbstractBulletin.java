package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractBulletin entity provides the base persistence definition of the
 * Bulletin entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractBulletin implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer click;
	private String title;
	private Date pubdate;
	private Date deadline;
	private String color;
	private Short rank;
	private String content;

	// Constructors

	/** default constructor */
	public AbstractBulletin() {
	}

	/** full constructor */
	public AbstractBulletin(Integer click, String title, Date pubdate,
			Date deadline, String color, Short rank, String content) {
		this.click = click;
		this.title = title;
		this.pubdate = pubdate;
		this.deadline = deadline;
		this.color = color;
		this.rank = rank;
		this.content = content;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Date getPubdate() {
		return this.pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public Date getDeadline() {
		return this.deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public String getColor() {
		return this.color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Short getRank() {
		return this.rank;
	}

	public void setRank(Short rank) {
		this.rank = rank;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}