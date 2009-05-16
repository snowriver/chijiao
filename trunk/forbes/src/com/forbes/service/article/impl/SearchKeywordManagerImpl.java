package com.forbes.service.article.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.ArticleKeyword;
import com.forbes.hibernate.bean.SearchKeyword;
import com.forbes.hibernate.dao.ArticleKeywordDAO;
import com.forbes.hibernate.dao.SearchKeywordDAO;
import com.forbes.service.article.ArticleKeywordManager;
import com.forbes.service.article.SearchKeywordManager;
import com.forbes.util.Pager;


public class SearchKeywordManagerImpl implements SearchKeywordManager {
	
	
	
	private SearchKeywordDAO searchKeywordDAO;
	
	

	public List getSearchKeywordByPage( Pager pager, int pageNo, String keyword, String orderby ) throws ForbesException{
		try {			
			pager.setTotoalCnt(searchKeywordDAO.getCount(keyword));
			List list = searchKeywordDAO.findSearchKeywordByPage(keyword, orderby, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAllSearchKeyword( ) throws ForbesException{
		try {
			List list = searchKeywordDAO.findAll();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	public void addSearchKeyword(SearchKeyword searchKeyword) {
		searchKeywordDAO.save(searchKeyword);
	}
	
	public void deleteSearchKeyword(SearchKeyword searchKeyword) {
		searchKeywordDAO.delete(searchKeyword);
	}
	
	public SearchKeyword getSearchKeyword(Integer id) {
		return searchKeywordDAO.findById(id);
	}

	public void updateSearchKeyword(SearchKeyword searchKeyword) {
		searchKeywordDAO.attachDirty(searchKeyword);
	}

	
	public List getSearchKeyword() throws ForbesException{
		try {
			List list = searchKeywordDAO.findAll();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public SearchKeywordDAO getSearchKeywordDAO() {
		return searchKeywordDAO;
	}

	public void setSearchKeywordDAO(SearchKeywordDAO searchKeywordDAO) {
		this.searchKeywordDAO = searchKeywordDAO;
	}

	
	public List getSearchKeywordByKeyword( String keyword ) throws ForbesException{
		try {
			List list = searchKeywordDAO.findByKeyword(keyword);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	
	
}
