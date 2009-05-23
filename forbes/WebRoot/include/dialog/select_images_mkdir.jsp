<%@ page contentType="text/html;charset=gbk"%>


<%
	
	
		String path = request.getParameter("path");
		String dirname  = request.getParameter("dirname");
		String filename = path + "\\" + dirname;
		
		//System.out.println(path);
		
		if(!new java.io.File(filename).isDirectory()) {
			new java.io.File(filename).mkdirs(); 
			response.getWriter().write("<script language='javascript'>");
			response.getWriter().write("alert('创建成功！返回上传根目录！');");
			response.getWriter().write("self.location='select_images.jsp';");
			response.getWriter().write("</script>");
		}
		else {
			response.getWriter().write("<script language='javascript'>");
			response.getWriter().write("alert('文件夹已经存在');");
			response.getWriter().write("history.back();");
			response.getWriter().write("</script>");
		}


%>