package com.forbes.service.article;

import java.util.List;

import com.forbes.exception.ForbesException;
import com.forbes.hibernate.bean.ArticleType;
import com.forbes.hibernate.dao.ArticleTypeDAO;
import com.forbes.util.Pager;

public interface ArticleTypeManager {

	
	public ArticleTypeDAO getArticleTypeDAO();

	public void setArticleTypeDAO(ArticleTypeDAO articleTypeDAO);

	public List getTopArticleTypeByPage( Pager pager, int pageNo ) throws ForbesException;
	
	public List getTopArticleType( ) throws ForbesException;
	
	public List getAllArticleType( ) throws ForbesException;

	public void addArticleType(ArticleType articleType);
	
	public void deleteArticleType(ArticleType articleType);
	
	public ArticleType getArticleType(Integer id);

	public void updateArticleType(ArticleType articleType);
	
	public List getArticleType() throws ForbesException;
	
	public List getArticleType(String pid ) throws ForbesException;

	
}
