package com.forbes.thread;

import java.util.*;
import java.lang.*;
public class TaskManager {
	
	private Map queueMap = new HashMap();
	public static TaskManager instance = null;

	class TaskCheck extends Thread{
		public synchronized void  run(){
			try{
				while( true ){
					Iterator it = queueMap.keySet().iterator();
					while( it.hasNext() ){
						String key = (String)it.next();
						
						Queue q = (Queue) queueMap.get( key );
						//System.out.println("===key:" + key + "  size:" + q.getSize());
						if( q.getSize() > 0 ){
							//啟動一个执行任務的线程
							//System.out.println(" que size:" + q.getSize() );
							ForbesThread thread = ThreadPool.getInstance().getThread( q );
							if( thread != null ){
								//激活线程
								//System.out.println("-------active thread to run------id:" + thread.getId());
								thread.doNotify();
							}
						}
					}
					//System.out.println("------task threard check run----");
					this.wait(1000);
				}
				
			}
			catch( Exception e ){
				
			}
		}
	}
	
	private TaskManager(){
		TaskCheck tCheck = new TaskCheck();
		tCheck.start();
	}
    public static synchronized TaskManager getInstance(){
    	if( instance == null ){
    		instance = new TaskManager();
    	}
    	return instance;
    }
	/**
	 * 接受委托过来的需要處理的任務
	 * @param task
	 */
	public synchronized void addTask(ForbesTask task){
		Queue q = (Queue)queueMap.get( task.getClass().getName() );
		if( q == null ){
			q = new Queue();
			q.setQueueName(task.getClass().getName());
			q.setThreadCnt( task.getThreadCnt() );
			queueMap.put(task.getClass().getName(), q);
		}
		q.add( task );
		/*
		//如果取到线程就立即执行，否则扔到队列
		try{
			SheThread thread = ThreadPool.getInstance().getThread( task );
			if( thread == null){
				//System.out.println("--------get thread null ----");
				q.add( task );
			}
			else{
				//System.out.println("--------get thread ok ----");
				thread.setTask( task );
				thread.setQueue(q);
				//thread.start();
				//thread.notify();
			}
		}
		catch( Exception e ){
			q.add( task );
		}
		*/
	}
	/**
	 * 创建执行任務的线程
	 * @param task
	 */
    public void createTaskThread(Object task){
    	
    }
}
