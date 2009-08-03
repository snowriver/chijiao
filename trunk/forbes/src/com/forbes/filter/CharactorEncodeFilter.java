package com.forbes.filter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class CharactorEncodeFilter extends HttpServlet implements Filter {

	private FilterConfig filterConfig;
	
	//Handle the passed-in FilterConfig
	public void init(FilterConfig filterConfig) {
		this.filterConfig = filterConfig;
	}
  
	class Request extends HttpServletRequestWrapper {
		private String encoding;
	  
		public Request(HttpServletRequest request,String encoding) {
			super(request);
			this.encoding = encoding;
		}
		
		/**  
		 * 转换由表單讀取的數据的内碼.
		 * 從 ISO 字符转到 utf-8(或gbk).
		 */
		public String toChi(String input) {
			try {
				byte[] bytes = input.getBytes("ISO-8859-1");
				return new String(bytes, encoding);
			} catch (Exception ex) {
				
			}   
			return null;   
		}   

		/**  
		 * Return the HttpServletRequest holded by this object.  
		 */  
		private HttpServletRequest getHttpServletRequest() {   
			return (HttpServletRequest)super.getRequest();   
		}   

		/**  
		 * 讀取参數 -- 修正了中文问題.  
		 */  
		public String getParameter(String name) {   
			return toChi(getHttpServletRequest().getParameter(name));   
		}   

		/**  
		 * 讀取参數列表 - 修正了中文问題.
		 */
		public String[] getParameterValues(String name) {
			String values[] = getHttpServletRequest().getParameterValues(name);
            if (values != null) {
            	for (int i = 0; i < values.length; i++) {
            		values[i] = toChi(values[i]);
            	}
            }
            return values;
		}
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) {
		try {
			HttpServletRequest req = (HttpServletRequest) request;
			String contextPath = req.getServletPath();

			if( contextPath.indexOf(".do")>=0 || contextPath.indexOf(".jsp")>=0 ){				
				req.setCharacterEncoding("UTF-8");
	        	if( req.getMethod().equals("GET")){
	            	request = new Request(req,"UTF-8");
	        	}
			} else {
				req.setCharacterEncoding("GBK");
				if( req.getMethod().equals("GET")){
					request = new Request(req,"GBK");
				}
			}
			filterChain.doFilter(request, response);
		} catch(ServletException sx) {
			filterConfig.getServletContext().log(sx.getMessage());
		} catch(IOException iox) {
			filterConfig.getServletContext().log(iox.getMessage());
		} finally {
			
		}
	}
	
	//Clean up resources
	public void destroy() {
	}
}