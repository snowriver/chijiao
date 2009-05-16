<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!--同步登录代码-->
${SYN_LGIN}
<%
	//System.out.println(request.getParameter("history"));
	//request.getSession().removeAttribute("CLIENT");
	
	//Cookie cookie = new Cookie("FORBES_USER_INFO", null);
	//cookie.setMaxAge(0); //设置为0为立即删除该Cookie
	//cookie.setPath("/test/test2"); //删除指定路径上的Cookie，不设置该路径，默认为删除当前路径Cookie
	//response.addCookie(cookie);

	//response.sendRedirect("../index.jsp");
    //response.sendRedirect("../"+request.getParameter("history"));
%>

 <script language="javascript" >
   
    	self.location="../index.jsp";
   
    	
   
 </script>