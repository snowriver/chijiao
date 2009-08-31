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

	/** minimal constructor */
	public SysConfig(Integer id, Integer group) {
		super(id, group);
	}

	/** full constructor */
	public SysConfig(Integer id, String info, String value, String type,
			Integer group) {
		super(id, info, value, type, group);
	}

}
