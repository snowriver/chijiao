/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.article;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.hibernate.bean.Article;
import com.forbes.service.article.ArticleListManager;
import com.forbes.util.MD5;




/** 
 * MyEclipse Struts
 * Creation date: 09-20-2008
 * 
 * XDoclet definition:
 * @struts.action scope="request" validate="true"
 */
public class ArticleDiggAction extends Action {
	/*
	 * Generated Methods
	 */
	//private VideoTypeManager videoTypeManager;
	
	private ArticleListManager articleListManager;
	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		
		String  id = request.getParameter("id");
		
		System.out.print(" Digg id = "+id);
		try {
			
			Article article = articleListManager.getArticle(Integer.parseInt(id));
			article.setDigg(article.getDigg() + 1);
			article.setDiggtime(new Date());
			articleListManager.updateArticle(article);
			
			//����cookie
			/*try {
				
				Cookie c = new Cookie("FORBES_USER_DIGG", "");
				c.setMaxAge(60*60*24*365);
					response.addCookie(c);
		
			} catch(Exception e) {
				e.printStackTrace();
			}*/
			
			request.setAttribute( "RESULT_MESSAGE", article.getDigg());
			
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	/*public VideoTypeManager getVideoTypeManager() {
		return videoTypeManager;
	}
	public void setVideoTypeManager(VideoTypeManager videoTypeManager) {
		this.videoTypeManager = videoTypeManager;
	}*/
	public ArticleListManager getArticleListManager() {
		return articleListManager;
	}
	public void setArticleListManager(ArticleListManager articleListManager) {
		this.articleListManager = articleListManager;
	}
	
	
	
	
	
}