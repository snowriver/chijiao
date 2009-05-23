/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.admin;

import java.text.SimpleDateFormat;
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
import com.forbes.service.article.ArticleListManager;
import com.forbes.service.article.ArticleTypeManager;
import com.forbes.struts.form.article.ArticleInfoForm;
import com.forbes.util.Constant;
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
public class AdminEditArticleAction extends DispatchAction {
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
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ArticleInfoForm articleInfoForm = (ArticleInfoForm) form;
		String returnUrl = request.getParameter("returnUrl");
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//System.out.println(returnUrl);
		UcMembers user = (UcMembers)request.getSession().getAttribute("ADMIN");
		Article a = new Article();
		try {
			
			System.out.println(" Maintypeid = " + articleInfoForm.getMaintypeid());
			System.out.println(" Typeid	    = " + articleInfoForm.getTypeid());
			
			if(articleListManager.verifyTitle(articleInfoForm.getTitle().trim())) {
				
				a.setIsdelete("N");
				a.setUser( user );
				a.setUsername(user.getUsername());
				a.setUserip( request.getLocalAddr() );
				a.setPubdate( formatter.parse(articleInfoForm.getPubdate()) );
				a.setTitle( articleInfoForm.getTitle() );
				a.setContent( articleInfoForm.getContent() );
				a.setClick( 0 );
				a.setIscommend( new Short("0") );
				a.setIsverify( new Short("0") );
				a.setDigg( 0 );
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
				if (articleInfoForm.getShorttitle() !=null && articleInfoForm.getShorttitle().length() > 0 ) {
					a.setShorttitle(articleInfoForm.getShorttitle());
				}
				if (articleInfoForm.getShorttitle() == null || articleInfoForm.getShorttitle().length() == 0) {
					String shorttitle = ( articleInfoForm.getTitle().length() > 40)?
							articleInfoForm.getTitle().substring(0, 39):articleInfoForm.getTitle();
					a.setShorttitle( shorttitle );
				}
				if (articleInfoForm.getSource() != null && articleInfoForm.getSource().length() > 0) {
					a.setSource(articleInfoForm.getSource());
				}
				if (articleInfoForm.getWriter() != null && articleInfoForm.getWriter().length() > 0) {
					a.setWriter(articleInfoForm.getWriter());
				}
				if (articleInfoForm.getDescription() != null && articleInfoForm.getDescription().length() > 0) {
					a.setDescription(articleInfoForm.getDescription());
				}
				if (articleInfoForm.getLikeid() != null && articleInfoForm.getLikeid().length() > 0) {
					a.setLikeid(articleInfoForm.getLikeid());
				}
				if (articleInfoForm.getColor() != null && articleInfoForm.getColor().length() > 0) {
					a.setColor(articleInfoForm.getColor());
				}
				a.setKeywords( articleInfoForm.getKeywords() );
				
				System.out.println(articleInfoForm.getLitpictype());
				
				if ( articleInfoForm.getLitpictype() == 2 ) { //本地上传
					
					System.out.println( articleInfoForm.getLocallitpic() != null );
					
					if ( articleInfoForm.getLocallitpic() != null ) {
						FormFile file   = articleInfoForm.getLocallitpic();
						System.out.println(file.getFileSize());
						System.out.println( file.getFileName().substring(file.getFileName().lastIndexOf(".")) );
						String ext = "";
						if(file.getFileSize() > 0 && file.getFileSize() <= 3000000){
							ext = file.getFileName().substring(file.getFileName().lastIndexOf("."));
							if( ext.toLowerCase().equals(".jpg") || ext.toLowerCase().equals(".gif") 
									|| ext.toLowerCase().equals(".png") || ext.toLowerCase().equals(".jpeg") ) {
								 String litpic = new UploadFile().upload(file, request, "UploadFile/article", 400, 400);
								 System.out.println(litpic);
								 a.setLitpic(litpic);
							}
							else {
								request.setAttribute("FAIL_MESSAGE", "只能上传jpeg,jpg,gif,png类型图片!");
								return mapping.findForward("fail");
							}
							
						}
						else {
							request.setAttribute("FAIL_MESSAGE", "上传的图片过大，不能大于3M!");
							return mapping.findForward("fail");
						}
					}
				}
				else {
					
					if (articleInfoForm.getLitpicurl() != null && articleInfoForm.getLitpicurl().length() > 0) {
						a.setLitpic(articleInfoForm.getLitpicurl());
					}
					if (articleInfoForm.getLitpicurl2() != null && articleInfoForm.getLitpicurl2().length() > 0) {
						a.setLitpic(articleInfoForm.getLitpicurl2());
					}
					
				}
				
				articleListManager.addArticle(a);
				
			}
			else {
				request.setAttribute( "FAIL_MESSAGE", "系统存在和该标题的同名文章。" );
				return mapping.findForward("fail");
			}
			
			
			//生成静态页面
			boolean flag = ToHtml.toHtml(Constant.FORBES_URL + "/article/ArticleSearch.do?act=view&id="+a.getId(),
					request.getRealPath("/") + "article" + "/" + a.getId() + ".html", "gbk", "gbk");
			
			request.setAttribute( "OK_MESSAGE", "成功发布文章！" );
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]") );
		 	
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute( "FAIL_MESSAGE", "系统错误，请稍后再试。" );
			return mapping.findForward("fail");
		}
	}
	public ArticleListManager getArticleListManager() {
		return articleListManager;
	}
	public void setArticleListManager(ArticleListManager articleListManager) {
		this.articleListManager = articleListManager;
	}
	
	
	public ActionForward gettype(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String returnUrl = request.getParameter("returnUrl");
		String op        = request.getParameter("op");

		try {
		
			/*List list = articleTypeManager.getTopArticleType();			
			request.setAttribute( "ARTICLE_TYPE", list);*/
			request.setAttribute( "RETURN_URL", returnUrl );
			
			if( op.equals("add"))
				return mapping.findForward("add");
			else if( op.equals("edit")) {
				String id = request.getParameter("id");
				Article a = articleListManager.getArticle(Integer.parseInt(id));
				
				request.setAttribute( "ARTICLE", a);
				return mapping.findForward("edit");
			}
			else {
				request.setAttribute("FAIL_MESSAGE", "参数错误，请稍后再试。");
				return mapping.findForward("fail");
			}

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	
	public ArticleTypeManager getArticleTypeManager() {
		return articleTypeManager;
	}
	public void setArticleTypeManager(ArticleTypeManager articleTypeManager) {
		this.articleTypeManager = articleTypeManager;
	}
	
	
	public ActionForward edit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ArticleInfoForm articleInfoForm = (ArticleInfoForm) form;
		String returnUrl = request.getParameter("returnUrl");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(returnUrl);
		Article a = articleListManager.getArticle(articleInfoForm.getId());
		try {
			
			if(articleListManager.verifyTitle(articleInfoForm.getId(), articleInfoForm.getTitle().trim())) {
				
				a.setIsdelete("N");
				a.setUser( (UcMembers)request.getSession().getAttribute("ADMIN") );
				a.setUserip( request.getLocalAddr() );
				a.setPubdate( formatter.parse(articleInfoForm.getPubdate()) );
				a.setTitle( articleInfoForm.getTitle() );
				a.setContent( articleInfoForm.getContent() );
				//a.setClick( 0 );
				//a.setIscommend( new Short("0") );
				//a.setIsverify( new Short("0") );
				//a.setDigg( 0 );
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
				if (articleInfoForm.getShorttitle() !=null && articleInfoForm.getShorttitle().length() > 0 ) {
					a.setShorttitle(articleInfoForm.getShorttitle());
				}
				if (articleInfoForm.getShorttitle() == null || articleInfoForm.getShorttitle().length() == 0) {
					String shorttitle = ( articleInfoForm.getTitle().length() > 40)?
							articleInfoForm.getTitle().substring(0, 39):articleInfoForm.getTitle();
					a.setShorttitle( shorttitle );
				}
				if (articleInfoForm.getSource() != null && articleInfoForm.getSource().length() > 0) {
					a.setSource(articleInfoForm.getSource());
				}
				if (articleInfoForm.getWriter() != null && articleInfoForm.getWriter().length() > 0) {
					a.setWriter(articleInfoForm.getWriter());
				}
				if (articleInfoForm.getDescription() != null && articleInfoForm.getDescription().length() > 0) {
					a.setDescription(articleInfoForm.getDescription());
				}
				if (articleInfoForm.getLikeid() != null && articleInfoForm.getLikeid().length() > 0) {
					a.setLikeid(articleInfoForm.getLikeid());
				}
				if (articleInfoForm.getColor() != null && articleInfoForm.getColor().length() > 0) {
					a.setColor(articleInfoForm.getColor());
				}
				a.setKeywords( articleInfoForm.getKeywords() );
				
				System.out.println(articleInfoForm.getLitpictype());
				
				if ( articleInfoForm.getLitpictype() == 2 ) { //本地上传
					
					System.out.println( articleInfoForm.getLocallitpic() != null );
					
					if ( articleInfoForm.getLocallitpic() != null ) {
						FormFile file   = articleInfoForm.getLocallitpic();
						System.out.println(file.getFileSize());
						System.out.println( file.getFileName().substring(file.getFileName().lastIndexOf(".")) );
						String ext = "";
						if(file.getFileSize() > 0 && file.getFileSize() <= 3000000){
							ext = file.getFileName().substring(file.getFileName().lastIndexOf("."));
							if( ext.toLowerCase().equals(".jpg") || ext.toLowerCase().equals(".gif") 
									|| ext.toLowerCase().equals(".png") || ext.toLowerCase().equals(".jpeg") ) {
								 String litpic = new UploadFile().upload(file, request, "UploadFile/article", 400, 400);
								 System.out.println(litpic);
								 a.setLitpic(litpic);
							}
							else {
								request.setAttribute("FAIL_MESSAGE", "只能上传jpeg,jpg,gif,png类型图片!");
								return mapping.findForward("fail");
							}
							
						}
						else {
							request.setAttribute("FAIL_MESSAGE", "上传的图片过大，不能大于3M!");
							return mapping.findForward("fail");
						}
					}
				}
				else {
					
					if (articleInfoForm.getLitpicurl() != null && articleInfoForm.getLitpicurl().length() > 0) {
						a.setLitpic(articleInfoForm.getLitpicurl());
					}
					if (articleInfoForm.getLitpicurl2() != null && articleInfoForm.getLitpicurl2().length() > 0) {
						a.setLitpic(articleInfoForm.getLitpicurl2());
					}
					
				}
				
				articleListManager.updateArticle(a);
				
			}
			else {
				request.setAttribute( "FAIL_MESSAGE", "系统存在和该标题的同名文章。" );
				return mapping.findForward("fail");
			}
			
			
			//生成静态页面
			boolean flag = ToHtml.toHtml(Constant.FORBES_URL + "/article/ArticleSearch.do?act=view&id="+a.getId(),
					request.getRealPath("/") + "article/" + a.getId() + ".html", "gbk", "gbk");
			//System.out.println(str);
			
			
			request.setAttribute( "OK_MESSAGE", "修改文章成功！" );
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]") );
		 	
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute( "FAIL_MESSAGE", "系统错误，请稍后再试。" );
			return mapping.findForward("fail");
		}
	}



	
	
}