package com.forbes.hibernate.bean;

/**
 * Dictionary entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Dictionary extends AbstractDictionary implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Dictionary() {
	}

	/** full constructor */
	public Dictionary(String dgroup, Short dindex, String dkey, Short dvalue,
			String dvalueDescCh) {
		super(dgroup, dindex, dkey, dvalue, dvalueDescCh);
	}

}
