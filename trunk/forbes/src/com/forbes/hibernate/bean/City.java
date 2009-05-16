package com.forbes.hibernate.bean;

/**
 * City entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class City extends AbstractCity implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public City() {
	}

	/** full constructor */
	public City(Integer pid, String name, Integer disorder) {
		super(pid, name, disorder);
	}

}
