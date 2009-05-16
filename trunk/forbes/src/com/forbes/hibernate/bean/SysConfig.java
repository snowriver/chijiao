package com.forbes.hibernate.bean;

/**
 * SysConfig entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class SysConfig extends AbstractSysConfig implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public SysConfig() {
	}

	/** full constructor */
	public SysConfig(String key, String info, String value, String type,
			Integer group) {
		super(key, info, value, type, group);
	}

}
