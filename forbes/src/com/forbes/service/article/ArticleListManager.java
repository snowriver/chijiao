package com.forbes.service.article;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Article;
import com.forbes.hibernate.bean.ArticleType;
import com.forbes.hibernate.dao.ArticleDAO;
import com.forbes.hibernate.dao.ArticleTypeDAO;
import com.forbes.util.Pager;

public interface ArticleListManager {

	
	public ArticleTypeDAO getArticleTypeDAO() ;

	public void setArticleTypeDAO(ArticleTypeDAO articleTypeDAO);
	
	public ArticleDAO getArticleDAO();

	public void setArticleDAO(ArticleDAO articleDAO);
	
	

	public List getArticleByPage(Pager pager, int pageNo, String deleteFlag, String userid, String typeid, String isverify, 
			String keyword, String orderby ) throws ForbesException;

	public void addArticle(Article article) ;
	
	public void deleteArticle(Article article) ;
	
	public Article getArticle(Integer id);
	
	public Article getNextArticle(Integer id);
	
	public Article getPreArticle(Integer id);

	public void updateArticle(Article article);
	
	public boolean verifyTitle( String title );
	
	public boolean verifyTitle( Integer id, String title );
	
	public List getTopArticleByArticleType(String typeid, String orderby, int begin, int length ) throws ForbesException;
	
	public List getLikeArticle(String likeid, String orderby, int begin, int length ) throws ForbesException;
	
	public List getAllArticleid( ) throws ForbesException;
	
}
