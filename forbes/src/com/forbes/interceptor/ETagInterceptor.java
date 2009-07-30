package com.forbes.interceptor;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ETagInterceptor extends HandlerInterceptorAdapter {
	private ETagTokenFactory tokenFactory;

	public final boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException, IOException {
		String method = request.getMethod();
		if (!"GET".equals(method))
			return true;
		
		String previousToken = request.getHeader("If-None-Match");
		String token = getTokenFactory().getToken(request);
			
		// compare previous token with the current one
		if ((token != null) && (previousToken != null && previousToken.equals('"' + token + '"'))) {
			response.sendError(HttpServletResponse.SC_NOT_MODIFIED);
			response.setHeader("Last-Modified", request.getHeader("If-Modified-Since")); // re-use original last modified time
			return false;
		}
		
		// set header for next time client sends the request
		if (token != null) {
			response.setHeader("ETag", '"' + token + '"');
			
			// first time through - set last modified time to now 
		    Calendar cal = Calendar.getInstance();
		    cal.set(Calendar.MILLISECOND, 0);
		    Date lastModified = cal.getTime();
			response.setDateHeader("Last-Modified", lastModified.getTime());
		}
		
		return true;
	}

	public ETagTokenFactory getTokenFactory() {
		return tokenFactory;
	}
	
	public void setTokenFactory(ETagTokenFactory factory) {
		this.tokenFactory = factory;
	}
}
