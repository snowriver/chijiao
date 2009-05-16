package com.forbes.hibernate.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractCity entity provides the base persistence definition of the City
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractCity implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer pid;
	private String name;
	private Integer disorder;
	
	private Set citys = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractCity() {
	}

	/** full constructor */
	public AbstractCity(Integer pid, String name, Integer disorder) {
		this.pid = pid;
		this.name = name;
		this.disorder = disorder;
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

	public Set getCitys() {
		return citys;
	}

	public void setCitys(Set citys) {
		this.citys = citys;
	}

}