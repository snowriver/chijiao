package com.forbes.struts.action.admin;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import com.forbes.hibernate.bean.Article;
import com.forbes.hibernate.bean.ArticleContent;
import com.forbes.hibernate.bean.ArticleType;
import com.forbes.hibernate.bean.UcMembers;
import com.forbes.listener.FileUploadListener;
import com.forbes.service.article.ArticleTypeManager;
import com.forbes.service.article.ArticleListManager;
import com.forbes.struts.form.admin.AdminUploadFileForm;
import com.forbes.util.ToHtml;
import com.forbes.util.UploadFile;
import com.forbes.util.UrlTool;

public class AdminBatchAddArticleAction extends DispatchAction {
	
	private ArticleListManager articleListManager;

	private ArticleTypeManager articleTypeManager;
		
	public ActionForward url(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String fromUrl = request.getParameter("url");
		String returnUrl = request.getParameter("returnUrl");
		try {
			URL url = new URL(fromUrl);// 建立URL对象，并实例化为url，获得要抓取的网页地址
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					url.openStream(), "gbk"));// 建立BufferedReader对象，并实例化为reader，这里的GB2312是要抓取的网页编码格式
			String line;
			String content = "";
			while ((line = reader.readLine()) != null) {
				content += line + "\n";
				// content += line;
			}
			reader.close();

			/*
			 * Writer out = new BufferedWriter(new OutputStreamWriter( new
			 * FileOutputStream(toUrl), "UTF8")); out.write(content);
			 * out.close();
			 */
			String title = content.substring(content
					.indexOf("<font size=5 ><br>") + 33, content
					.indexOf("</font></span></div></td>"));

			String articleContent = content
					.substring(
							content
									.indexOf("font-size: 10.5pt;font-weight:normal ;LINE-HEIGHT: 22px;margin:15px 25px;") + 75,
							content.indexOf("<!-- 发给好友 -->") - 65);

			String tag = content
					.substring(
							content.indexOf("标签:") + 4,
							content
									.indexOf("font-size: 10.5pt;font-weight:normal ;LINE-HEIGHT: 22px;margin:15px 25px;") - 40);

			tag = tag.replace("<A HREF=/cgi-bin/listag.cgi?k=", " ");
			tag = tag.replace("&t=1 Target=_blank>", "");
			tag = tag.replace("&t=2 Target=_blank>", "");
			tag = tag.replace("</A>", "");
			System.out.println(tag);

			request.setAttribute("TITLE", title);
			request.setAttribute("CONTENT", articleContent);
			request.setAttribute("TAG", tag);
			request.setAttribute("RETURN_URL", new UrlTool().getUrl2(returnUrl,
					"[|]"));
			return mapping.findForward("ok");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("FAIL_MESSAGE", "系统错误，请稍后再试。");
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

