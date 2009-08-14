<%@ page language="java" pageEncoding="gbk"%>
<%@ page language="java" import="java.util.*" %>
<%! String days[]; %>
<%
	days=new String[42];
	for(int i=0;i<42;i++) {
		days[i]="";
	}
%>
<% 
	GregorianCalendar currentDay = new GregorianCalendar();
	int today=currentDay.get(Calendar.DAY_OF_MONTH);
	int month=currentDay.get(Calendar.MONTH);
	int year= currentDay.get(Calendar.YEAR);
	//out.println(year+"年"+ (month+1)+"月"+today+"日");
	Calendar thisMonth=Calendar.getInstance();
	thisMonth.set(Calendar.MONTH, month );
	thisMonth.set(Calendar.YEAR, year );
	thisMonth.setFirstDayOfWeek(Calendar.SUNDAY);
	thisMonth.set(Calendar.DAY_OF_MONTH,1);
	int firstIndex=thisMonth.get(Calendar.DAY_OF_WEEK)-1;
	int maxIndex=thisMonth.getActualMaximum(Calendar.DAY_OF_MONTH);
	for(int i=0;i<maxIndex;i++) {
   		days[firstIndex+i]=String.valueOf(i+1);
	}
	
	String display = "none";
	String status = (String) request.getSession().getAttribute("CALENDAR_STATUS");
	if(status!=null && status.equals("OPEN") ) {
		display = "block";
	}
	else {
		display = "none";
	}
%>
<div id="planCalendar" align=center style="display:<%=display %>">
        	<table border="1" width="100%" cellspacing="1" cellpadding="1" bordercolor="#C3D9FF" class="toptable grid">
				<TR align="center">
					<TD bgColor="#016BAE" colSpan=7 height="16"><font color="white"><%=year %>年 <%=(month+1) %>月<%=today %>日</font></TD>
				</TR>
				<tr bgcolor="#C3D9FF" class="modify">
					<th width="100" ><font color="red">周日</font></th> 
					<th width="100">周一</th> 
					<th width="100">周二</th> 
					<th width="100">周三</th> 
					<th width="100">周四</th> 
					<th width="100">周五</th> 
					<th width="100"><font color="red">周六</font></th> 
				</tr>
				<% for(int j=0;j<6;j++) { %> 
				<tr> 
      				<% for(int i=j*7;i<(j+1)*7;i++) { %> 
     				<td width="15%" height="16"  valign="middle" align="center" 
     					onclick="goto('<%=year %>-<%=(month+1) %>-<%=days[i] %>');" 
     					onmouseover="this.style.backgroundColor='#DBF3FF'" 
     					onmouseout="this.style.backgroundColor='#ffffff'"> 
     					<%if((i-firstIndex+1)==today){ %>
  						<font color="red"><%=days[i]%></font>
					  	<%
					  	} else { 
					  	%>
					  	<%=days[i]%>
					<%
					}
					%>
					</td> 
						<% }  %> 
				</tr> 
				<% }  %> 

			</table>
</div> 

<script language="javascript" type="text/javascript">

	function calendarOpen(){
			var display = $("#planCalendar").css("display");
			var url = "";
			if(display == 'none') {
				url = url + "act=open";
			}
			else {
				url = url + "act=close";
			}
			$.ajax({
				beforeSend: function(){
					//$("#RESULTE_MSG").html("完成中...");
				},
				url: 'ClientManageUserPlanCalendar.do',
				type: 'post',
				dataType: 'html',
				data: url,
				timeout: 10000,
				error: function(){
					//alert('System error');
					alert("操作日历失败");
				},
				success: function(rsHtml){
					if(display == 'none') {
						$("#planCalendar").css("display","block");
					}
					else {
						$("#planCalendar").css("display","none");
					}		
				}
			});
		}

	function goto(date) {
		location.href = "ClientManageUserDailyPlan.do?act=list&date=" + date;
	}

</script>