/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.video;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.forbes.hibernate.bean.Video;
import com.forbes.service.video.VideoListManager;
import com.forbes.util.MD5;




/** 
 * MyEclipse Struts
 * Creation date: 09-20-2008
 * 
 * XDoclet definition:
 * @struts.action scope="request" validate="true"
 */
public class VideoDiggAction extends Action {
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
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		
		String  id = request.getParameter("id");
		
		System.out.print(" Digg id = "+id);
		try {
			
			Video video = videoListManager.getVideo(Integer.parseInt(id));
			video.setDigg(video.getDigg() + 1);
			video.setDiggtime(new Date());
			videoListManager.updateVideo(video);
			
			//添加cookie
			/*try {
				
				Cookie c = new Cookie("FORBES_USER_DIGG", "");
				c.setMaxAge(60*60*24*365);
					response.addCookie(c);
		
			} catch(Exception e) {
				e.printStackTrace();
			}*/
			
			request.setAttribute( "RESULT_MESSAGE", video.getDigg());
			
			return mapping.findForward("ok");

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

	
	
	
	
}