package com.forbes.struts.action.admin;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
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
import com.forbes.listener.FileUploadListener;


public class AdminUploadFileAction extends DispatchAction {
	
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(2048*1024);
		FileUploadListener getBarListener = new FileUploadListener(request);
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setProgressListener(getBarListener);
		try {
			List formList = upload.parseRequest(request);
			Iterator<Object> formItem = formList.iterator();
			
			while (formItem.hasNext()) {
				FileItem item = (FileItem) formItem.next();
				if (item.isFormField()) {
					System.out.println("Field Name:" + item.getFieldName());
				} else {
					String fileName = item.getName().substring(item.getName().lastIndexOf("\\")+1);
					
					String filePath     = request.getRealPath("/") + "UploadFile/access";//取當前系统路径
					
					System.out.println(filePath);
					File file = new File(filePath + "\\" + fileName);
					System.out.println(filePath	+ "\\" + fileName);
					OutputStream out = item.getOutputStream();
					InputStream in = item.getInputStream();
					request.getSession().setAttribute("outPutStream", out);
					request.getSession().setAttribute("inPutStream", in);
					item.write(file);
					request.getSession().setAttribute("FILE_PATH", filePath + "\\" + fileName);
				}
			}
		} catch (FileUploadException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}