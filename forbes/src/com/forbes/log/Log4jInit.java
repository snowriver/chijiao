package com.forbes.log;

import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.log4j.*;

/**
 * Title:
 * Description:
 * Copyright: Copyright (c) 2004
 * Company:
 * 
 * @author not attributable
 * @version 1.0
 */

public class Log4jInit extends HttpServlet {

	// Initialize global variables
	public void init() throws ServletException {
		String prefix = getServletContext().getRealPath("/");
		String file = getInitParameter("log4j");
		// if the log4j-init-file is not set, then no point in trying
		if (file != null) {
			PropertyConfigurator.configure(prefix + file);
		}
	}

	// Process the HTTP Get request
	public void doGet(HttpServletRequest request, HttpServletResponse response) {

	}

	// Clean up resources
	public void destroy() {
	}
}
