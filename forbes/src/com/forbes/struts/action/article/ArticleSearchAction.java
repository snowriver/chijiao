package com.forbes.struts.action.article;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.hibernate.bean.Article;
import com.forbes.hibernate.bean.ArticleType;
import com.forbes.service.article.ArticleListManager;
import com.forbes.service.article.ArticleTypeManager;
import com.forbes.util.Pager;

public class ArticleSearchAction extends DispatchAction {
	
	private ArticleListManager articleListManager;
	
	private ArticleTypeManager articleTypeManager;
	
	public ArticleListManager getArticleListManager() {
		return articleListManager;
	}

	public void setArticleListManager(ArticleListManager articleListManager) {
		this.articleListManager = articleListManager;
	}
	
	
	public ActionForward index(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {				
		try {			
			List list = articleListManager.getTopArticleByArticleType(null, null, 0, 5);
			request.setAttribute( "ARTICLE_LIST", list);			
			return mapping.findForward("index");
		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward type(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {		
		String typeid = request.getParameter("typeid");
		try {			
			List list = articleListManager.
				getTopArticleByArticleType(typeid, "pubdate DESC", 0, 10);
			request.setAttribute( "ARTICLE_LIST", list);			
			return mapping.findForward("type");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}	
	
	public ActionForward view(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		
		String  id = request.getParameter("id");
		
		try {			
			Article article = articleListManager.getArticle(Integer.parseInt(id));
			if(article == null)
				return mapping.findForward("error");
			article.setClick(article.getClick() + 1);
			articleListManager.updateArticle(article);
			request.setAttribute( "ARTICLE", article);
			
			Article nextArticle  = articleListManager.getNextArticle(Integer.parseInt(id));
			Article preArticle   = articleListManager.getPreArticle(Integer.parseInt(id));
			
			request.setAttribute( "NEXT_ARTICLE", nextArticle);
			request.setAttribute( "PRE_ARTICLE", preArticle);
			return mapping.findForward("view");
		}catch( Exception e ){
			return mapping.findForward("error");
		}
	}
	
	
	public ActionForward search(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String keyword   = request.getParameter("keyword");
		String orderby   = request.getParameter("orderby");
		String pageNo    = request.getParameter("pno");
		String parameter = "keyword=" + ( (keyword==null)?" ":keyword );
		
		Map map = new TreeMap();
		map.put("keyword", keyword);
		map.put("orderby", orderby);
		
		try {
			
			List topType = articleTypeManager.getTopArticleType();
			
			int iPageNo = 1;
			try {
				if( pageNo != null ){
					iPageNo = Integer.parseInt( pageNo );
				}
			} catch( Exception e ){ }

			List list = null;
			Pager pager = new Pager();
			pager.setCntOfPage( 10 );
			pager.setCurPage( iPageNo );
			
			list = articleListManager.
				getArticleByPage(pager, iPageNo, "N", null, null, "1", keyword, orderby);

			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "ARTICLE_LIST", list);
			request.setAttribute( "ARTICLE_TYPE_LIST", topType);
			
			return mapping.findForward("search");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
	
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String typeid    = request.getParameter("typeid");
		String keyword   = request.getParameter("keyword");
		String orderby   = request.getParameter("orderby");
		String pageNo    = request.getParameter("pno");
		String parameter = "keyword=" + ( (keyword==null)?" ":keyword );
		
		Map map = new TreeMap();
		map.put("keyword", keyword);
		map.put("typeid", typeid);
		map.put("orderby", orderby);
		
		try {
			
			ArticleType parantType = null;
			ArticleType type 	   = null;
			List 	    topType    = null;
			
			if( typeid != null && typeid.length() > 0) {
			
				type = articleTypeManager.getArticleType(Integer.parseInt(typeid));
			
				if( type.getPid() !=0 )
					parantType = articleTypeManager.getArticleType(type.getPid());
				
				if( type.getArticleTypes().size() == 0)
					topType = articleTypeManager.getTopArticleType();				
			}
			else {
				topType = articleTypeManager.getTopArticleType();
			}
			
			int iPageNo = 1;
			try {
				if( pageNo != null ){
					iPageNo = Integer.parseInt( pageNo );
				}
			} catch( Exception e ){ }

			List list = null;
			Pager pager = new Pager();
			pager.setCntOfPage( 10 );
			pager.setCurPage( iPageNo );
			
			list = articleListManager.
				getArticleByPage(pager, iPageNo, "N", null, typeid, "1",keyword, orderby);

			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "ARTICLE_LIST", list);
			request.setAttribute( "ARTICLE_TYPE", type);
			request.setAttribute( "PARENT_ARTICLE_TYPE", parantType);
			request.setAttribute( "ARTICLE_TYPE_LIST", topType);
			
			return mapping.findForward("list");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward top(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String orderby   = request.getParameter("orderby");
		try {
			
			List list = articleListManager.getTopArticleByArticleType(null, orderby, 0, 10);
			request.setAttribute( "ARTICLE_LIST", list);
			
			return mapping.findForward("top");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}

	public ArticleTypeManager getArticleTypeManager() {
		return articleTypeManager;
	}

	public void setArticleTypeManager(ArticleTypeManager articleTypeManager) {
		this.articleTypeManager = articleTypeManager;
	}
	
	
	public ActionForward like(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String  id = request.getParameter("id");
		
		try {
			
			Article article = articleListManager.getArticle(Integer.parseInt(id));
			List list = null;
						
			String likeid = article.getLikeid();
			if( likeid != null ){
				likeid = likeid.replaceAll(",", "_");
				likeid = likeid.replaceAll(" ", "_");
				list = articleListManager.getLikeArticle(likeid, "pubdate DESC", 0, 10);
			}
			else {
				if( article.getArticleType2() != null)
					list = articleListManager.
						getTopArticleByArticleType(
								article.getArticleType2().getId().toString(), 
									"pubdate DESC", 0, 10);
				if(list!=null && list.size() <= 1)
					list = articleListManager.
						getTopArticleByArticleType(
								article.getArticleType().getId().toString(), 
								"pubdate DESC", 0, 10);
			}	
			
			request.setAttribute( "LIKE_ARTICLE_LIST", list);
			return mapping.findForward("like");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
}