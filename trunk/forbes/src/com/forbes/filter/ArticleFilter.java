package com.forbes.filter;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;

import com.forbes.hibernate.bean.UcMembers;
import com.forbes.hibernate.bean.User;
import com.forbes.util.BaseEncode;

public class ArticleFilter extends HttpServlet implements Filter {
	
	  private Logger logger = Logger.getLogger( getClass().getName() );
	  private FilterConfig filterConfig;

	  public void init(FilterConfig filterConfig) {
	    this.filterConfig = filterConfig;
	  }
	  
	  public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) {
		  try {
			  HttpServletRequest req = (HttpServletRequest) request;
			  UcMembers client = (UcMembers) req.getSession().getAttribute("CLIENT");
			  String url = req.getRequestURL().toString();
	        
			  /*System.out.println("req.getRequestURI().=" + req.getRequestURI());
			  System.out.println("req.getRequestURL().=" + req.getRequestURL());
			  System.out.println("req.getParameter(id).=" + req.getParameter("id"));
			  System.out.println("url.=" + url);
			  System.out.println("url.indexof=" + url.indexOf(".do"));*/
			  
			  if( url.indexOf(".do")>0 ){
	        	
				  if ( client == null && url.indexOf("ArticleContentAdd")>0 ){
					  filterConfig.getServletContext().getRequestDispatcher(
					  	"/client/index.jsp").forward(request, response);
				  }
				 /* if ( client == null && url.indexOf("ArticleDigg")>0 ){
					  Enumeration  en  =  request.getParameterNames(); 
					  String returnUrl = req.getRequestURI() + "?";
					  while(en.hasMoreElements()){
						  String  paramName  =  (String)en.nextElement(); 
						  String  paramValue  =  request.getParameter(paramName); 
						  returnUrl = returnUrl + paramName + "=" + (paramValue) +"&";
					  } 
					  
					  String s = BaseEncode.getBASE64(returnUrl);
					
					  System.out.println("s.=" + BaseEncode.getFromBASE64(s));
					  
					  filterConfig.getServletContext().getRequestDispatcher(
					  	"/client/index.jsp").forward(request, response);
				  }*/
				  else {
					  filterChain.doFilter(request, response);
				  } 
			  } else {
				  filterChain.doFilter(request, response);
			  }
		  } catch(ServletException sx) {
			  filterConfig.getServletContext().log(sx.getMessage());
		  } catch(IOException iox) {
			  filterConfig.getServletContext().log(iox.getMessage());
		  } finally { }
	}
	  
	//Clean up resources
	public void destroy() { }
	
}