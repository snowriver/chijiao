package com.forbes.mail;

import java.util.*;
import java.io.*;
import javax.mail.*;
import javax.mail.internet.*;

public class ForbesMail {
	public final static int HTML_MAIL = 1;
	public final static int TEXT_MAIL = 2;
	private String subject;
	private String from;
	private List <String>  toList = new LinkedList<String>();
	private List <String>  copyToList = new LinkedList<String>();
	private String Body;
    private int MailType;
    
    private Multipart multipart = new MimeMultipart();
    
    public void  addBody( String content, int mailType ){
    	if ( mailType == HTML_MAIL ){
    		addHtmlBody( content );
    	}
    	else{
    		addTextBody( content );
    	}	
    }
    private void addHtmlBody( String content ){
    	try {
			MimeBodyPart mimeBodyPart = new MimeBodyPart();
			content = "<meta http-equiv=Content-Type content=text/html; charset=GB2312>" + content;
			mimeBodyPart.setContent(content,"text/html;charset=GBK" );
			multipart.addBodyPart( mimeBodyPart);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    private void addTextBody( String content ){
    	try {
			MimeBodyPart mimeBodyPart = new MimeBodyPart();
			mimeBodyPart.setText(content);
			multipart.addBodyPart( mimeBodyPart );
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    public void addAtachment( File f ){
    	
    }
    public void addTo( String mailAddress ){
    	this.toList.add( mailAddress );
    }
    public void addCopyTo( String mailAddress ){
    	this.copyToList.add( mailAddress );
    }
    
	public String getBody() {
		return Body;
	}
	public void setBody(String body) {
		Body = body;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public int getMailType() {
		return MailType;
	}
	public void setMailType(int mailType) {
		MailType = mailType;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Multipart getMultipart() {
		return multipart;
	}
	public void setMultipart(Multipart multipart) {
		this.multipart = multipart;
	}
	public List getCopyToList() {
		return copyToList;
	}
	public void setCopyToList(List copyToList) {
		this.copyToList = copyToList;
	}
	public List getToList() {
		return toList;
	}
	public void setToList(List toList) {
		this.toList = toList;
	}
	
}
