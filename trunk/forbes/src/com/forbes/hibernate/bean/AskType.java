package com.forbes.hibernate.bean;

/**
 * City entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class AskType extends AbstractAskType implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public AskType() {
	}

	/** full constructor */
	public AskType(Integer pid, String name, Integer disorder, String issend, String description, String keywords) {
		super(pid, name, disorder, issend, description, keywords);
	}

}
