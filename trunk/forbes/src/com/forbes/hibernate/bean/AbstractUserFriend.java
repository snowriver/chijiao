package com.forbes.hibernate.bean;

/**
 * AbstractUserFriend entity provides the base persistence definition of the
 * UserFriend entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractUserFriend implements java.io.Serializable {

	// Fields

	private Long id;
	private Integer userId;
	//private Integer friendId;
	private User Friend;
	private String friendLoginname;
	private String note;

	// Constructors

	/** default constructor */
	public AbstractUserFriend() {
	}

	/** full constructor */
	public AbstractUserFriend(Integer userId, User Friend,
			String friendLoginname, String note) {
		this.userId = userId;
		//this.friendId = friendId;
		this.Friend = Friend;
		this.friendLoginname = friendLoginname;
		this.note = note;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	/*public Integer getFriendId() {
		return this.friendId;
	}

	public void setFriendId(Integer friendId) {
		this.friendId = friendId;
	}*/

	public String getFriendLoginname() {
		return this.friendLoginname;
	}

	public void setFriendLoginname(String friendLoginname) {
		this.friendLoginname = friendLoginname;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public User getFriend() {
		return Friend;
	}

	public void setFriend(User friend) {
		Friend = friend;
	}

}