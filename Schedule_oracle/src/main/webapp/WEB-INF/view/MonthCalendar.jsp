<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.ArrayList" %>
<%@ page import="form.CalendarForm" %> <%@ page import="dto.HolidayCalendarDTO" %><%@ page import="dto.HolidayDTO" %>
<%@ page import="dto.ScheduleDTO" %>
<% CalendarForm calendar=(CalendarForm)request.getAttribute("calendar"); %>
<% ArrayList<HolidayCalendarDTO> holiday = calendar.getHoliday(); %>
<% ArrayList<ScheduleDTO> schedule = calendar.getSkd(); %>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <title><%=calendar.getYear() %>年<%=calendar.getMonth() %>月</title>
  <link rel="stylesheet"  href="css/MonthCalendar.css">
</head>
<body>

 <div id="container">

 <div style="display:inline-flex">
     <form action="ScheduleServlet" method="get">
		<input type="submit" value="予定を追加する" class="btn btn-grey btn-radius" />
		<input type="hidden" name="process" value="新規追加" />
	</form>
	
</div>	
<br><br>
	<table class="top" >
		<tr><th class="top">				
			<div style="display:inline-flex">
				<p style="text-align:left"><a href="?year=<%=calendar.getYear()%>&month=<%=calendar.getMonth()-1%>" style="color:#ffffff"> ＜＜前月</a></p>
				<h2 class="top">&nbsp;&nbsp; <%=calendar.getYear() %>年 <%=calendar.getMonth() %>月&nbsp;&nbsp;</h2>		
				<p style="text-align:right"><a href="?year=<%=calendar.getYear()%>&month=<%=calendar.getMonth()+1%>" style="color:#ffffff"> 翌月＞＞ </a></p>							
			</div>	
		</th></tr>
	</table>
	
    <table>
      <tr>
        <th>SUN</th>
        <th>MON</th>
        <th>TUE</th>
        <th>WED</th>
        <th>THU</th>
        <th>FRI</th>
        <th>SAT</th>
      </tr>
      <%for(String[] row : calendar.getData() ){ %>
      <tr>
      	<%for(String col : row) { %>
      		<%//当日の場合はセルが黄色になる %>
      		<%if ( col.startsWith("*") ){ %>
      			<td class="today"><%=col.substring(1)%>
      			<%//祝日表示 %>
      			<%for(int i = 0; i < holiday.size(); i++){ %>
      				<%String holsDate = String.format("%1$td", holiday.get(i).getHolidayDate()); %> 
      				<%if(!(col.equals("")) && holsDate.equals(col.substring(1)) || holsDate.equals( "0" + col.substring(1))){ %>
      					&nbsp;<%=holiday.get(i).getHolidayDto() %>
      				<%} %>    			
      			<%} %>
      			<br>
      			 <%//予定表示 %>     			     			
      			<%for(int j = 0; j < schedule.size(); j++){ %>
      				<%String html = schedule.get(j).getColorDto();%>
      				<%String skdDate = String.format("%1$td", schedule.get(j).getStartDay()); %>   				    				
      				<%if( !(col.equals("")) && skdDate.equals(col.substring(1)) || skdDate.equals( "0" + col.substring(1)) ){ %>
      						<%if(schedule.get(j).getSkdTitle().length() > 9){ %>
      						<form action="ScheduleServlet" method="post">
      							<input style="background-color:<%=schedule.get(j).getColorDto(html) %>" class="schedule" type="submit" value="<%=schedule.get(j).getSkdTitle().substring(0,8) %>" />	
      							<input type="hidden" name="id" value="<%= schedule.get(j).getSkd_id() %>" />
      							<input type="hidden" name="process" value="参照" />
	      					</form>
      						<%}else{ %>
       						<form action="ScheduleServlet" method="post">
       							<input style="background-color:<%=schedule.get(j).getColorDto(html) %>" class="schedule" type="submit" value="<%=schedule.get(j).getSkdTitle() %>" />	
       							<input type="hidden" name="id" value="<%= schedule.get(j).getSkd_id() %>" />
      							<input type="hidden" name="process" value="参照" />
	      					</form>
      						<%} %>
      				<%} %>
      			<%} %>
      			</td><%// substring(★)…　★番目の文字から表示※★は0から始まる%>
      		<%//当日以外 %>
      		<%}else{ %>
      			<td><%=col %>
       			<%//祝日表示 %>
       			<%for(int m = 0; m < holiday.size(); m++){ %>
      				<%String holsDate = String.format("%1$td", holiday.get(m).getHolidayDate()); %> 
      				<%if(!(col.equals("")) && holsDate.equals(col ) || holsDate.equals( "0" + col)){ %>
      					&nbsp;<%=holiday.get(m).getHolidayDto() %>
      				<%} %>    			
      			<%} %>
      			<br>     			
      			<%//予定表示 %>     			
      			<%for(int k = 0; k < schedule.size(); k++){ %>
      					<%String html = schedule.get(k).getColorDto();%>
      					<%String skdDate = String.format("%1$td", schedule.get(k).getStartDay()); %>					     					
      					<%if( !(col.equals("")) && skdDate.equals(col ) || skdDate.equals( "0" + col )  ){ %>
      						<%if(schedule.get(k).getSkdTitle().length() > 9){ %>
       						<form action="ScheduleServlet" method="post">
      							<input style="background-color:<%=schedule.get(k).getColorDto(html) %>" class="schedule" type="submit" value="<%=schedule.get(k).getSkdTitle().substring(0,8) %>" />	
      							<input type="hidden" name="id" value="<%= schedule.get(k).getSkd_id() %>" />
      							<input type="hidden" name="process" value="参照" />
	      					</form>
      						<%}else{ %>
       						<form action="ScheduleServlet" method="post">
 	      						<input style="background-color:<%=schedule.get(k).getColorDto(html) %>" class="schedule" type="submit" value="<%=schedule.get(k).getSkdTitle() %>" />	
      							<input type="hidden" name="id" value="<%= schedule.get(k).getSkd_id() %>" />
       							<input type="hidden" name="process" value="参照" />
	      					</form>
      						<%} %>
      					<%} %>
      			<%} %>		      			
      			</td>
      		<%} %>
      	<%} %>


      </tr>
      <%} %>
    </table>
</div><!-- end container-->

</body>
</html>