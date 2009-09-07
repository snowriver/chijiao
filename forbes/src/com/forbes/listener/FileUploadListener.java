package com.forbes.listener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ProgressListener;

public class FileUploadListener implements ProgressListener {
	
	private HttpSession session;

	public FileUploadListener(HttpServletRequest req) {
		session = req.getSession();
		FileUploadStatus status = new FileUploadStatus();
		session.setAttribute("status", status);
	}

	public void update(long pBytesRead, long pContentLength, int pItems) {
		// TODO Auto-generated method stub
		FileUploadStatus status = (FileUploadStatus) session.getAttribute("status");
		status.setPBytesRead(pBytesRead);
		status.setPContentLength(pContentLength);
		status.setPItems(pItems);
	}

}
