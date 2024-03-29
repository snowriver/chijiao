/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.video;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.forbes.hibernate.bean.Video;
import com.forbes.service.video.VideoListManager;
import com.forbes.util.Pager;



/** 
 * MyEclipse Struts
 * Creation date: 09-20-2008
 * 
 * XDoclet definition:
 * @struts.action scope="request" validate="true"
 */
public class VideoSearchAction extends DispatchAction {
	/*
	 * Generated Methods
	 */
	//private VideoTypeManager videoTypeManager;
	
	private VideoListManager videoListManager;
	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward index(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {				
		try {
			List list = videoListManager.getTopVideoByVideoType(null, null, 0, 8);
			request.setAttribute( "VIDEO_LIST", list);			
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
			
			List list = videoListManager.getTopVideoByVideoType(typeid, null, 0, 8);
			request.setAttribute( "VIDEO_LIST", list);
			
			List commendlist = videoListManager.getTopVideoByVideoType(typeid, "iscommend Desc", 0, 3);
			/*if(commendlist.size()==0)
				commendlist = videoListManager.getTopVideoByVideoType(null, "iscommend Desc", 0, 3);*/
			request.setAttribute( "COMMEND_VIDEO_LIST", commendlist);
			return mapping.findForward("type");

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
	public VideoListManager getVideoListManager() {
		return videoListManager;
	}
	public void setVideoListManager(VideoListManager videoListManager) {
		this.videoListManager = videoListManager;
	}
	
	public ActionForward top(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//System.out.println(" show top video list...");

		String typeid = request.getParameter("type");
		String orderby   = request.getParameter("orderby");
		try {
			
			List list = videoListManager.getTopVideoByVideoType(typeid, orderby, 0, 5);

			request.setAttribute( "VIDEO_LIST", list);
			//System.out.println(list.size());
			
			return mapping.findForward("top");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
	
	public ActionForward like(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		
		String  id = request.getParameter("id");
		
		
		try {
			
			Video video = videoListManager.getVideo(Integer.parseInt(id));
			List list = null;
						
			String likeid = video.getLikeid();
			if( likeid != null ){
				likeid = likeid.replaceAll(",", "_");
				likeid = likeid.replaceAll(" ", "_");
				list = videoListManager.getLikeVideo(likeid, "pubdate DESC", 0, 10);
			}
			else {
				if( video.getVideoType2() != null)
					list = videoListManager.getTopVideoByVideoType(video.getVideoType2().getId().toString(), "pubdate DESC", 0, 5);
				if( video.getVideoType2() == null && video.getVideoType() != null)
					list = videoListManager.getTopVideoByVideoType(video.getVideoType().getId().toString(), "pubdate DESC", 0, 5);
				if(list==null || list.size() < 1)
					list = videoListManager.getTopVideoByVideoType(video.getVideoType2().getId().toString(), "pubdate DESC", 0, 5);
			}
			
			//System.out.println(" like video size = " + list.size());
			request.setAttribute( "VIDEO_LIST", list);

			return mapping.findForward("top");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
	
	public ActionForward indextop(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//System.out.println(" show top video list...");

		String typeid = request.getParameter("type");
		String orderby   = request.getParameter("orderby");
		try {
			
			List list = videoListManager.getTopVideoByVideoType(typeid, orderby, 0, 6);

			List commendlist = videoListManager.getTopVideoByVideoType(null, "iscommend Desc", 0, 3);
			
			
			request.setAttribute( "COMMEND_VIDEO_LIST", commendlist);
			
			request.setAttribute( "VIDEO_LIST", list);
			//System.out.println(list.size());
			
			return mapping.findForward("indextop");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
	
	public ActionForward hot(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			List list = videoListManager.getTopVideoByVideoType(null, null, 0, 8);

			request.setAttribute( "VIDEO_LIST", list);
			//System.out.println(list.size());
			
			return mapping.findForward("hot");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
	
	
	public ActionForward search(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String keyword   = request.getParameter("keyword");
		String orderby   = request.getParameter("orderby");
		String pageNo    = request.getParameter("pno");
		String typeid	 = request.getParameter("typeid");
		
		Map map = new TreeMap();
		map.put("keyword", keyword);
		map.put("orderby", orderby);
		map.put("typeid", typeid);
		
		try {
			int iPageNo = 1;
			try {
				if( pageNo != null ){
					iPageNo = Integer.parseInt( pageNo );
				}
			} catch( Exception e ){ }

			List list = null;
			Pager pager = new Pager();
			pager.setCntOfPage( 5 );
			pager.setCurPage( iPageNo );
			
			list = videoListManager.getVideoByPage(pager, iPageNo, "N", null, typeid, keyword, orderby);
			
			List commendlist = videoListManager.getTopVideoByVideoType(typeid, "iscommend Desc", 0, 3);
			
			/*if(commendlist.size()==0)
				commendlist = videoListManager.getTopVideoByVideoType(null, "iscommend Desc", 0, 3);*/
			
			request.setAttribute( "PARA", map );
			request.setAttribute( "PAGER", pager );
			request.setAttribute( "VIDEO_LIST", list);
			request.setAttribute( "COMMEND_VIDEO_LIST", commendlist);
			
			return mapping.findForward("search");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "ϵͳ�������Ժ����ԡ�");
			return mapping.findForward("fail");
		}
	}
}