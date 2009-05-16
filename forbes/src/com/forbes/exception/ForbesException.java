package com.forbes.exception;
import java.lang.Exception;

public class ForbesException extends Exception{
	
	public String msgKey = "";
	
	public ForbesException(String msg){
		super(msg);
	}
	public ForbesException(String msgKey,String msg){
		super(msg);
		this.msgKey = msgKey;
	}
	public String getMsgKey() {
		return msgKey;
	}

	public void setMsgKey(String msgKey) {
		this.msgKey = msgKey;
	}
}
