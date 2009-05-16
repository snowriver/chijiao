package com.forbes.service.useraction;

import com.forbes.thread.ForbesTask;



public class UserActionTask implements ForbesTask {
	private int threadCnt = 1;
	private IUesrAction action = null;
	
	public void doTask(){
		if( this.action != null ){
			this.action.process();
		}
	}
	public int getThreadCnt(){
		return this.threadCnt;
	}
	public void setThreadCnt( int threadCnt ){
		this.threadCnt = threadCnt;
	}
	public IUesrAction getAction() {
		return action;
	}
	public void setAction(IUesrAction action) {
		this.action = action;
	}
}
