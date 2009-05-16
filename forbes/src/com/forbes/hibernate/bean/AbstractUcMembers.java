package com.forbes.hibernate.bean;

/**
 * AbstractUcMembers entity provides the base persistence definition of the
 * UcMembers entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUcMembers implements java.io.Serializable {

	// Fields

	private Integer uid;
	private String username;
	private String password;
	private String email;
	private String myid;
	private String myidkey;
	private String regip;
	private Integer regdate;
	private Integer lastloginip;
	private Integer lastlogintime;
	private String salt;
	private String secques;

	private UserDetail userDetail;
	// Constructors

	/** default constructor */
	public AbstractUcMembers() {
	}

	
	/** full constructor */
	public AbstractUcMembers(String username, String password, String email,
			String myid, String myidkey, String regip, Integer regdate,
			Integer lastloginip, Integer lastlogintime, String salt,
			String secques) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.myid = myid;
		this.myidkey = myidkey;
		this.regip = regip;
		this.regdate = regdate;
		this.lastloginip = lastloginip;
		this.lastlogintime = lastlogintime;
		this.salt = salt;
		this.secques = secques;
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

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMyid() {
		return this.myid;
	}

	public void setMyid(String myid) {
		this.myid = myid;
	}

	public String getMyidkey() {
		return this.myidkey;
	}

	public void setMyidkey(String myidkey) {
		this.myidkey = myidkey;
	}

	public String getRegip() {
		return this.regip;
	}

	public void setRegip(String regip) {
		this.regip = regip;
	}

	public Integer getRegdate() {
		return this.regdate;
	}

	public void setRegdate(Integer regdate) {
		this.regdate = regdate;
	}

	public Integer getLastloginip() {
		return this.lastloginip;
	}

	public void setLastloginip(Integer lastloginip) {
		this.lastloginip = lastloginip;
	}

	public Integer getLastlogintime() {
		return this.lastlogintime;
	}

	public void setLastlogintime(Integer lastlogintime) {
		this.lastlogintime = lastlogintime;
	}

	public String getSalt() {
		return this.salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getSecques() {
		return this.secques;
	}

	public void setSecques(String secques) {
		this.secques = secques;
	}


	public UserDetail getUserDetail() {
		return userDetail;
	}


	public void setUserDetail(UserDetail userDetail) {
		this.userDetail = userDetail;
	}

}