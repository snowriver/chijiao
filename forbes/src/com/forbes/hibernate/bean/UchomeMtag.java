package com.forbes.hibernate.bean;

/**
 * UchomeMtag entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UchomeMtag extends AbstractUchomeMtag implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public UchomeMtag() {
	}

	/** full constructor */
	public UchomeMtag(String tagname, Short fieldid, Integer membernum,
			Byte close, String announcement, String pic, Byte closeapply,
			Byte joinperm, Byte viewperm, String moderator) {
		super(tagname, fieldid, membernum, close, announcement, pic,
				closeapply, joinperm, viewperm, moderator);
	}

}
