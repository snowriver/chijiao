package com.forbes.service.article;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.ArticleKeyword;
import com.forbes.hibernate.dao.ArticleKeywordDAO;
import com.forbes.util.Pager;

public interface ArticleKeywordManager {

	public List getArticleKeywordByPage( Pager pager, int pageNo, String keyword, String orderby ) 
		throws ForbesException;
	
	public List getAllArticleKeyword( ) throws ForbesException;
	

	public void addArticleKeyword(ArticleKeyword articleKeyword);
	
	public void deleteArticleKeyword(ArticleKeyword articleKeyword);
	
	public ArticleKeyword getArticleKeyword(Integer id) ;

	public void updateArticleKeyword(ArticleKeyword articleKeyword);

	
	public List getArticleKeyword() throws ForbesException;

	public ArticleKeywordDAO getArticleKeywordDAO();

	public void setArticleKeywordDAO(ArticleKeywordDAO articleKeywordDAO) ;
	
	public List getArticleKeywordByKeyword( String keyword ) throws ForbesException;
}
