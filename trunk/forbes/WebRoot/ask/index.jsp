<%
	try{
		request.getRequestDispatcher("index_ask_list.jsp").forward(request,response);
	} catch(Exception e){
		e.printStackTrace();
	}
	//response.sendRedirect("index_ask_list.jsp");
%>

<!-- 
<script language="javascript" >
	parent.location="index.do";
</script>
 -->