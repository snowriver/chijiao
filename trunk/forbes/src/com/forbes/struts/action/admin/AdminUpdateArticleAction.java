/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.admin;

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
import com.forbes.hibernate.bean.Comment;
import com.forbes.service.account.ScoreManager;
import com.forbes.service.article.ArticleTypeManager;
import com.forbes.service.article.CommentManager;
import com.forbes.service.article.ArticleListManager;
import com.forbes.struts.form.article.ArticleInfoForm;
import com.forbes.util.DictionaryManager;
import com.forbes.util.Pager;
import com.forbes.util.UrlTool;


/** 
 * MyEclipse Struts
 * Creation date: 09-20-2008
 * 
 * XDoclet definition:
 * @struts.action scope="request" validate="true"
 */
public class AdminUpdateArticleAction extends DispatchAction {
	/*
	 * Generated Methods
	 */
	private ArticleListManager articleListManager;
	
	private ArticleTypeManager articleTypeManager;	

	private CommentManager commentManager;
	
	private ScoreManager scoreManager;
	
	public ScoreManager getScoreManager() {
		return scoreManager;
	}
	public void setScoreManager(ScoreManager scoreManager) {
		this.scoreManager = scoreManager;
	}
	
	public ArticleTypeManager getArticleTypeManager() {
		return articleTypeManager;
	}
	public void setArticleTypeManager(ArticleTypeManager articleTypeManager) {
		this.articleTypeManager = articleTypeManager;
	}
	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String pageNo     = request.getParameter("pno");
		String deleteFlag = request.getParameter("deleteFlag");
		String userid     = request.getParameter("userid");
		String typeid     = request.getParameter("typeid");
		String isverify   = request.getParameter("isverify");
		String keyword    = request.getParameter("keyword");
		String orderby    = request.getParameter("orderby");
		
		if(isverify == null)
			isverify = "0_1";
		
		String parameter = "userid=" + ( (userid==null)?"":userid ) +
						   "&typeid=" + ( (typeid==null)?"":typeid ) +
						   "&keyword=" + ( (keyword==null)?"":keyword ) +
						   "&orderby=" + ( (orderby==null)?"":orderby ) +
						   "&deleteFlag=" + ( (deleteFlag==null)?"N":deleteFlag ) +
						   "&isverify=" + ( (isverify==null)?"0_1":isverify );
		
		Map map = new TreeMap();
		map.put("deleteFlag", deleteFlag);
		map.put("userid", userid);
		map.put("typeid", typeid);
		map.put("keyword", keyword);
		map.put("isverify", isverify);
		map.put("orderby", orderby);
		map.put("parameter", parameter);
		
		/*System.out.println(" userid=" + userid);
		System.out.println(" typeid=" + typeid);
		System.out.println(" keyword=" + keyword);*/
		
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
		
		try {
		
			list = articleListManager.getArticleByPage(pager, iPageNo, deleteFlag, userid, typeid, isverify, keyword, orderby);
			
			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "ARTICLE_LIST", list);
			return mapping.findForward("list");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	public ArticleListManager getArticleListManager() {
		return articleListManager;
	}
	public void setArticleListManager(ArticleListManager articleListManager) {
		this.articleListManager = articleListManager;
	}
	
	
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String returnUrl = request.getParameter("returnUrl");
		String arcID     = request.getParameter("arcID");
		String id = ""; //`
		System.out.println(arcID);
		String artID [] = arcID.split("`");
		try {
		
			for(int i=0; i<artID.length; i++) {
				id = artID[i];				
				Article a = articleListManager.getArticle(Integer.parseInt(id));
				List acs = commentManager.getComment(new Short("2"), a.getId());				
				for(int j=0; j<acs.size(); j++) {
					Comment ac = (Comment)acs.get(j);					
					commentManager.deleteComment(ac);
				}
				a.setIsdelete("Y");
				articleListManager.updateArticle(a);
			}
			
			request.setAttribute("OK_MESSAGE", "删除文章成功！");
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]"));
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	
	
