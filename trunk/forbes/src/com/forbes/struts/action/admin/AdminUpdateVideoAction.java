/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.admin;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
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
public class AdminUpdateVideoAction extends DispatchAction {
	/*
	 * Generated Methods
	 */
	private VideoListManager videoListManager;
	
	/*private VideoUrlManager videoUrlManager;
	
	public VideoUrlManager getVideoUrlManager() {
		return videoUrlManager;
	}
	public void setVideoUrlManager(VideoUrlManager videoUrlManager) {
		this.videoUrlManager = videoUrlManager;
	}*/
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
		String keyword    = request.getParameter("keyword");
		String orderby    = request.getParameter("orderby");
		
		String parameter = "userid=" + ( (userid==null)?"":userid ) +
						   "&typeid=" + ( (typeid==null)?"":typeid ) +
						   "&keyword=" + ( (keyword==null)?"":keyword ) +
						   "&orderby=" + ( (orderby==null)?"":orderby ) +
						   "&deleteFlag=" + ( (deleteFlag==null)?"N":deleteFlag );
		
		Map map = new TreeMap();
		map.put("deleteFlag", deleteFlag);
		map.put("userid", userid);
		map.put("typeid", typeid);
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
		
			list = videoListManager.getVideoByPage(pager, iPageNo, deleteFlag, userid, typeid, keyword, orderby);
			
			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "VIDEO_LIST", list);
			return mapping.findForward("list");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}
	public VideoListManager getVideoListManager() {
		return videoListManager;
	}
	public void setVideoListManager(VideoListManager videoListManager) {
		this.videoListManager = videoListManager;
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
				Video a = videoListManager.getVideo(Integer.parseInt(id));
				
				/*Set <VideoUrl> videoUrls = a.getVideoUrls();
				for( VideoUrl vu : videoUrls ){
					videoUrlManager.deleteVideoUrl(vu);
				}*/
				
				a.setIsdelete("Y");
				videoListManager.updateVideo(a);
			}
			
			request.setAttribute("OK_MESSAGE", "删除视频成功！");
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
				Video a = videoListManager.getVideo(Integer.parseInt(id));
				a.setIsverify(new Short("1"));
				videoListManager.updateVideo(a);
			}
			
			request.setAttribute("OK_MESSAGE", "审核视频成功！");
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
				Video a = videoListManager.getVideo(Integer.parseInt(id));
				a.setIscommend(new Short("1"));
				videoListManager.updateVideo(a);
			}
			
			request.setAttribute("OK_MESSAGE", "推荐视频成功！");
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
		String orderby    = request.getParameter("orderby");
		
		String parameter = "userid=" + ( (userid==null)?"":userid ) +
						   "&typeid=" + ( (typeid==null)?"":typeid ) +
						   "&keyword=" + ( (keyword==null)?"":keyword ) +
						   "&orderby=" + ( (orderby==null)?"":orderby ) +
						   "&deleteFlag=" + ( (deleteFlag==null)?"N":deleteFlag );
		
		Map map = new TreeMap();
		map.put("deleteFlag", deleteFlag);
		map.put("userid", userid);
		map.put("typeid", typeid);
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
		
			list = videoListManager.getVideoByPage(pager, iPageNo, deleteFlag, userid, typeid, keyword, orderby);
			
			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "VIDEO_LIST", list);
			return mapping.findForward("select");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
			return mapping.findForward("fail");
		}
	}

	
	
}