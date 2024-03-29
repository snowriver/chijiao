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

import com.forbes.hibernate.bean.SearchKeyword;
import com.forbes.hibernate.bean.Video;
import com.forbes.hibernate.bean.VideoUrl;
import com.forbes.service.video.VideoListManager;
import com.forbes.service.video.VideoUrlManager;
import com.forbes.util.Pager;
import com.forbes.util.UrlTool;


/** 
 * MyEclipse Struts
 * Creation date: 09-20-2008
 * 
 * XDoclet definition:
 * @struts.action scope="request" validate="true"
 */
public class AdminUpdateVideoUrlAction extends DispatchAction {
	/*
	 * Generated Methods
	 */
	private VideoUrlManager videoUrlManager;
	private VideoListManager videoListManager;
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

		String pageNo    = request.getParameter("pno");
		String videoid   = request.getParameter("videoid");
		String keyword   = request.getParameter("keyword");
		String orderby   = request.getParameter("orderby");
		
		String parameter = "keyword=" + ( (keyword==null)?"":keyword ) +
		   				   "&orderby=" + ( (orderby==null)?"":orderby ) +
		   				   "&videoid=" + ( (videoid==null)?"":videoid );
		
		Map map = new TreeMap();
		map.put("keyword", keyword);
		map.put("orderby", orderby);
		map.put("videoid", videoid);
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
			list = videoUrlManager.getVideoUrlByPage(pager, iPageNo, videoid, keyword, orderby);
			
			Video video = videoListManager.getVideo(Integer.parseInt(videoid));
			request.setAttribute( "VIDEO", video );
			
			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "VIDEO_URL_LIST", list);
			return mapping.findForward("list");
		} catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		
		String videoid      = request.getParameter("videoid");
		String title      	= request.getParameter("title");
		String width    	= request.getParameter("width");
		String height    	= request.getParameter("height");
		String fromweb    	= request.getParameter("fromweb");
		String url 		    = request.getParameter("url");
		String returnUrl    = request.getParameter("returnUrl");
		
		try {
			
			Video video = videoListManager.getVideo(Integer.parseInt(videoid));
			
			VideoUrl vu = new VideoUrl();
			vu.setVideo(video);
			vu.setTitle(title);
			if(width !=null && width.endsWith("") )
				vu.setWidth( Integer.parseInt(width) );
			if(height !=null && height.endsWith("") )
				vu.setHeight( Integer.parseInt(height) );
			vu.setFromweb(fromweb);
			vu.setUrl(url);

			videoUrlManager.addVideoUrl(vu);
			
			request.setAttribute( "OK_MESSAGE", "添加视频URL成功！");

			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]"));
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	
	
	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		
		String id      		= request.getParameter("id");
		String title      	= request.getParameter("title");
		String width    	= request.getParameter("width");
		String height    	= request.getParameter("height");
		String fromweb    	= request.getParameter("fromweb");
		String url 		    = request.getParameter("url");
		String returnUrl    = request.getParameter("returnUrl");
		
		try {
			
			VideoUrl vu = videoUrlManager.getVideoUrl(Integer.parseInt(id));
			
			vu.setTitle(title);
			if(width !=null && width.endsWith("") )
				vu.setWidth( Integer.parseInt(width) );
			if(height !=null && height.endsWith("") )
				vu.setHeight( Integer.parseInt(height) );
			//vu.setFromweb(fromweb);
			vu.setUrl(url);
			videoUrlManager.updateVideoUrl(vu);
			request.setAttribute( "OK_MESSAGE", "修改视频URL成功！");
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]"));
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		
		String id       = request.getParameter("id");
		String returnUrl = request.getParameter("returnUrl");
		
		try {
		
			VideoUrl vu = videoUrlManager.getVideoUrl(Integer.parseInt(id));
			//System.out.println( "cid=" + c.getId() + "\tcname=" + c.getName() + "\tcpid=" + c.getPid());
			
			videoUrlManager.deleteVideoUrl(vu);
			request.setAttribute( "OK_MESSAGE", "删除视频URL成功！");
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]"));
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward batchdelete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String vus []   = request.getParameterValues("vus");
		String returnUrl = request.getParameter("returnUrl");
		
		try {
		
			for( int i=0; i< vus.length; i++) {
				
				VideoUrl vu = videoUrlManager.getVideoUrl(Integer.parseInt(vus[i]));
				videoUrlManager.deleteVideoUrl(vu);
			}

			request.setAttribute( "OK_MESSAGE", "批量删除视频成功！");
			
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]"));
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	
	public ActionForward get(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		
		String id        = request.getParameter("id");
		String returnUrl = request.getParameter("returnUrl");
		
		try {
			
			VideoUrl vu = videoUrlManager.getVideoUrl(Integer.parseInt(id));

			request.setAttribute( "VIDEO_URL", vu);
			request.setAttribute( "RETURN_URL", returnUrl);
			return mapping.findForward("get");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}


	
	
	
	

	public VideoUrlManager getVideoUrlManager() {
		return videoUrlManager;
	}

	public void setVideoUrlManager(VideoUrlManager videoUrlManager) {
		this.videoUrlManager = videoUrlManager;
	}

	public VideoListManager getVideoListManager() {
		return videoListManager;
	}

	public void setVideoListManager(VideoListManager videoListManager) {
		this.videoListManager = videoListManager;
	}


	
}