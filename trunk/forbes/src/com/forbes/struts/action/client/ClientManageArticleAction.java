/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.client;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import com.forbes.hibernate.bean.Article;
import com.forbes.hibernate.bean.ArticleType;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.service.article.ArticleListManager;
import com.forbes.service.article.ArticleTypeManager;
import com.forbes.struts.form.article.ArticleInfoForm;
import com.forbes.util.Constant;
import com.forbes.util.Pager;
import com.forbes.util.ToHtml;
import com.forbes.util.UploadFile;
import com.forbes.util.UrlTool;


/** 
 * MyEclipse Struts
 * Creation date: 09-20-2008
 * 
 * XDoclet definition:
 * @struts.action scope="request" validate="true"
 */
public class ClientManageArticleAction extends DispatchAction {
	/*
	 * Generated Methods
	 */
	private ArticleListManager articleListManager;
	
	private ArticleTypeManager articleTypeManager;
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

		UcMembers user = (UcMembers)request.getSession().getAttribute("CLIENT");
		
		String pageNo     = request.getParameter("pno");
		String deleteFlag = "N";
		String userid     = user.getUid().toString();
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
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	public ArticleListManager getArticleListManager() {
		return articleListManager;
	}
	public void setArticleListManager(ArticleListManager articleListManager) {
		this.articleListManager = articleListManager;
	}
	
	public ArticleTypeManager getArticleTypeManager() {
		return articleTypeManager;
	}
	public void setArticleTypeManager(ArticleTypeManager articleTypeManager) {
		this.articleTypeManager = articleTypeManager;
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String id = request.getParameter("id");
			Article a = articleListManager.getArticle(Integer.parseInt(id));
			a.setIsdelete("Y");
			articleListManager.updateArticle(a);
			return mapping.findForward(null);
		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
}