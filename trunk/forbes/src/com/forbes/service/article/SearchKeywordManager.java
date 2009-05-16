package com.forbes.service.article;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.ArticleKeyword;
import com.forbes.hibernate.bean.SearchKeyword;
import com.forbes.hibernate.dao.ArticleKeywordDAO;
import com.forbes.hibernate.dao.SearchKeywordDAO;
import com.forbes.util.Pager;

public interface SearchKeywordManager {

	
	public List getSearchKeywordByPage( Pager pager, int pageNo, String keyword, String orderby ) 
		throws ForbesException;
	
	public List getAllSearchKeyword( ) throws ForbesException;

	public void addSearchKeyword(SearchKeyword searchKeyword);
	
	public void deleteSearchKeyword(SearchKeyword searchKeyword);
	
	public SearchKeyword getSearchKeyword(Integer id);

	public void updateSearchKeyword(SearchKeyword searchKeyword);
	
	public List getSearchKeyword() throws ForbesException;

	public SearchKeywordDAO getSearchKeywordDAO();

	public void setSearchKeywordDAO(SearchKeywordDAO searchKeywordDAO);
	
	public List getSearchKeywordByKeyword( String keyword ) throws ForbesException;
	
}
