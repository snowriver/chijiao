package com.forbes.listener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ProgressListener;

public class FileUploadListener implements ProgressListener {
	
	private HttpSession session;

	public FileUploadListener(HttpServletRequest req) {
		session = req.getSession();
		FileUploadStatus status = new FileUploadStatus();
		session.setAttribute("FILE_UPLOAD_STATUS", status);
	}

	public void update(long pBytesRead, long pContentLength, int pItems) {
		// TODO Auto-generated method stub
		FileUploadStatus status = (FileUploadStatus) session.getAttribute("FILE_UPLOAD_STATUS");
		status.setPBytesRead(pBytesRead);
		status.setPContentLength(pContentLength);
		status.setPItems(pItems);
	}

}
