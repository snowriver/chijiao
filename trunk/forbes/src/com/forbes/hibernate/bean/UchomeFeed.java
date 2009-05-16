package com.forbes.hibernate.bean;

/**
 * UchomeFeed entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UchomeFeed extends AbstractUchomeFeed implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UchomeFeed() {
	}

	/** full constructor */
	public UchomeFeed(Short appid, String icon, Integer uid, String username,
			Integer dateline, Byte friend, String hashTemplate,
			String hashData, String titleTemplate, String titleData,
			String bodyTemplate, String bodyData, String bodyGeneral,
			String image1, String image1Link, String image2, String image2Link,
			String image3, String image3Link, String image4, String image4Link,
			String targetIds) {
		super(appid, icon, uid, username, dateline, friend, hashTemplate,
				hashData, titleTemplate, titleData, bodyTemplate, bodyData,
				bodyGeneral, image1, image1Link, image2, image2Link, image3,
				image3Link, image4, image4Link, targetIds);
	}

}
