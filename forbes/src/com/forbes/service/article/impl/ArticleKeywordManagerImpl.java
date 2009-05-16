package com.forbes.service.article.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.ArticleKeyword;
import com.forbes.hibernate.dao.ArticleKeywordDAO;
import com.forbes.service.article.ArticleKeywordManager;
import com.forbes.util.Pager;


public class ArticleKeywordManagerImpl implements ArticleKeywordManager {
	
	
	
	private ArticleKeywordDAO articleKeywordDAO;
	
	

	public List getArticleKeywordByPage( Pager pager, int pageNo, String keyword, String orderby ) throws ForbesException{
		try {			
			pager.setTotoalCnt(articleKeywordDAO.getCount(keyword));
			List list = articleKeywordDAO.findArticleKeywordByPage(keyword, orderby, (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAllArticleKeyword( ) throws ForbesException{
		try {
			List list = articleKeywordDAO.findAll();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	public void addArticleKeyword(ArticleKeyword articleKeyword) {
		articleKeywordDAO.save(articleKeyword);
	}
	
	public void deleteArticleKeyword(ArticleKeyword articleKeyword) {
		articleKeywordDAO.delete(articleKeyword);
	}
	
	public ArticleKeyword getArticleKeyword(Integer id) {
		return articleKeywordDAO.findById(id);
	}

	public void updateArticleKeyword(ArticleKeyword articleKeyword) {
		articleKeywordDAO.attachDirty(articleKeyword);
	}

	
	public List getArticleKeyword() throws ForbesException{
		try {
			List list = articleKeywordDAO.findAll();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}

	public ArticleKeywordDAO getArticleKeywordDAO() {
		return articleKeywordDAO;
	}

	public void setArticleKeywordDAO(ArticleKeywordDAO articleKeywordDAO) {
		this.articleKeywordDAO = articleKeywordDAO;
	}
	
	public List getArticleKeywordByKeyword( String keyword ) throws ForbesException{
		try {
			List list = articleKeywordDAO.findByKeyword(keyword);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	
}
