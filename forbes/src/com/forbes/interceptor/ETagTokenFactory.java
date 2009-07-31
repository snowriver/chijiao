package com.forbes.interceptor;

import javax.servlet.http.HttpServletRequest;

public interface ETagTokenFactory {
	
	String getToken(HttpServletRequest request);
	
}
