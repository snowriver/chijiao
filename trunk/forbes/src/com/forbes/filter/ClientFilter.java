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
import com.forbes.util.BaseEncode;

public class ClientFilter extends HttpServlet implements Filter {

	private Logger logger = Logger.getLogger(getClass().getName());
	
	private FilterConfig filterConfig;

	// Handle the passed-in FilterConfig
	public void init(FilterConfig filterConfig) {
		this.filterConfig = filterConfig;
	}

	// Process the request/response pair
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) {

		try {
			HttpServletRequest req = (HttpServletRequest) request;
			UcMembers client = (UcMembers) req.getSession().getAttribute(
					"CLIENT");
			String url = req.getRequestURL().toString();

			if (url.indexOf(".do") > 0 || url.indexOf("jsp") > 0) {

				if (client == null && url.indexOf("ClientRegister") < 0
						&& url.indexOf("ClientReLogin") < 0
						&& url.indexOf("ClientLogin") < 0) {

					Enumeration en = request.getParameterNames();
					String returnUrl = req.getRequestURL() + "?";
					while (en.hasMoreElements()) {
						String paramName = (String) en.nextElement();
						String paramValue = request.getParameter(paramName);
						returnUrl = returnUrl + paramName + "=" + (paramValue);// +"&";

						if (en.hasMoreElements()) {
							returnUrl += "&";
						}
					}

					String s = BaseEncode.getBASE64(returnUrl);

					request.setAttribute("RETURN_URL", s);

					if (url.indexOf("ClientManageArticleFavorite") > 0
							|| url.indexOf("ClientManageVideoFavorite") > 0
							|| url.indexOf("ClientManageNewsFavorite") > 0) {
						filterConfig.getServletContext().getRequestDispatcher(
								"/client/ClientReLogin.jsp").forward(request,
								response);
					} else {
						filterConfig.getServletContext().getRequestDispatcher(
								"/client/ClientLogin.do?act=cookie").forward(
								request, response);
					}

				} else {
					filterChain.doFilter(request, response);
				}
			} else {
				if (url.indexOf(".php") > 0) {
					filterConfig.getServletContext().getRequestDispatcher(
							"/uc/ucenter.do").forward(request, response);
				} else {
					filterChain.doFilter(request, response);
				}
			}

		} catch (ServletException sx) {
			filterConfig.getServletContext().log(sx.getMessage());
		} catch (IOException iox) {
			filterConfig.getServletContext().log(iox.getMessage());
		} finally {
		}
	}

	// Clean up resources
	public void destroy() {
	}
}