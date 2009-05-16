package com.forbes.service.user.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.UcAdmins;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.hibernate.bean.UserDetail;
import com.forbes.hibernate.dao.UcAdminsDAO;
import com.forbes.hibernate.dao.UcMembersDAO;
import com.forbes.hibernate.dao.UserDAO;
import com.forbes.hibernate.dao.UserDetailDAO;
import com.forbes.service.user.UserInfoManager;
import com.forbes.util.Pager;

public class UserInfoManagerImpl implements UserInfoManager {
	
	private UcMembersDAO ucMembersDAO;
	
	private UserDAO userDAO;
	
	private UserDetailDAO userDetailDAO;
	
	private UcAdminsDAO ucAdminsDAO;
	
	public UcAdminsDAO getUcAdminsDAO() {
		return ucAdminsDAO;
	}

	public void setUcAdminsDAO(UcAdminsDAO ucAdminsDAO) {
		this.ucAdminsDAO = ucAdminsDAO;
	}

	public UcMembersDAO getUcMembersDAO() {
		return ucMembersDAO;
	}

	public void setUcMembersDAO(UcMembersDAO ucMembersDAO) {
		this.ucMembersDAO = ucMembersDAO;
	}
	
	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	public UserDetailDAO getUserDetailDAO() {
		return userDetailDAO;
	}

	public void setUserDetailDAO(UserDetailDAO userDetailDAO) {
		this.userDetailDAO = userDetailDAO;
	}
	
	public List getUserByPage( Pager pager, int pageNo, String keyWord, String orderBy ) throws ForbesException{
		try {			
			pager.setTotoalCnt(ucMembersDAO.getCount(keyWord));
			List list = ucMembersDAO.findUserByPage( keyWord, orderBy, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAdminByPage( Pager pager, int pageNo, String keyWord, String orderBy ) throws ForbesException{
		try {			
			pager.setTotoalCnt(ucAdminsDAO.getCount(keyWord));
			List list = ucAdminsDAO.findAdminByPage( keyWord, orderBy, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public void deleteUcMember(UcMembers user) {
		//user.setDeleteFlag("Y");
		ucMembersDAO.attachDirty(user);
	}
	
	public void deleteAdmin(UcAdmins user) {
		ucAdminsDAO.delete(user);
	}
	
	public UcMembers getUcMember(Integer id) {
		return ucMembersDAO.findById(id);
	}
	
	public UcAdmins getAdmin(Integer id) {
		return ucAdminsDAO.findById(id);
	}
	
	public User getUser(Integer id) {
		return userDAO.findById(id);
	}
	
	public void updateUcMember(UcMembers user) {
		ucMembersDAO.attachDirty(user);
	}
	
	public List getNewRegister(String orderby, int begin, int length ) throws ForbesException{
		try {
			List list = ucMembersDAO.findUserByPage( null, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getUser( int begin, int length ) throws ForbesException{
		try {
			List list = ucMembersDAO.findUserByPage( begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	/**
	 * 初始化User的详细信息
	 * @param User 客户
	 */
	public UcMembers initUserDetail( UcMembers ucMembers ) {
		try {
			
			if(ucMembers.getUserDetail() == null) {
				UserDetail detail = new UserDetail();
				detail.setScores(Integer.parseInt("0"));
				detail.setQqLock("N");
				detail.setEmailLock("N");
				detail.setSexLock("N");
				detail.setBirthLock("N");
				detail.setBirthType("L");
				detail.setCallingLock("N");
				detail.setWorkLock("N");
				detail.setHomeLock("N");
				detail.setLiveLock("N");
				detail.setPhoneLock("N");
				detail.setMobileLock("N");
				detail.setMsnLock("N");
				detail.setSex("F");
				detail.setUserLevel((short)1);
				userDetailDAO.save(detail);
				
				// 储存到數据库
				ucMembers.setUserDetail(detail);
				
				ucMembersDAO.attachDirty( ucMembers );
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			//throw new ForbesException(e.getMessage());
		}
		
		return ucMembers;
	}

	

	
}
