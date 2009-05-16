package com.forbes.service.basic;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.City;
import com.forbes.hibernate.bean.Sector;
import com.forbes.hibernate.dao.CityDAO;
import com.forbes.hibernate.dao.SectorDAO;
import com.forbes.util.Pager;

public interface SectorManager {
	
	
	public SectorDAO getSectorDAO();

	public void setSectorDAO(SectorDAO sectorDAO);

	public List getTopSectorByPage( Pager pager, int pageNo ) throws ForbesException;
	
	public List getTopSector( ) throws ForbesException;
	

	public void addSector(Sector sector);
	
	public void deleteSector(Sector sector) ;
	
	public Sector getSector(Integer id);

	public void updateSector(Sector sector);
	
	public List getSectors( String pid ) throws ForbesException;

}
