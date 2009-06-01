/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.Video;
import com.forbes.hibernate.bean.VideoType;
import com.forbes.service.video.VideoListManager;
import com.forbes.service.video.VideoTypeManager;
import com.forbes.struts.form.video.VideoInfoForm;
import com.forbes.util.Constant;
import com.forbes.util.FileAccess;
import com.forbes.util.UploadFile;
import com.forbes.util.UrlTool;

/** 
 * MyEclipse Struts
 * Creation date: 09-20-2008
 * 
 * XDoclet definition:
 * @struts.action scope="request" validate="true"
 */
public class AdminEditVideoAction extends DispatchAction {
	/*
	 * Generated Methods
	 */
	private VideoListManager videoListManager;
	
	private VideoTypeManager videoTypeManager;
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
		VideoInfoForm videoInfoForm = (VideoInfoForm) form;
		String returnUrl = request.getParameter("returnUrl");
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(returnUrl);
		UcMembers user = (UcMembers)request.getSession().getAttribute("ADMIN");
		try {
			
			if(videoListManager.verifyTitle(videoInfoForm.getTitle().trim())) {
				Video v = new Video();
				v.setIsdelete("N");
				v.setUser( user );
				v.setUsername(user.getUsername());
				v.setUserip( request.getLocalAddr() );
				v.setPubdate( formatter.parse(videoInfoForm.getPubdate()) );
				v.setLastpost(new Date());
				v.setTitle( videoInfoForm.getTitle() );
				v.setContent( videoInfoForm.getContent() );
				/*v.setVideourl( videoInfoForm.getVideourl() );
				v.setWidth( videoInfoForm.getWidth() );
				v.setHeight( videoInfoForm.getHeight() );*/
				v.setClick( 0 );
				v.setIscommend( new Short("0") );
				v.setIsverify( new Short("0") );
				v.setDigg( 0 );
				v.setLitpictype(videoInfoForm.getLitpictype());
				
				if (videoInfoForm.getIscommend() !=null ) 
					v.setIscommend(videoInfoForm.getIscommend());
				if (videoInfoForm.getIsverify() !=null ) 
					v.setIsverify(videoInfoForm.getIsverify());
				if (videoInfoForm.getMaintypeid() !=null ) {
					VideoType at = videoTypeManager.getVideoType(videoInfoForm.getMaintypeid());
					v.setVideoType(at);
				}
				if (videoInfoForm.getTypeid() !=null ) {
					VideoType at = videoTypeManager.getVideoType(videoInfoForm.getTypeid());
					v.setVideoType2(at);
				}
				if (videoInfoForm.getShorttitle() !=null && videoInfoForm.getShorttitle().length() > 0 ) {
					v.setShorttitle(videoInfoForm.getShorttitle());
				}
				if (videoInfoForm.getShorttitle() == null || videoInfoForm.getShorttitle().length() == 0) {
					String shorttitle = ( videoInfoForm.getTitle().length() > 40)?
							videoInfoForm.getTitle().substring(0, 39):videoInfoForm.getTitle();
					v.setShorttitle( shorttitle );
				}
				if (videoInfoForm.getSource() != null && videoInfoForm.getSource().length() > 0) {
					v.setSource(videoInfoForm.getSource());
				}
				if (videoInfoForm.getWriter() != null && videoInfoForm.getWriter().length() > 0) {
					v.setWriter(videoInfoForm.getWriter());
				}
				if (videoInfoForm.getDescription() != null && videoInfoForm.getDescription().length() > 0) {
					v.setDescription(videoInfoForm.getDescription());
				}
				if (videoInfoForm.getLikeid() != null && videoInfoForm.getLikeid().length() > 0) {
					v.setLikeid(videoInfoForm.getLikeid());
				}
				if (videoInfoForm.getColor() != null && videoInfoForm.getColor().length() > 0) {
					v.setColor(videoInfoForm.getColor());
				}
				v.setKeywords( videoInfoForm.getKeywords() );
				
				System.out.println(videoInfoForm.getLitpictype());
				
				if ( videoInfoForm.getLitpictype() == 2 ) { //本地上传
					
					System.out.println( videoInfoForm.getLocallitpic() != null );
					
					if ( videoInfoForm.getLocallitpic() != null ) {
						FormFile file   = videoInfoForm.getLocallitpic();
						System.out.println(file.getFileSize());
						System.out.println( file.getFileName().substring(file.getFileName().lastIndexOf(".")) );
						String ext = "";
						if(file.getFileSize() > 0 && file.getFileSize() <= 3000000){
							ext = file.getFileName().substring(file.getFileName().lastIndexOf("."));
							if( ext.toLowerCase().equals(".jpg") || ext.toLowerCase().equals(".gif") 
									|| ext.toLowerCase().equals(".png") || ext.toLowerCase().equals(".jpeg") ) {
								 String litpic = UploadFile.upload(file, request, "UploadFile/video", 400, 400);
								 System.out.println(litpic);
								 v.setLitpic(litpic);
								 
								 FileAccess.Copy(request.getRealPath("/") + litpic, 
										 Constant.APPSERV_VIRTUAL_ADDRESS + "\\" + litpic);
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
					
					System.out.println("xx");
					
					if (videoInfoForm.getLitpicurl() != null && videoInfoForm.getLitpicurl().length() > 0) {
						v.setLitpic(videoInfoForm.getLitpicurl());
					}
					if (videoInfoForm.getLitpicurl2() != null && videoInfoForm.getLitpicurl2().length() > 0) {
						v.setLitpic(videoInfoForm.getLitpicurl2());
					}
					
				}
				
				videoListManager.addVideo(v);
				
			}
			else {
				request.setAttribute( "FAIL_MESSAGE", "系统存在和该标题的同名视频。" );
				return mapping.findForward("fail");
			}
			
			
			//
			
			request.setAttribute( "OK_MESSAGE", "成功发布视频！" );
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]") );
		 	
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute( "FAIL_MESSAGE", "系统错误，请稍后再试。" );
			return mapping.findForward("fail");
		}
	}
	public VideoListManager getVideoListManager() {
		return videoListManager;
	}
	public void setVideoListManager(VideoListManager videoListManager) {
		this.videoListManager = videoListManager;
	}
	
	
	public ActionForward gettype(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String returnUrl = request.getParameter("returnUrl");
		String op        = request.getParameter("op");

		try {
		
			List list = videoTypeManager.getTopVideoType();			
			request.setAttribute( "VIDEO_TYPE", list);
			request.setAttribute( "RETURN_URL", returnUrl );
			
			if( op.equals("add"))
				return mapping.findForward("add");
			else if( op.equals("edit")) {
				String id = request.getParameter("id");
				Video v = videoListManager.getVideo(Integer.parseInt(id));
				
				request.setAttribute( "VIDEO", v);
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
	
	public VideoTypeManager getVideoTypeManager() {
		return videoTypeManager;
	}
	public void setVideoTypeManager(VideoTypeManager videoTypeManager) {
		this.videoTypeManager = videoTypeManager;
	}
	
	
	public ActionForward edit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		VideoInfoForm videoInfoForm = (VideoInfoForm) form;
		String returnUrl = request.getParameter("returnUrl");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(returnUrl);
		try {
			
			if(videoListManager.verifyTitle(videoInfoForm.getId(), videoInfoForm.getTitle().trim())) {
				Video v = videoListManager.getVideo(videoInfoForm.getId());
				v.setIsdelete("N");
				v.setUser( (UcMembers)request.getSession().getAttribute("ADMIN") );
				v.setUserip( request.getLocalAddr() );
				v.setPubdate( formatter.parse(videoInfoForm.getPubdate()) );
				v.setTitle( videoInfoForm.getTitle() );
				v.setContent( videoInfoForm.getContent() );
				v.setLastpost(new Date());
				/*v.setVideourl( videoInfoForm.getVideourl() );
				v.setWidth( videoInfoForm.getWidth() );
				v.setHeight( videoInfoForm.getHeight() );*/
				v.setClick( 0 );
				v.setIscommend( new Short("0") );
				v.setIsverify( new Short("0") );
				v.setDigg( 0 );
				if (videoInfoForm.getIscommend() !=null ) 
					v.setIscommend(videoInfoForm.getIscommend());
				if (videoInfoForm.getIsverify() !=null ) 
					v.setIsverify(videoInfoForm.getIsverify());
				if (videoInfoForm.getMaintypeid() !=null ) {
					VideoType at = videoTypeManager.getVideoType(videoInfoForm.getMaintypeid());
					v.setVideoType(at);
				}
				if (videoInfoForm.getTypeid() !=null ) {
					VideoType at = videoTypeManager.getVideoType(videoInfoForm.getTypeid());
					v.setVideoType2(at);
				}
				if (videoInfoForm.getShorttitle() !=null && videoInfoForm.getShorttitle().length() > 0 ) {
					v.setShorttitle(videoInfoForm.getShorttitle());
				}
				if (videoInfoForm.getShorttitle() == null || videoInfoForm.getShorttitle().length() == 0) {
					String shorttitle = ( videoInfoForm.getTitle().length() > 40)?
							videoInfoForm.getTitle().substring(0, 39):videoInfoForm.getTitle();
					v.setShorttitle( shorttitle );
				}
				if (videoInfoForm.getSource() != null && videoInfoForm.getSource().length() > 0) {
					v.setSource(videoInfoForm.getSource());
				}
				if (videoInfoForm.getWriter() != null && videoInfoForm.getWriter().length() > 0) {
					v.setWriter(videoInfoForm.getWriter());
				}
				if (videoInfoForm.getDescription() != null && videoInfoForm.getDescription().length() > 0) {
					v.setDescription(videoInfoForm.getDescription());
				}
				if (videoInfoForm.getLikeid() != null && videoInfoForm.getLikeid().length() > 0) {
					v.setLikeid(videoInfoForm.getLikeid());
				}
				if (videoInfoForm.getColor() != null && videoInfoForm.getColor().length() > 0) {
					v.setColor(videoInfoForm.getColor());
				}
				v.setKeywords( videoInfoForm.getKeywords() );
				
				System.out.println(videoInfoForm.getLitpictype());
				
				if ( videoInfoForm.getLitpictype() == 2 ) { //本地上传
					
					System.out.println( videoInfoForm.getLocallitpic() != null );
					
					if ( videoInfoForm.getLocallitpic() != null ) {
						FormFile file   = videoInfoForm.getLocallitpic();
						System.out.println(file.getFileSize());
						System.out.println( file.getFileName().substring(file.getFileName().lastIndexOf(".")) );
						String ext = "";
						if(file.getFileSize() > 0 && file.getFileSize() <= 3000000){
							ext = file.getFileName().substring(file.getFileName().lastIndexOf("."));
							if( ext.toLowerCase().equals(".jpg") || ext.toLowerCase().equals(".gif") 
									|| ext.toLowerCase().equals(".png") || ext.toLowerCase().equals(".jpeg") ) {
								 String litpic = UploadFile.upload(file, request, "UploadFile/video", 400, 400);
								 System.out.println(litpic);
								 v.setLitpic(litpic);
								 
								 System.out.println(request.getRealPath("/") + litpic);
								 System.out.println(Constant.APPSERV_VIRTUAL_ADDRESS + "\\" + litpic);
								 FileAccess.Copy(request.getRealPath("/") + litpic, 
										 Constant.APPSERV_VIRTUAL_ADDRESS + "\\" + litpic);
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
					
					if (videoInfoForm.getLitpicurl() != null && videoInfoForm.getLitpicurl().length() > 0) {
						v.setLitpic(videoInfoForm.getLitpicurl());
					}
					if (videoInfoForm.getLitpicurl2() != null && videoInfoForm.getLitpicurl2().length() > 0) {
						v.setLitpic(videoInfoForm.getLitpicurl2());
					}
					
				}
				
				videoListManager.updateVideo(v);
				
			}
			else {
				request.setAttribute( "FAIL_MESSAGE", "系统存在和该标题的同名视频。" );
				return mapping.findForward("fail");
			}
			
			
			//
			
			request.setAttribute( "OK_MESSAGE", "修改视频成功！" );
			request.setAttribute( "RETURN_URL", new UrlTool().getUrl2(returnUrl, "[|]") );
		 	
			return mapping.findForward("ok");

		}catch( Exception e ){
			e.printStackTrace();
			request.setAttribute( "FAIL_MESSAGE", "系统错误，请稍后再试。" );
			return mapping.findForward("fail");
		}
	}



	
	
}