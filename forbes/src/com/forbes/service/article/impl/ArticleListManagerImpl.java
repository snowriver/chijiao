package com.forbes.service.article.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.Article;
import com.forbes.hibernate.bean.ArticleType;
import com.forbes.hibernate.dao.ArticleDAO;
import com.forbes.hibernate.dao.ArticleTypeDAO;
import com.forbes.service.article.ArticleListManager;
import com.forbes.util.Pager;


public class ArticleListManagerImpl implements ArticleListManager {
	
	private ArticleTypeDAO articleTypeDAO;
	private ArticleDAO articleDAO;
	
	public ArticleTypeDAO getArticleTypeDAO() {
		return articleTypeDAO;
	}

	public void setArticleTypeDAO(ArticleTypeDAO articleTypeDAO) {
		this.articleTypeDAO = articleTypeDAO;
	}
	
	public ArticleDAO getArticleDAO() {
		return articleDAO;
	}

	public void setArticleDAO(ArticleDAO articleDAO) {
		this.articleDAO = articleDAO;
	}
	
	

	public List getArticleByPage(Pager pager, int pageNo, String deleteFlag, String userid, String typeid, String isverify, String keyword, String orderby ) throws ForbesException{
		if( typeid != null ){
			typeid = typeid.replaceAll("_", ",");
		}
		if( isverify != null ){
			isverify = isverify.replaceAll("_", ",");
		}
		try {			
			pager.setTotoalCnt(articleDAO.getCount(deleteFlag, userid, typeid, isverify, keyword));
			List list = articleDAO.findArticleByPage(deleteFlag, userid, typeid, isverify, keyword, orderby, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	

	public void addArticle(Article article) {
		articleDAO.save(article);
	}
	
	public void deleteArticle(Article article) {
		articleDAO.delete(article);
	}
	
	public Article getArticle(Integer id) {
		return articleDAO.findById(id);
	}

	public Article getNextArticle(Integer id) {
		List list = articleDAO.findNextArticle(id.toString());
		if(list.size() >0 )
			return (Article)list.get(0);
		else 
			return null;
	}
	
	public Article getPreArticle(Integer id) {
		List list = articleDAO.findPreArticle(id.toString());
		if(list.size() >0  )
			return (Article)list.get(0);
		else 
			return null;
	}
	
	public void updateArticle(Article article) {
		articleDAO.attachDirty(article);
	}

	public boolean verifyTitle( String title ){
		List list = articleDAO.findByTitle(title);
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}
	
	public boolean verifyTitle( Integer id, String title ){
		Article a = articleDAO.findById(id);
		List list = articleDAO.findByTitle(title);
		if ( list.contains(a) ) {
			list.remove(a);
		}
		if( list.size() == 0){
			return true;
		}
	    else
	    	return false;
	}

	
	public List getTopArticleByArticleType(String typeid, String orderby, int begin, int length ) throws ForbesException{
		if( typeid != null ){
			typeid = typeid.replaceAll("_", ",");
		}
		try {
			List list = articleDAO.findTopArticleByArticleType(typeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public List getLikeArticle(String likeid, String orderby, int begin, int length ) throws ForbesException{
		if( likeid != null ){
			likeid = likeid.replaceAll("_", ",");
		}
		try {
			List list = articleDAO.findArticleById(likeid, orderby, begin, length);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAllArticleid( ) throws ForbesException{
		
		try {
			List list = articleDAO.getAllArticleid();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
}
