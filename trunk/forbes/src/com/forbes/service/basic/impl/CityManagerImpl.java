package com.forbes.service.basic.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.City;
import com.forbes.hibernate.dao.CityDAO;
import com.forbes.service.basic.CityManager;
import com.forbes.util.Pager;


public class CityManagerImpl implements CityManager {
	
	
	
	private CityDAO cityDAO;
	
	public CityDAO getCityDAO() {
		return cityDAO;
	}

	public void setCityDAO(CityDAO cityDAO) {
		this.cityDAO = cityDAO;
	}
	

	public List getProvinceByPage( Pager pager, int pageNo ) throws ForbesException{
		try {			
			pager.setTotoalCnt(cityDAO.getCount("0"));
			List list = cityDAO.findCityByPage("0", (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAllProvince( ) throws ForbesException{
		try {
			List list = cityDAO.findByProperty("pid", 0);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getCity( String pid ) throws ForbesException{
		try {
			return cityDAO.findByPid(Integer.parseInt(pid));
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public void addCity(City city) {
		cityDAO.save(city);
	}
	
	public void deleteCity(City city) {
		cityDAO.delete(city);
	}
	
	public City getCity(Integer id) {
		return cityDAO.findById(id);
	}

	public void updateCity(City city) {
		cityDAO.attachDirty(city);
	}
	
}
