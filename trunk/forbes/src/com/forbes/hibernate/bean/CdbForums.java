package com.forbes.hibernate.bean;

/**
 * CdbForums entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class CdbForums extends AbstractCdbForums implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public CdbForums() {
	}

	/** full constructor */
	public CdbForums(Short fup, String type, String name, Byte status,
			Short displayorder, Short styleid, Integer threads, Integer posts,
			Integer todayposts, String lastpost, Byte allowsmilies,
			Byte allowhtml, Byte allowbbcode, Byte allowimgcode,
			Byte allowmediacode, Byte allowanonymous, Byte allowshare,
			Short allowpostspecial, Byte allowspecialonly, Byte alloweditrules,
			Byte allowfeed, Byte recyclebin, Byte modnewposts, Byte jammer,
			Byte disablewatermark, Byte inheritedmod, Short autoclose,
			Short forumcolumns, Byte threadcaches, Byte alloweditpost,
			Byte simple, Byte modworks, Byte allowtag, Byte allowglobalstick) {
		super(fup, type, name, status, displayorder, styleid, threads, posts,
				todayposts, lastpost, allowsmilies, allowhtml, allowbbcode,
				allowimgcode, allowmediacode, allowanonymous, allowshare,
				allowpostspecial, allowspecialonly, alloweditrules, allowfeed,
				recyclebin, modnewposts, jammer, disablewatermark,
				inheritedmod, autoclose, forumcolumns, threadcaches,
				alloweditpost, simple, modworks, allowtag, allowglobalstick);
	}

}
