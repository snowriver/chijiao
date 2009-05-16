package com.forbes.service.article.impl;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.ArticleType;
import com.forbes.hibernate.dao.ArticleTypeDAO;
import com.forbes.service.article.ArticleTypeManager;
import com.forbes.util.Pager;


public class ArticleTypeManagerImpl implements ArticleTypeManager {
	
	
	
	private ArticleTypeDAO articleTypeDAO;
	
	public ArticleTypeDAO getArticleTypeDAO() {
		return articleTypeDAO;
	}

	public void setArticleTypeDAO(ArticleTypeDAO articleTypeDAO) {
		this.articleTypeDAO = articleTypeDAO;
	}

	public List getTopArticleTypeByPage( Pager pager, int pageNo ) throws ForbesException{
		try {			
			pager.setTotoalCnt(articleTypeDAO.getCount("0"));
			List list = articleTypeDAO.findArticleTypeByPage("0", (pageNo - 1) * pager.getCntOfPage(), pager.getCntOfPage());			
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getTopArticleType( ) throws ForbesException{
		try {
			List list = articleTypeDAO.findByProperty("pid", 0);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getAllArticleType( ) throws ForbesException{
		try {
			List list = articleTypeDAO.findAll();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	

	public void addArticleType(ArticleType articleType) {
		articleTypeDAO.save(articleType);
	}
	
	public void deleteArticleType(ArticleType articleType) {
		articleTypeDAO.delete(articleType);
	}
	
	public ArticleType getArticleType(Integer id) {
		return articleTypeDAO.findById(id);
	}

	public void updateArticleType(ArticleType articleType) {
		articleTypeDAO.attachDirty(articleType);
	}

	
	public List getArticleType() throws ForbesException{
		try {
			List list = articleTypeDAO.findAll();
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
	public List getArticleType(String pid ) throws ForbesException{
		try {
			List list = articleTypeDAO.findByPid(pid);
			return list;
		} catch (Exception se) {
			se.printStackTrace();
			throw new ForbesException(se.getMessage());
		}
	}
	
}
