package com.forbes.thread;

import java.lang.Thread;

public class ForbesThread extends Thread {
	private Queue queue;

	private ForbesTask task;

	public void run() {

		while (true) {
			try {
				doWait();
				//System.out.println(" que size:" + queue.getSize() );
				while (queue.getSize() > 0) {
					//System.out.println("----------do task -----------");
					task = (ForbesTask) queue.removeFirst();
					task.doTask();
				}
				ThreadPool.getInstance().freeThread(this);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	public synchronized void doWait() {
		try {
			this.wait(10*1000);
			//System.out.println("----------wake up -----------");
		} catch (IllegalMonitorStateException ie) {

		} catch (Exception e) {

		}

	}

	public synchronized void doNotify() {
		try {
			this.notify();
		} catch (IllegalMonitorStateException ie) {

		} catch (Exception e) {

		}

	}

	public Queue getQueue() {
		return queue;
	}

	public void setQueue(Queue queue) {
		this.queue = queue;
	}

	public ForbesTask getTask() {
		return task;
	}

	public void setTask(ForbesTask task) {
		this.task = task;
	}

}
