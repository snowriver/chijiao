/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.forbes.struts.action.admin;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
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
import com.forbes.util.UrlTool;

/**
 * MyEclipse Struts Creation date: 09-20-2008
 * 
 * XDoclet definition:
 * 
 * @struts.action scope="request" validate="true"
 */
public class AdminBatchAddVideoUrlAction extends DispatchAction {
	/*
	 * Generated Methods
	 */
	// private ArticleListManager articleListManager;
	private VideoUrlManager videoUrlManager;
	private VideoListManager videoListManager;

	/**
	 * Method execute
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward url(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String fromUrl = request.getParameter("url");
		String returnUrl = request.getParameter("returnUrl");
		String videoid = request.getParameter("videoid");
		String fromweb = request.getParameter("fromweb");
		String page = request.getParameter("page");

		try {
			Video video = videoListManager.getVideo(Integer.parseInt(videoid));

			if ( page != null ) {
				for (int j = 1; j <= Integer.parseInt(page); j++) {
					URL readUrl = new URL(fromUrl + j + ".html");// 建立URL对象，并实例化为url，获得要抓取的网页地址
					BufferedReader reader = new BufferedReader(
							new InputStreamReader(readUrl.openStream(), "utf-8"));// 建立BufferedReader对象，并实例化为reader，这里的GB2312是要抓取的网页编码格式
					String line;
					String content = "";
					while ((line = reader.readLine()) != null) {
						content += line + "\n";
						// content += line;
					}
					reader.close();

					content = content.substring(content
							.indexOf("<div class=\"videos\">") + 25, content
							.indexOf("<!--videos end-->") - 15);
					content = content.trim();
					content.replace(" ", "");

					String urls[] = content.split("<ul class=\"video\">");

					for (int i = 0; i < urls.length; i++) {

						if (urls[i].length() > 20) {
							String url = urls[i].substring(urls[i]
									.indexOf("<li><h1><a href=") + 17, urls[i]
									.lastIndexOf("alt") - 2);
							String id = urls[i].substring(
									urls[i].indexOf("id=") + 17, urls[i]
											.lastIndexOf("display:none") - 9);

							String title = urls[i].substring(urls[i]
									.lastIndexOf("alt") + 5, urls[i]
									.lastIndexOf("title") - 2);

							String litpic = urls[i].substring(urls[i]
									.lastIndexOf("img src") + 9, urls[i]
									.indexOf("alt") - 2);

							// youku 新的播放URL
							String urlx = "http://player.youku.com/player.php/Type/Folder/Fid/"
									+ url.substring(31, 38)
									+ "/Ob/"
									+ url.substring(39, 40)
									+ "/Pt/"
									+ url.substring(41, 42)
									+ "/sid/"
									+ id
									+ "/v.swf";

							// youku 旧的播放URL
							// String urlxx =
							// "http://player.youku.com/player.php/sid/" + id +
							// "/v.swf";

							System.out.println(title);
							System.out.println(urlx);
							System.out.println(litpic);

							VideoUrl vu = new VideoUrl();
							vu.setVideo(video);
							vu.setTitle(title);
							vu.setFromweb(fromweb);
							vu.setUrl(urlx);
							vu.setLitpictype(new Short("4"));
							vu.setLitpic(litpic);
							videoUrlManager.addVideoUrl(vu);
						}
					}
				}
			}
			else {

				URL readUrl = new URL(fromUrl);// 建立URL对象，并实例化为url，获得要抓取的网页地址
				BufferedReader reader = new BufferedReader(
						new InputStreamReader(readUrl.openStream(), "utf-8"));// 建立BufferedReader对象，并实例化为reader，这里的GB2312是要抓取的网页编码格式
				String line;
				String content = "";
				while ((line = reader.readLine()) != null) {
					content += line + "\n";
					// content += line;
				}
				reader.close();

				content = content.substring(content
						.indexOf("<div class=\"videos\">") + 25, content
						.indexOf("<!--videos end-->") - 15);
				content = content.trim();
				content.replace(" ", "");

				String urls[] = content.split("<ul class=\"video\">");

				for (int i = 0; i < urls.length; i++) {

					if (urls[i].length() > 20) {
						String url = urls[i].substring(urls[i]
								.indexOf("<li><h1><a href=") + 17, urls[i]
								.lastIndexOf("alt") - 2);
						String id = urls[i].substring(
								urls[i].indexOf("id=") + 17, urls[i]
										.lastIndexOf("display:none") - 9);

						String title = urls[i].substring(urls[i]
								.lastIndexOf("alt") + 5, urls[i]
								.lastIndexOf("title") - 2);

						String litpic = urls[i].substring(urls[i]
								.lastIndexOf("img src") + 9, urls[i]
								.indexOf("alt") - 2);

						// youku 新的播放URL
						String urlx = "http://player.youku.com/player.php/Type/Folder/Fid/"
								+ url.substring(31, 38)
								+ "/Ob/"
								+ url.substring(39, 40)
								+ "/Pt/"
								+ url.substring(41, 42)
								+ "/sid/"
								+ id
								+ "/v.swf";

						// youku 旧的播放URL
						// String urlxx =
						// "http://player.youku.com/player.php/sid/" + id +
						// "/v.swf";

						System.out.println(title);
						System.out.println(urlx);
						System.out.println(litpic);

						VideoUrl vu = new VideoUrl();
						vu.setVideo(video);
						vu.setTitle(title);
						vu.setFromweb(fromweb);
						vu.setUrl(urlx);
						vu.setLitpictype(new Short("4"));
						vu.setLitpic(litpic);
						videoUrlManager.addVideoUrl(vu);
					}
				}
			}
			
			

			request.setAttribute("OK_MESSAGE", "添加视频URL成功！");
			request.setAttribute("RETURN_URL", new UrlTool().getUrl2(returnUrl,
					"[|]"));
			return mapping.findForward("ok");
		} catch (Exception e) {
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