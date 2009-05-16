package com.forbes.service.basic.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.City;
import com.forbes.hibernate.bean.Sector;
import com.forbes.hibernate.dao.CityDAO;
import com.forbes.hibernate.dao.SectorDAO;
import com.forbes.service.basic.SectorManager;
import com.forbes.util.Pager;


public class SectorManagerImpl implements SectorManager {
	
	
	
	private SectorDAO sectorDAO;
	
	public SectorDAO getSectorDAO() {
		return sectorDAO;
	}

	public void setSectorDAO(SectorDAO sectorDAO) {
		this.sectorDAO = sectorDAO;
	}

	public List getTopSectorByPage( Pager pager, int pageNo ) throws ForbesException{
		try {			
			pager.setTotoalCnt(sectorDAO.getCount("0"));
			List list = sectorDAO.findSectorByPage("0", (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getTopSector( ) throws ForbesException{
		try {
			List list = sectorDAO.findByProperty("pid", 0);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	public void addSector(Sector sector) {
		sectorDAO.save(sector);
	}
	
	public void deleteSector(Sector sector) {
		sectorDAO.delete(sector);
	}
	
	public Sector getSector(Integer id) {
		return sectorDAO.findById(id);
	}

	public void updateSector(Sector sector) {
		sectorDAO.attachDirty(sector);
	}

	
	public List getSectors( String pid ) throws ForbesException{
		try {
			return sectorDAO.findByPid(Integer.parseInt(pid));
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	
	
}
