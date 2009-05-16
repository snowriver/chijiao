<%
	//response.sendRedirect("index.do");
	try{
		request.getRequestDispatcher("index.do").forward(request,response);
	} catch(Exception e){
		e.printStackTrace();
	}
%>

<!-- 
<script language="javascript" >
	parent.location="index.do";
</script>

 -->