	public ActionForward verify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String returnUrl = request.getParameter("returnUrl");
		String arcID     = request.getParameter("arcID");
		String id = ""; //`
		System.out.println(arcID);
		String artID [] = arcID.split("`");
		try {
		
			for(int i=0; i<artID.length; i++) {
				id = artID[i];
				System.out.println(id);
				Article a = articleListManager.getArticle(Integer.parseInt(id));
				if( a.getIsverify() == 0 ) {
					a.setIsverify(new Short("1"));
					articleListManager.updateArticle(a);
					
					Short accountType = DictionaryManager.getInstance().getVal("ACCOUNT_TYPE", "2").getDvalue();
					int amount = 10;
					String remark = "文章 “" + a.getTitle() + "” 审核通过";
					boolean updateRst = scoreManager.addScoreByUser(a.getId().toString(), a.getUserid().toString(), 
							accountType.toString(), (int)amount, remark);
					if( updateRst){
						System.out.println("添加积分成功");
					}
				}
				
			}
			
			request.setAttribute("OK_MESSAGE", "审核文章成功！");
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]"));
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}

	public ActionForward command(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String returnUrl = request.getParameter("returnUrl");
		String arcID     = request.getParameter("arcID");
		String id = ""; //`
		System.out.println(arcID);
		String artID [] = arcID.split("`");
		try {
		
			for(int i=0; i<artID.length; i++) {
				id = artID[i];
				System.out.println(id);
				Article a = articleListManager.getArticle(Integer.parseInt(id));
				a.setIscommend(new Short("1"));
				articleListManager.updateArticle(a);
			}
			
			request.setAttribute("OK_MESSAGE", "推荐文章成功！");
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]"));
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward select(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String pageNo     = request.getParameter("pno");
		String deleteFlag = request.getParameter("deleteFlag");
		String userid     = request.getParameter("userid");
		String typeid     = request.getParameter("typeid");
		String keyword    = request.getParameter("keyword");
		String isverify    = request.getParameter("isverify");
		String orderby    = request.getParameter("orderby");
		
		if(isverify == null)
			isverify = "0_1";
		String parameter = "userid=" + ( (userid==null)?"":userid ) +
						   "&typeid=" + ( (typeid==null)?"":typeid ) +
						   "&keyword=" + ( (keyword==null)?"":keyword ) +
						   "&orderby=" + ( (orderby==null)?"":orderby ) +
						   "&deleteFlag=" + ( (deleteFlag==null)?"N":deleteFlag ) +
						   "&isverify=" + ( (isverify==null)?"0_1":isverify );
		
		
		Map map = new TreeMap();
		map.put("deleteFlag", deleteFlag);
		map.put("userid", userid);
		map.put("typeid", typeid);
		map.put("keyword", keyword);
		map.put("isverify", isverify);
		map.put("orderby", orderby);
		map.put("parameter", parameter);
		
		/*System.out.println(" userid=" + userid);
		System.out.println(" typeid=" + typeid);
		System.out.println(" keyword=" + keyword);*/
		
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
		
		try {
		
			list = articleListManager.getArticleByPage(pager, iPageNo, deleteFlag, userid, typeid, isverify, keyword, orderby);
			
			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "ARTICLE_LIST", list);
			return mapping.findForward("select");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	public CommentManager getCommentManager() {
		return commentManager;
	}
	public void setCommentManager(CommentManager commentManager) {
		this.commentManager = commentManager;
	}

	//批量修改
	public ActionForward bmod(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		ArticleInfoForm articleInfoForm = (ArticleInfoForm) form;
		String returnUrl = request.getParameter("returnUrl");
		//SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(returnUrl);		
		
		String arcID     = request.getParameter("arcID");
		String id = ""; //`
		System.out.println(arcID);
		String artID [] = arcID.split("`");
		try {
		
			for(int i=0; i<artID.length; i++) {
				id = artID[i];
				System.out.println(id);
				Article a = articleListManager.getArticle(Integer.parseInt(id));


				if (articleInfoForm.getIscommend() !=null ) 
					a.setIscommend(articleInfoForm.getIscommend());
				if (articleInfoForm.getIsverify() !=null ) 
					a.setIsverify(articleInfoForm.getIsverify());
				if (articleInfoForm.getMaintypeid() !=null ) {
					ArticleType at = articleTypeManager.getArticleType(articleInfoForm.getMaintypeid());
					a.setArticleType(at);
				}
				if (articleInfoForm.getTypeid() !=null ) {
					ArticleType at = articleTypeManager.getArticleType(articleInfoForm.getTypeid());
					a.setArticleType2(at);
				}
				
				if (articleInfoForm.getSource() != null && articleInfoForm.getSource().length() > 0) {
					a.setSource(articleInfoForm.getSource());
				}
				if (articleInfoForm.getWriter() != null && articleInfoForm.getWriter().length() > 0) {
					a.setWriter(articleInfoForm.getWriter());
				}
				if (articleInfoForm.getLikeid() != null && articleInfoForm.getLikeid().length() > 0) {
					a.setLikeid(articleInfoForm.getLikeid());
				}
				if (articleInfoForm.getColor() != null && articleInfoForm.getColor().length() > 0) {
					a.setColor(articleInfoForm.getColor());
				}
				
				articleListManager.updateArticle(a);
			}
			
			request.setAttribute("OK_MESSAGE", "推荐文章成功！");
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]"));
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}

	public ActionForward clear(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String returnUrl = request.getParameter("returnUrl");
		try {
			List<Article> list = articleListManager.getDeletedArticle();
			for (Article article : list) {
				List acs = commentManager.getComment(new Short("2"), article.getId());
				for(int j=0; j<acs.size(); j++) {
					Comment ac = (Comment)acs.get(j);					
					commentManager.deleteComment(ac);
				}
				articleListManager.deleteArticleContent(article.getArticleContent());
				articleListManager.deleteArticle(article);
			}			
			request.setAttribute("OK_MESSAGE", "清空回收站成功！");
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]"));
			return mapping.findForward("ok");
		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	
}