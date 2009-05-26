/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.video;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.forbes.hibernate.bean.FavoriteType;
import com.forbes.hibernate.bean.Video;
import com.forbes.service.favorite.FavoriteManager;
import com.forbes.service.video.VideoListManager;




/** 
 * MyEclipse Struts
 * Creation date: 09-20-2008
 * 
 * XDoclet definition:
 * @struts.action scope="request" validate="true"
 */
public class VideoShowAction extends Action {
	/*
	 * Generated Methods
	 */
	//private VideoTypeManager videoTypeManager;
	
	private VideoListManager videoListManager;
	
	private FavoriteManager favoriteManager;
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
		
		System.out.print(id);
		try {
			
			Video video = videoListManager.getVideo(Integer.parseInt(id));
			video.setClick(video.getClick() + 1);
			videoListManager.updateVideo(video);
			request.setAttribute( "VIDEO", video);
			
			FavoriteType favoriteType = favoriteManager.getFavoriteType(new Short("3"));
			request.setAttribute( "FAVORITE_COUNT", favoriteManager.getFavoriteCount(favoriteType, id));
			
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
	public VideoListManager getVideoListManager() {
		return videoListManager;
	}
	public void setVideoListManager(VideoListManager videoListManager) {
		this.videoListManager = videoListManager;
	}
	public FavoriteManager getFavoriteManager() {
		return favoriteManager;
	}
	public void setFavoriteManager(FavoriteManager favoriteManager) {
		this.favoriteManager = favoriteManager;
	}
	
	
	
	
}