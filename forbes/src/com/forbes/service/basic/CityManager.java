package com.forbes.service.basic;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.City;
import com.forbes.hibernate.dao.CityDAO;
import com.forbes.util.Pager;

public interface CityManager {
	
	
	public CityDAO getCityDAO();

	public void setCityDAO(CityDAO cityDAO);
	
	public List getProvinceByPage( Pager pager, int pageNo ) throws ForbesException;
	
	public List getAllProvince( ) throws ForbesException;
	
	public List getCity( String pid ) throws ForbesException;
	
	public void addCity(City city);
	
	public void deleteCity(City city);
	
	public City getCity(Integer id);

	public void updateCity(City city);

}
