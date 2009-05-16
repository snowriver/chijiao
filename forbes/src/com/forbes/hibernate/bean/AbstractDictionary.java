package com.forbes.hibernate.bean;

/**
 * AbstractDictionary entity provides the base persistence definition of the
 * Dictionary entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractDictionary implements java.io.Serializable {

	// Fields

	private Integer id;
	private String dgroup;
	private Short dindex;
	private String dkey;
	private Short dvalue;
	private String dvalueDescCh;

	// Constructors

	/** default constructor */
	public AbstractDictionary() {
	}

	/** full constructor */
	public AbstractDictionary(String dgroup, Short dindex, String dkey,
			Short dvalue, String dvalueDescCh) {
		this.dgroup = dgroup;
		this.dindex = dindex;
		this.dkey = dkey;
		this.dvalue = dvalue;
		this.dvalueDescCh = dvalueDescCh;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDgroup() {
		return this.dgroup;
	}

	public void setDgroup(String dgroup) {
		this.dgroup = dgroup;
	}

	public Short getDindex() {
		return this.dindex;
	}

	public void setDindex(Short dindex) {
		this.dindex = dindex;
	}

	public String getDkey() {
		return this.dkey;
	}

	public void setDkey(String dkey) {
		this.dkey = dkey;
	}

	public Short getDvalue() {
		return this.dvalue;
	}

	public void setDvalue(Short dvalue) {
		this.dvalue = dvalue;
	}

	public String getDvalueDescCh() {
		return this.dvalueDescCh;
	}

	public void setDvalueDescCh(String dvalueDescCh) {
		this.dvalueDescCh = dvalueDescCh;
	}

}