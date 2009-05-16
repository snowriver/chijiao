package com.forbes.hibernate.bean;

/**
 * UcMembers entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UcMembers extends AbstractUcMembers implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UcMembers() {
	}

	/** full constructor */
	public UcMembers(String username, String password, String email,
			String myid, String myidkey, String regip, Integer regdate,
			Integer lastloginip, Integer lastlogintime, String salt,
			String secques) {
		super(username, password, email, myid, myidkey, regip, regdate,
				lastloginip, lastlogintime, salt, secques);
	}


}
