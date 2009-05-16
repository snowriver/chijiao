package com.forbes.hibernate.bean;

import java.util.Set;

/**
 * UserDetail entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UserDetail extends AbstractUserDetail implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UserDetail() {
	}

	/** full constructor */
	public UserDetail(String sex, String sexLock, String email,
			String emailLock, String qq, String qqLock, String hotmail,
			String hotmailLock, Integer scores, String birthType,
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
		super(sex, sexLock, email, emailLock, qq, qqLock, hotmail, hotmailLock,
				scores, birthType, birthLock, birthYear, birthMonth, birthDay,
				homeLock, homeProvinceId, homeProvinceName, homeCityId,
				homeCityName, homeDistrictId, homeDistrictName, liveLock,
				liveProvinceId, liveProvinceName, liveCityId, liveCityName,
				liveDistrictId, liveDistrictName, phone, phoneLock, mobile,
				mobileLock, calling, callingLock, work, workLock, description/*, user*/);
	}

}
