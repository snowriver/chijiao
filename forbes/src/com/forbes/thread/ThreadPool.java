package com.forbes.thread;


import java.util.*;

import org.apache.log4j.*;

public class ThreadPool {

	//thread pool instance
	private static ThreadPool threadPool = null;

	//the mapping of proccessor to maxcount of processor instance
	private static List freeList = new LinkedList();

	//the mapping of proccessor name to proccessor map
	private static Map busyMap = new TreeMap();

	//logger
	private Logger logger = Logger.getLogger(this.getClass().getName());

	//constructor
	private ThreadPool() {
	}

	

	/**
	 * return the instance
	 * @return  thread pool instance
	 */
	public static synchronized ThreadPool getInstance() {
		if (threadPool == null) {
			threadPool = new ThreadPool();
		}
		return threadPool;
	}



	/**
	 * free thread
	 * @param thread which will be free
	 */
	public void freeThread(ForbesThread thread) {
		try {
		
			String processName = thread.getName();
			String threadId = ""+thread.getId();
			//find the thread from busy map then free
			Map threadMap = (Map) busyMap.get(processName);
			if (threadMap != null) {
				threadMap.remove(threadId);
				/*System.out.println("ThreadId:" + threadId
						+ " free a busy thread!");*/
			}
			
			thread.setName("");
			freeList.add( thread );
		} catch (Exception e) {
			logger.error("free thread exception!", e);
		}
	}

    public void freeThreds(Map threadMap){
    	Iterator it = threadMap.keySet().iterator();
    	//System.out.println("Threadmap:free a busy thread group!");
    	while ( it.hasNext() ){
    		ForbesThread thread = (ForbesThread)threadMap.get(it.next());
    		//System.out.println("--------dddd---t status:" + thread.isAlive());
    		if( !thread.isAlive() ){
    			freeThread(thread);
    			thread.doNotify();
    		}
    	}
    	
    }
	
	/**
	 * get a thread from thread pool,if pool is null then create a new gwthread
	 * @param ProcessName proccessor class name
	 * @return a gwthread
	 * @throws GwException
	 */
	public ForbesThread getThread(Queue q)	throws Exception {
		try {
			//System.out.println("----------get thread begin-------------");
			Map threadMap = (Map) busyMap.get( q.getQueueName() );
			if( threadMap == null ){
				threadMap = new HashMap();
				busyMap.put(q.getQueueName(), threadMap);
			}
			if( threadMap.size() >= q.getThreadCnt() ){
				//System.out.println("----------get thread end null-------------q:" + q.getClass().getName() + " qname:" + q.getQueueName() + " qsize:" + threadMap.size()  );
				freeThreds(threadMap);
				return null;
			}
			else{
				ForbesThread thread = null;
				if( freeList.size() > 0 ){
					//System.out.println("----------get thread from free-------------");
					thread = (ForbesThread)freeList.remove(0);
				}else{
					//System.out.println("----------get thread from new-------------");
				    thread = new ForbesThread();
				    thread.start();
				}
				thread.setName(q.getQueueName());
				threadMap.put(""+thread.getId(), thread );
				//System.out.println("----------get thread end-------------threadid:"+ thread.getId());
				thread.setQueue(q);
				return thread;
			}
			
		} catch ( Exception e) {
			e.printStackTrace();
			return null;
		}

	}
}
