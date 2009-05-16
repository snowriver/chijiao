package com.forbes.thread;

import java.util.*;

public class Queue {
	protected int size = 0;
	protected List list = new Vector();
    private String queueName = "";
    private int threadCnt = 10;
    
	public int getThreadCnt() {
		return threadCnt;
	}

	public void setThreadCnt(int threadCnt) {
		this.threadCnt = threadCnt;
	}

	public String getQueueName() {
		return queueName;
	}

	public void setQueueName(String queueName) {
		this.queueName = queueName;
	}

	public synchronized void add(Object obj) {
		list.add(obj);
	}

	public synchronized void resend(Object obj) {
		list.add(obj);
	}

	public synchronized Object removeFirst() {
		try {
			if (list.size() > 0) {
				return (Object) list.remove(0);
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}

	public int getSize() {
		return list.size();
	}



}
