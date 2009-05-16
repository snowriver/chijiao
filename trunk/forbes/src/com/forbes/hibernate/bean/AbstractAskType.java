package com.forbes.hibernate.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractCity entity provides the base persistence definition of the City
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractAskType implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer pid;
	private String name;
	private Integer disorder;
	private String issend;
	private String description;
	private String keywords;
	
	//private Integer askCnt;
	
	private Set askTypes = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractAskType() {
	}

	/** full constructor */
	public AbstractAskType(Integer pid, String name, Integer disorder, String issend, String description, String keywords ) {
		this.pid = pid;
		this.name = name;
		this.disorder = disorder;
		this.issend = issend;
		this.description = description;
		this.keywords = keywords;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getDisorder() {
		return this.disorder;
	}

	public void setDisorder(Integer disorder) {
		this.disorder = disorder;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Set getAskTypes() {
		return askTypes;
	}

	public void setAskTypes(Set askTypes) {
		this.askTypes = askTypes;
	}

	public String getIssend() {
		return issend;
	}

	public void setIssend(String issend) {
		this.issend = issend;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	
	

}