package com.forbes.hibernate.bean;

/**
 * AbstractUcAdmins entity provides the base persistence definition of the
 * UcAdmins entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUcAdmins implements java.io.Serializable {

	// Fields

	private Integer uid;
	private String username;
	private Byte allowadminsetting;
	private Byte allowadminapp;
	private Byte allowadminuser;
	private Byte allowadminbadword;
	private Byte allowadmintag;
	private Byte allowadminpm;
	private Byte allowadmincredits;
	private Byte allowadmindomain;
	private Byte allowadmindb;
	private Byte allowadminnote;
	private Byte allowadmincache;
	private Byte allowadminlog;

	// Constructors

	/** default constructor */
	public AbstractUcAdmins() {
	}

	/** full constructor */
	public AbstractUcAdmins(String username, Byte allowadminsetting,
			Byte allowadminapp, Byte allowadminuser, Byte allowadminbadword,
			Byte allowadmintag, Byte allowadminpm, Byte allowadmincredits,
			Byte allowadmindomain, Byte allowadmindb, Byte allowadminnote,
			Byte allowadmincache, Byte allowadminlog) {
		this.username = username;
		this.allowadminsetting = allowadminsetting;
		this.allowadminapp = allowadminapp;
		this.allowadminuser = allowadminuser;
		this.allowadminbadword = allowadminbadword;
		this.allowadmintag = allowadmintag;
		this.allowadminpm = allowadminpm;
		this.allowadmincredits = allowadmincredits;
		this.allowadmindomain = allowadmindomain;
		this.allowadmindb = allowadmindb;
		this.allowadminnote = allowadminnote;
		this.allowadmincache = allowadmincache;
		this.allowadminlog = allowadminlog;
	}

	// Property accessors

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

	public Byte getAllowadminsetting() {
		return this.allowadminsetting;
	}

	public void setAllowadminsetting(Byte allowadminsetting) {
		this.allowadminsetting = allowadminsetting;
	}

	public Byte getAllowadminapp() {
		return this.allowadminapp;
	}

	public void setAllowadminapp(Byte allowadminapp) {
		this.allowadminapp = allowadminapp;
	}

	public Byte getAllowadminuser() {
		return this.allowadminuser;
	}

	public void setAllowadminuser(Byte allowadminuser) {
		this.allowadminuser = allowadminuser;
	}

	public Byte getAllowadminbadword() {
		return this.allowadminbadword;
	}

	public void setAllowadminbadword(Byte allowadminbadword) {
		this.allowadminbadword = allowadminbadword;
	}

	public Byte getAllowadmintag() {
		return this.allowadmintag;
	}

	public void setAllowadmintag(Byte allowadmintag) {
		this.allowadmintag = allowadmintag;
	}

	public Byte getAllowadminpm() {
		return this.allowadminpm;
	}

	public void setAllowadminpm(Byte allowadminpm) {
		this.allowadminpm = allowadminpm;
	}

	public Byte getAllowadmincredits() {
		return this.allowadmincredits;
	}

	public void setAllowadmincredits(Byte allowadmincredits) {
		this.allowadmincredits = allowadmincredits;
	}

	public Byte getAllowadmindomain() {
		return this.allowadmindomain;
	}

	public void setAllowadmindomain(Byte allowadmindomain) {
		this.allowadmindomain = allowadmindomain;
	}

	public Byte getAllowadmindb() {
		return this.allowadmindb;
	}

	public void setAllowadmindb(Byte allowadmindb) {
		this.allowadmindb = allowadmindb;
	}

	public Byte getAllowadminnote() {
		return this.allowadminnote;
	}

	public void setAllowadminnote(Byte allowadminnote) {
		this.allowadminnote = allowadminnote;
	}

	public Byte getAllowadmincache() {
		return this.allowadmincache;
	}

	public void setAllowadmincache(Byte allowadmincache) {
		this.allowadmincache = allowadmincache;
	}

	public Byte getAllowadminlog() {
		return this.allowadminlog;
	}

	public void setAllowadminlog(Byte allowadminlog) {
		this.allowadminlog = allowadminlog;
	}

}