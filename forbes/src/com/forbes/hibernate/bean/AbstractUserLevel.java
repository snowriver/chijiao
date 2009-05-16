package com.forbes.hibernate.bean;

/**
 * AbstractUserLevel entity provides the base persistence definition of the
 * UserLevel entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserLevel implements java.io.Serializable {

	// Fields

	private Short id;
	private Short level;
	private Integer startScore;
	private Integer endScore;
	private String title;

	// Constructors

	/** default constructor */
	public AbstractUserLevel() {
	}

	/** full constructor */
	public AbstractUserLevel(Short level, Integer startScore,
			Integer endScore, String title) {
		this.level = level;
		this.startScore = startScore;
		this.endScore = endScore;
		this.title = title;
	}

	// Property accessors

	public Short getId() {
		return this.id;
	}

	public void setId(Short id) {
		this.id = id;
	}

	public Short getLevel() {
		return this.level;
	}

	public void setLevel(Short level) {
		this.level = level;
	}

	public Integer getStartScore() {
		return this.startScore;
	}

	public void setStartScore(Integer startScore) {
		this.startScore = startScore;
	}

	public Integer getEndScore() {
		return this.endScore;
	}

	public void setEndScore(Integer endScore) {
		this.endScore = endScore;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}