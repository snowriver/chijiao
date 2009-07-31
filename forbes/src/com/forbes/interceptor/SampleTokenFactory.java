package com.forbes.interceptor;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;


public class SampleTokenFactory implements ETagTokenFactory, ModifiedObjectTracker {
	
	// track entity -> list of views. initialized at start, so no need to synchronize
	private Map<String, List<String>> entityViewMap = null;

	// tracks views -> counts
	private Map<String, Integer> counts = Collections.synchronizedMap(new HashMap<String, Integer>());
	
	// ETagTokenFactory
	public String getToken(HttpServletRequest request) {
		String view = request.getRequestURI();
		
		Integer count = counts.get(view);
		if (count == null) {
			return null;
		}
		
		return count.toString();
	}

	// ModifiedObjectTracker
	public void notifyModified(String entity) {
		List<String> views = getEntityViewMap().get(entity);
		
		if (views == null) { // no views are configured for this entity
			return;
		}
		
		synchronized(counts) {
			for (String view : views) {
				Integer count = counts.get(view);
				counts.put(view, ++count);
			}
		}
	}
	
	public Map<String, List<String>> getEntityViewMap() {
		return entityViewMap;
	}

	public void setEntityViewMap(Map<String, List<String>> entityViewMap) {
		this.entityViewMap = entityViewMap;
		
		// initialize couts
		for (Map.Entry entry : entityViewMap.entrySet()) {
			List<String> views = getEntityViewMap().get(entry.getKey());
			for (String view : views) {
				counts.put(view, -1);
			}
		}
	}
}
