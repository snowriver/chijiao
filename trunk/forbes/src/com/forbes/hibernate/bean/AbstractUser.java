package com.forbes.hibernate.bean;

import java.util.Date;

/**
 * AbstractUser entity provides the base persistence definition of the User
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String loginName;
	private String name;
	private String password;
	private String type;
	private String email;
	private Date regTime;
	private String regIp;
	private Date lastLoginTime;
	private String lastLoginIp;
	private String deleteFlag;
	private String active;
	private String image;
	private Integer scores;
	
	private UserDetail userDetail;

	// Constructors

	public UserDetail getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/** default constructor */
	public AbstractUser() {
	}

	/** full constructor */
	public AbstractUser(String loginName, String name, String password, String type, String email, Date regTime, String regIp,
			Date lastLoginTime, String lastLoginIp, String deleteFlag,String active, String image) {
		this.loginName = loginName;
		this.name = name;
		this.password = password;
		this.type = type;
		this.email = email;
		this.regTime = regTime;
		this.regIp = regIp;
		this.lastLoginTime = lastLoginTime;
		this.lastLoginIp = lastLoginIp;
		this.deleteFlag = deleteFlag;
		this.active = active;
		this.image = image;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getRegTime() {
		return this.regTime;
	}

	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}

	public String getRegIp() {
		return this.regIp;
	}

	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}

	public Date getLastLoginTime() {
		return this.lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getLastLoginIp() {
		return this.lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getScores() {
		return scores;
	}

	public void setScores(Integer scores) {
		this.scores = scores;
	}

}