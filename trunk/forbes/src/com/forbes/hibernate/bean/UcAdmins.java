package com.forbes.hibernate.bean;

/**
 * UcAdmins entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class UcAdmins extends AbstractUcAdmins implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public UcAdmins() {
	}

	/** full constructor */
	public UcAdmins(String username, Byte allowadminsetting,
			Byte allowadminapp, Byte allowadminuser, Byte allowadminbadword,
			Byte allowadmintag, Byte allowadminpm, Byte allowadmincredits,
			Byte allowadmindomain, Byte allowadmindb, Byte allowadminnote,
			Byte allowadmincache, Byte allowadminlog) {
		super(username, allowadminsetting, allowadminapp, allowadminuser,
				allowadminbadword, allowadmintag, allowadminpm,
				allowadmincredits, allowadmindomain, allowadmindb,
				allowadminnote, allowadmincache, allowadminlog);
	}

}
