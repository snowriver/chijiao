package com.forbes.hibernate.bean;

/**
 * City entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Sector extends AbstractSector implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Sector() {
	}

	/** full constructor */
	public Sector(Integer pid, String name, Integer disorder) {
		super(pid, name, disorder);
	}

}
