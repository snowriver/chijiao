package com.forbes.hibernate.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractUserDetail entity provides the base persistence definition of the
 * UserDetail entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserDetail implements java.io.Serializable {

	// Fields

	private Integer id;
	private String sex;
	private String sexLock;
	private String email;
	private String emailLock;
	private String qq;
	private String qqLock;
	private String msn;
	private String msnLock;
	private Integer scores;
	private String birthType;
	private String birthLock;
	private Short birthYear;
	private Short birthMonth;
	private Short birthDay;
	private String homeLock;
	private Integer homeProvinceId;
	private String homeProvinceName;
	private Integer homeCityId;
	private String homeCityName;
	private Integer homeDistrictId;
	private String homeDistrictName;
	private String liveLock;
	private Integer liveProvinceId;
	private String liveProvinceName;
	private Integer liveCityId;
	private String liveCityName;
	private Integer liveDistrictId;
	private String liveDistrictName;
	private String phone;
	private String phoneLock;
	private String mobile;
	private String mobileLock;
	private Integer calling;
	private String callingLock;
	private Integer work;
	private String workLock;
	private String description;
	//private User user;
	
	private Short userLevel;

	// Constructors

	/** default constructor */
	public AbstractUserDetail() {
	}

	/** full constructor */
	public AbstractUserDetail(String sex, String sexLock, String email,
			String emailLock, String qq, String qqLock, String msn,
			String msnLock, Integer scores, String birthType,
			String birthLock, Short birthYear, Short birthMonth,
			Short birthDay, String homeLock, Integer homeProvinceId,
			String homeProvinceName, Integer homeCityId, String homeCityName,
			Integer homeDistrictId, String homeDistrictName, String liveLock,
			Integer liveProvinceId, String liveProvinceName,
			Integer liveCityId, String liveCityName, Integer liveDistrictId,
			String liveDistrictName, String phone, String phoneLock,
			String mobile, String mobileLock, Integer calling,
			String callingLock, Integer work, String workLock,
			String description/*, User user*/) {
		this.sex = sex;
		this.sexLock = sexLock;
		this.email = email;
		this.emailLock = emailLock;
		this.qq = qq;
		this.qqLock = qqLock;
		this.msn = msn;
		this.msnLock = msnLock;
		this.scores = scores;
		this.birthType = birthType;
		this.birthLock = birthLock;
		this.birthYear = birthYear;
		this.birthMonth = birthMonth;
		this.birthDay = birthDay;
		this.homeLock = homeLock;
		this.homeProvinceId = homeProvinceId;
		this.homeProvinceName = homeProvinceName;
		this.homeCityId = homeCityId;
		this.homeCityName = homeCityName;
		this.homeDistrictId = homeDistrictId;
		this.homeDistrictName = homeDistrictName;
		this.liveLock = liveLock;
		this.liveProvinceId = liveProvinceId;
		this.liveProvinceName = liveProvinceName;
		this.liveCityId = liveCityId;
		this.liveCityName = liveCityName;
		this.liveDistrictId = liveDistrictId;
		this.liveDistrictName = liveDistrictName;
		this.phone = phone;
		this.phoneLock = phoneLock;
		this.mobile = mobile;
		this.mobileLock = mobileLock;
		this.calling = calling;
		this.callingLock = callingLock;
		this.work = work;
		this.workLock = workLock;
		this.description = description;
		//this.user = user;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSexLock() {
		return this.sexLock;
	}

	public void setSexLock(String sexLock) {
		this.sexLock = sexLock;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailLock() {
		return this.emailLock;
	}

	public void setEmailLock(String emailLock) {
		this.emailLock = emailLock;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getQqLock() {
		return this.qqLock;
	}

	public void setQqLock(String qqLock) {
		this.qqLock = qqLock;
	}

	public String getMsn() {
		return this.msn;
	}

	public void setMsn(String msn) {
		this.msn = msn;
	}

	public String getMsnLock() {
		return this.msnLock;
	}

	public void setMsnLock(String msnLock) {
		this.msnLock = msnLock;
	}

	public Integer getScores() {
		return this.scores;
	}

	public void setScores(Integer scores) {
		this.scores = scores;
	}

	public String getBirthType() {
		return this.birthType;
	}

	public void setBirthType(String birthType) {
		this.birthType = birthType;
	}

	public String getBirthLock() {
		return this.birthLock;
	}

	public void setBirthLock(String birthLock) {
		this.birthLock = birthLock;
	}

	public Short getBirthYear() {
		return this.birthYear;
	}

	public void setBirthYear(Short birthYear) {
		this.birthYear = birthYear;
	}

	public Short getBirthMonth() {
		return this.birthMonth;
	}

	public void setBirthMonth(Short birthMonth) {
		this.birthMonth = birthMonth;
	}

	public Short getBirthDay() {
		return this.birthDay;
	}

	public void setBirthDay(Short birthDay) {
		this.birthDay = birthDay;
	}

	public String getHomeLock() {
		return this.homeLock;
	}

	public void setHomeLock(String homeLock) {
		this.homeLock = homeLock;
	}

	public Integer getHomeProvinceId() {
		return this.homeProvinceId;
	}

	public void setHomeProvinceId(Integer homeProvinceId) {
		this.homeProvinceId = homeProvinceId;
	}

	public String getHomeProvinceName() {
		return this.homeProvinceName;
	}

	public void setHomeProvinceName(String homeProvinceName) {
		this.homeProvinceName = homeProvinceName;
	}

	public Integer getHomeCityId() {
		return this.homeCityId;
	}

	public void setHomeCityId(Integer homeCityId) {
		this.homeCityId = homeCityId;
	}

	public String getHomeCityName() {
		return this.homeCityName;
	}

	public void setHomeCityName(String homeCityName) {
		this.homeCityName = homeCityName;
	}

	public Integer getHomeDistrictId() {
		return this.homeDistrictId;
	}

	public void setHomeDistrictId(Integer homeDistrictId) {
		this.homeDistrictId = homeDistrictId;
	}

	public String getHomeDistrictName() {
		return this.homeDistrictName;
	}

	public void setHomeDistrictName(String homeDistrictName) {
		this.homeDistrictName = homeDistrictName;
	}

	public String getLiveLock() {
		return this.liveLock;
	}

	public void setLiveLock(String liveLock) {
		this.liveLock = liveLock;
	}

	public Integer getLiveProvinceId() {
		return this.liveProvinceId;
	}

	public void setLiveProvinceId(Integer liveProvinceId) {
		this.liveProvinceId = liveProvinceId;
	}

	public String getLiveProvinceName() {
		return this.liveProvinceName;
	}

	public void setLiveProvinceName(String liveProvinceName) {
		this.liveProvinceName = liveProvinceName;
	}

	public Integer getLiveCityId() {
		return this.liveCityId;
	}

	public void setLiveCityId(Integer liveCityId) {
		this.liveCityId = liveCityId;
	}

	public String getLiveCityName() {
		return this.liveCityName;
	}

	public void setLiveCityName(String liveCityName) {
		this.liveCityName = liveCityName;
	}

	public Integer getLiveDistrictId() {
		return this.liveDistrictId;
	}

	public void setLiveDistrictId(Integer liveDistrictId) {
		this.liveDistrictId = liveDistrictId;
	}

	public String getLiveDistrictName() {
		return this.liveDistrictName;
	}

	public void setLiveDistrictName(String liveDistrictName) {
		this.liveDistrictName = liveDistrictName;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhoneLock() {
		return this.phoneLock;
	}

	public void setPhoneLock(String phoneLock) {
		this.phoneLock = phoneLock;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getMobileLock() {
		return this.mobileLock;
	}

	public void setMobileLock(String mobileLock) {
		this.mobileLock = mobileLock;
	}

	public Integer getCalling() {
		return this.calling;
	}

	public void setCalling(Integer calling) {
		this.calling = calling;
	}

	public String getCallingLock() {
		return this.callingLock;
	}

	public void setCallingLock(String callingLock) {
		this.callingLock = callingLock;
	}

	public Integer getWork() {
		return this.work;
	}

	public void setWork(Integer work) {
		this.work = work;
	}

	public String getWorkLock() {
		return this.workLock;
	}

	public void setWorkLock(String workLock) {
		this.workLock = workLock;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	/*public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}*/

	public Short getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(Short userLevel) {
		this.userLevel = userLevel;
	}


}