	public ActionForward access(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		AdminUploadFileForm adminUploadFileForm = (AdminUploadFileForm) form;
		//String returnUrl = request.getParameter("returnUrl");
		//java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// System.out.println(returnUrl);
		UcMembers member = (UcMembers) request.getSession().getAttribute("ADMIN");

		if (adminUploadFileForm.getFile() != null) {
			FormFile file = adminUploadFileForm.getFile();

			String ext = "";

			if (file.getFileSize() > 0 && file.getFileSize() <= 100000000) {
				System.out.println(" 大小：" + file.getFileSize());
				System.out.println(" 后缀："
						+ file.getFileName().substring(
								file.getFileName().lastIndexOf(".")));

				ext = file.getFileName().substring(
						file.getFileName().lastIndexOf("."));
				if (ext.toLowerCase().equals(".mdb")) {
					String accessurl = UploadFile.upload(file, request,
							"UploadFile/access");
					System.out.println(accessurl);

					//
					// String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
					String url = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="
							+ accessurl;

					String sql = "select 标题,内容,摘要 from content ";

					// String url = "jdbc:odbc:Driver={MicroSoft Access Driver
					// *.mdb)};DBQ = Northwind.mdb";
					String username = "";
					String password = "";
					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;
					int addCnt = 0;
					int totalCnt = 0;
					try {
						Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
						conn = DriverManager.getConnection(url, username,
								password);
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);

						while (rs.next()) {
							String title = rs.getString(1);
							String content = rs.getString(2);
							String description = rs.getString(3);

							if (articleListManager.verifyTitle(title.trim()) &&
									title!=null && title.length() >0 &&
									content !=null && content.length() >0) {

								Article a = new Article();

								ArticleContent ac = new ArticleContent();
								ac.setContent(content);

								a.setIsdelete("N");
								a.setUserid(member.getUid());
								a.setUsername(member.getUsername());
								a.setUserip(request.getLocalAddr());
								a.setArticleContent(ac);
								a.setPubdate(new Date());
								a.setLastpost(new Date());
								a.setTitle(title);
								a.setIsbuild((short)0);
								if (title.length() > 40) {
									a.setShorttitle( title.substring(0, 39) );
								}
								else {
									a.setShorttitle( title );
								}
								
								if (description!=null && description.length() > 0) {
									if (description.length() > 250) {
										a.setDescription( description.substring(0, 248) );
									}
									else if (description.length() > 1 && description.length() <250) {
										a.setDescription( description );
									}
								}
								
								
								a.setClick(0);
								a.setIscommend((short)0);
								a.setIsverify((short)1);
								a.setDigg(0);

								if (adminUploadFileForm.getType() != null) {
									ArticleType at = articleTypeManager
											.getArticleType(Integer
													.parseInt(adminUploadFileForm
															.getType()));
									a.setArticleType(at);
								}
								
								if (adminUploadFileForm.getTypeid() != null &&
										adminUploadFileForm.getTypeid().trim() != "0"	) {
									ArticleType at = articleTypeManager
											.getArticleType(Integer
													.parseInt(adminUploadFileForm
															.getTypeid().trim()));
									a.setArticleType2(at);
								}

								ac.setArticle(a);
								articleListManager.addArticle(a);
								articleListManager.addArticleContent(ac);
								System.out.println(title.trim());
								// System.out.println(rs.getString(2));
								// System.out.println();
								
								boolean txtFlag = ToHtml.toTxt(content,
										request.getRealPath("/") + "article/txt/" + a.getId() + ".txt", 
										"gbk");
								
								addCnt++;
								totalCnt++;

							} else
								totalCnt++;

						}

					} catch (SQLException e) {
						e.printStackTrace();
					} catch (ClassNotFoundException ex) {
						ex.printStackTrace();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					//
					request.setAttribute("RESULT_MESSAGE", "数据库共" + totalCnt
							+ "条记录，成功添加" + addCnt + "条记录");
					return mapping.findForward("access");
				} else {
					request.setAttribute("FAIL_MESSAGE", "只能上传Access文件!");
					return mapping.findForward("fail");
				}

			} else {
				request.setAttribute("FAIL_MESSAGE",
						"请选择上传的文件或者您上传的文件过大，不能大于100M!");
				return mapping.findForward("fail");
			}
		
	}
	
	public ActionForward upload(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		//String returnUrl = request.getParameter("returnUrl");
		//java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// System.out.println(returnUrl);
		String filePath = (String) request.getSession().getAttribute("FILE_PATH");

		if (filePath !=null && filePath.length() >0);

			String ext = filePath.substring(filePath.indexOf("."));
				
				if (ext.toLowerCase().equals(".mdb")) {

					System.out.println(filePath);

					//
					// String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
					String url = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="
							+ filePath;

					String sql = "select 标题,内容,摘要 from content ";

					// String url = "jdbc:odbc:Driver={MicroSoft Access Driver
					// *.mdb)};DBQ = Northwind.mdb";
					String username = "";
					String password = "";
					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;
					int addCnt = 0;
					int totalCnt = 0;
					try {
						Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
						conn = DriverManager.getConnection(url, username,
								password);
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);

						while (rs.next()) {
							String title = rs.getString(1);
							String content = rs.getString(2);
							String description = rs.getString(3);

							if (articleListManager.verifyTitle(title.trim()) &&
									title!=null && title.length() >0 &&
									content !=null && content.length() >0) {

								Article a = new Article();

								ArticleContent ac = new ArticleContent();
								ac.setContent(content);

								a.setIsdelete("N");
								a.setUserid(member.getUid());
								a.setUsername(member.getUsername());
								a.setUserip(request.getLocalAddr());
								a.setArticleContent(ac);
								a.setPubdate(new Date());
								a.setLastpost(new Date());
								a.setTitle(title);
								a.setIsbuild((short)0);
								if (title.length() > 40) {
									a.setShorttitle( title.substring(0, 39) );
								}
								else {
									a.setShorttitle( title );
								}
								
								if (description!=null && description.length() > 0) {
									if (description.length() > 250) {
										a.setDescription( description.substring(0, 248) );
									}
									else if (description.length() > 1 && description.length() <250) {
										a.setDescription( description );
									}
								}
																
								a.setClick(0);
								a.setIscommend((short)0);
								a.setIsverify((short)1);
								a.setDigg(0);

								if (adminUploadFileForm.getType() != null) {
									ArticleType at = articleTypeManager
											.getArticleType(Integer
													.parseInt(adminUploadFileForm
															.getType()));
									a.setArticleType(at);
								}
								
								if (adminUploadFileForm.getTypeid() != null &&
										adminUploadFileForm.getTypeid().trim() != "0"	) {
									ArticleType at = articleTypeManager
											.getArticleType(Integer
													.parseInt(adminUploadFileForm
															.getTypeid().trim()));
									a.setArticleType2(at);
								}

								ac.setArticle(a);
								articleListManager.addArticle(a);
								articleListManager.addArticleContent(ac);
								System.out.println(title.trim());
								// System.out.println(rs.getString(2));
								// System.out.println();
								
								if( ToHtml.toTxt(content,
										request.getRealPath("/") + "article/txt/" + a.getId() + ".txt", 
										"gbk") ){
									a.setIsbuild((short)1);
									articleListManager.updateArticle(a);
								}
								
								addCnt++;
								totalCnt++;

							} else
								totalCnt++;

						}

					} catch (SQLException e) {
						e.printStackTrace();
					} catch (ClassNotFoundException ex) {
						ex.printStackTrace();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					//
					request.setAttribute("RESULT_MESSAGE", "数据库共" + totalCnt
							+ "条记录，成功添加" + addCnt + "条记录");
					return mapping.findForward("access");
				} else {
					request.setAttribute("FAIL_MESSAGE", "只能上传Access文件!");
					return mapping.findForward("fail");
				}

			
		}
	
	}

}