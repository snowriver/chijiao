package com.forbes.hibernate.bean;

/**
 * AbstractSysConfig entity provides the base persistence definition of the
 * SysConfig entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractSysConfig implements java.io.Serializable {

	// Fields

	private String varname;
	private Integer id;
	private String info;
	private String value;
	private String type;
	private Integer group;

	// Constructors

	/** default constructor */
	public AbstractSysConfig() {
	}

	/** minimal constructor */
	public AbstractSysConfig(Integer id, Integer group) {
		this.id = id;
		this.group = group;
	}

	/** full constructor */
	public AbstractSysConfig(Integer id, String info, String value,
			String type, Integer group) {
		this.id = id;
		this.info = info;
		this.value = value;
		this.type = type;
		this.group = group;
	}

	// Property accessors

	

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getInfo() {
		return this.info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getGroup() {
		return this.group;
	}

	public void setGroup(Integer group) {
		this.group = group;
	}

	public String getVarname() {
		return varname;
	}

	public void setVarname(String varname) {
		this.varname = varname;
	}

}