package com.forbes.struts.action.admin;

import java.text.SimpleDateFormat;
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
import com.forbes.hibernate.bean.News;
import com.forbes.service.article.NewsManager;
import com.forbes.struts.form.article.NewsForm;
import com.forbes.util.Pager;
import com.forbes.util.UploadFile;
import com.forbes.util.UrlTool;


public class AdminManageNewsAction extends DispatchAction {
	
	private NewsManager newsManager;
	
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String pageNo     = request.getParameter("pno");
		String keyword    = request.getParameter("keyword");
		String orderby    = request.getParameter("orderby");
		
		String parameter = "&keyword=" + ( (keyword==null)?"":keyword ) +
						   "&orderby=" + ( (orderby==null)?"":orderby );
		
		Map map = new TreeMap();
		map.put("keyword", keyword);
		map.put("orderby", orderby);
		map.put("parameter", parameter);
		
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
		
			list = newsManager.getNewsByPage(pager, iPageNo, keyword, orderby);
			
			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "NEWS_LIST", list);
			return mapping.findForward("list");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	
	public NewsManager getNewsManager() {
		return newsManager;
	}

	public void setNewsManager(NewsManager newsManager) {
		this.newsManager = newsManager;
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
				System.out.println(id);
				News a = newsManager.getNews(Integer.parseInt(id));
				/*List acs = articleContentManager.gepArticleContentByArticle(a.getId());
				System.out.println("acs.size = "+acs.size());
				for(int j=0; j<acs.size(); j++) {
					ArticleContent ac = (ArticleContent)acs.get(j);
					System.out.println("ac.id = "+ac.getId() );
					articleContentManager.deleteArticleContent(ac);
				}*/
				newsManager.deleteNews(a);
			}
			
			request.setAttribute("OK_MESSAGE", "删除资讯成功！");
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
				News a = newsManager.getNews(Integer.parseInt(id));
				a.setIscommend(new Short("1"));
				newsManager.updateNews(a);
			}
			
			request.setAttribute("OK_MESSAGE", "推荐资讯成功！");
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]"));
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		NewsForm newsForm = (NewsForm) form;
		String returnUrl = request.getParameter("returnUrl");
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//System.out.println(returnUrl);
		try {
			
			if(newsManager.verifyTitle(newsForm.getTitle().trim())) {
				News a = new News();
				a.setIsdelete("N");
				a.setPubdate( formatter.parse(newsForm.getPubdate()) );
				a.setTitle( newsForm.getTitle() );
				a.setContent( newsForm.getContent() );
				a.setClick( 0 );
				a.setIscommend( new Short("0") );
				a.setDigg( 0 );
				if (newsForm.getIscommend() !=null ) 
					a.setIscommend(newsForm.getIscommend());
				if (newsForm.getShorttitle() !=null && newsForm.getShorttitle().length() > 0 ) {
					a.setShorttitle(newsForm.getShorttitle());
				}
				if (newsForm.getShorttitle() == null || newsForm.getShorttitle().length() == 0) {
					String shorttitle = ( newsForm.getTitle().length() > 40)?
							newsForm.getTitle().substring(0, 39):newsForm.getTitle();
					a.setShorttitle( shorttitle );
				}
				if (newsForm.getSource() != null && newsForm.getSource().length() > 0) {
					a.setSource(newsForm.getSource());
				}
				if (newsForm.getWriter() != null && newsForm.getWriter().length() > 0) {
					a.setWriter(newsForm.getWriter());
				}
				if (newsForm.getDescription() != null && newsForm.getDescription().length() > 0) {
					a.setDescription(newsForm.getDescription());
				}
				if (newsForm.getLikeid() != null && newsForm.getLikeid().length() > 0) {
					a.setLikeid(newsForm.getLikeid());
				}
				if (newsForm.getColor() != null && newsForm.getColor().length() > 0) {
					a.setColor(newsForm.getColor());
				}
				a.setKeywords( newsForm.getKeywords() );
				
				System.out.println(newsForm.getLitpictype());
				
				if ( newsForm.getLitpictype() == 2 ) { //本地上传
					
					System.out.println( newsForm.getLocallitpic() != null );
					
					if ( newsForm.getLocallitpic() != null ) {
						FormFile file   = newsForm.getLocallitpic();
						System.out.println(file.getFileSize());
						System.out.println( file.getFileName().substring(file.getFileName().lastIndexOf(".")) );
						String ext = "";
						if(file.getFileSize() > 0 && file.getFileSize() <= 3000000){
							ext = file.getFileName().substring(file.getFileName().lastIndexOf("."));
							if( ext.toLowerCase().equals(".jpg") || ext.toLowerCase().equals(".gif") 
									|| ext.toLowerCase().equals(".png") || ext.toLowerCase().equals(".jpeg") ) {
								 String litpic = UploadFile.upload(file, request, "UploadFile/news", 400, 400);
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
					
					if (newsForm.getLitpicurl() != null && newsForm.getLitpicurl().length() > 0) {
						a.setLitpic(newsForm.getLitpicurl());
					}
					if (newsForm.getLitpicurl2() != null && newsForm.getLitpicurl2().length() > 0) {
						a.setLitpic(newsForm.getLitpicurl2());
					}
					
				}
				
				newsManager.addNews(a);
				
			}
			else {
				request.setAttribute( "FAIL_MESSAGE", "系统存在和该标题的同名资讯。" );
				return mapping.findForward("fail");
			}
			
			
			//
			
			request.setAttribute( "OK_MESSAGE", "成功发布资讯！" );
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]") );
		 	
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute( "FAIL_MESSAGE", "系统错误，请稍后再试。" );
			return mapping.findForward("fail");
		}
	}

	
	public ActionForward get(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String returnUrl = request.getParameter("returnUrl");
		String id 		 = request.getParameter("id");
		
		try {
			News a = newsManager.getNews(Integer.parseInt(id));
			request.setAttribute( "NEWS", a);
			request.setAttribute( "RETURN_URL", returnUrl);
			return mapping.findForward("edit");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	
	
	public ActionForward edit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		NewsForm newsForm = (NewsForm) form;
		String returnUrl = request.getParameter("returnUrl");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(returnUrl);
		try {
			
			if(newsManager.verifyTitle(newsForm.getId(), newsForm.getTitle().trim())) {
				News a = newsManager.getNews(newsForm.getId());
				a.setIsdelete("N");
				a.setPubdate( formatter.parse(newsForm.getPubdate()) );
				a.setTitle( newsForm.getTitle() );
				a.setContent( newsForm.getContent() );
				a.setClick( 0 );
				a.setIscommend( new Short("0") );
				a.setDigg( 0 );
				if (newsForm.getIscommend() !=null ) 
					a.setIscommend(newsForm.getIscommend());
				if (newsForm.getShorttitle() !=null && newsForm.getShorttitle().length() > 0 ) {
					a.setShorttitle(newsForm.getShorttitle());
				}
				if (newsForm.getShorttitle() == null || newsForm.getShorttitle().length() == 0) {
					String shorttitle = ( newsForm.getTitle().length() > 40)?
							newsForm.getTitle().substring(0, 39):newsForm.getTitle();
					a.setShorttitle( shorttitle );
				}
				if (newsForm.getSource() != null && newsForm.getSource().length() > 0) {
					a.setSource(newsForm.getSource());
				}
				if (newsForm.getWriter() != null && newsForm.getWriter().length() > 0) {
					a.setWriter(newsForm.getWriter());
				}
				if (newsForm.getDescription() != null && newsForm.getDescription().length() > 0) {
					a.setDescription(newsForm.getDescription());
				}
				if (newsForm.getLikeid() != null && newsForm.getLikeid().length() > 0) {
					a.setLikeid(newsForm.getLikeid());
				}
				if (newsForm.getColor() != null && newsForm.getColor().length() > 0) {
					a.setColor(newsForm.getColor());
				}
				a.setKeywords( newsForm.getKeywords() );
				
				System.out.println(newsForm.getLitpictype());
				
				if ( newsForm.getLitpictype() == 2 ) { //本地上传
					
					System.out.println( newsForm.getLocallitpic() != null );
					
					if ( newsForm.getLocallitpic() != null ) {
						FormFile file   = newsForm.getLocallitpic();
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
					
					if (newsForm.getLitpicurl() != null && newsForm.getLitpicurl().length() > 0) {
						a.setLitpic(newsForm.getLitpicurl());
					}
					if (newsForm.getLitpicurl2() != null && newsForm.getLitpicurl2().length() > 0) {
						a.setLitpic(newsForm.getLitpicurl2());
					}
					
				}
				
				newsManager.updateNews(a);
				
			}
			else {
				request.setAttribute( "FAIL_MESSAGE", "系统存在和该标题的同名文章。" );
				return mapping.findForward("fail");
			}
			
			
			//
			
			request.setAttribute( "OK_MESSAGE", "修改资讯成功！" );
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]") );
		 	
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute( "FAIL_MESSAGE", "系统错误，请稍后再试。" );
			return mapping.findForward("fail");
		}
	}
	
	
	public ActionForward select(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String pageNo     = request.getParameter("pno");
		String keyword    = request.getParameter("keyword");
		String orderby    = request.getParameter("orderby");
		
		String parameter = "&keyword=" + ( (keyword==null)?"":keyword ) +
						   "&orderby=" + ( (orderby==null)?"":orderby );
		
		Map map = new TreeMap();
		map.put("keyword", keyword);
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
		
			list = newsManager.getNewsByPage(pager, iPageNo, keyword, orderby);
			
			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "NEWS_LIST", list);
			return mapping.findForward("select");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
}