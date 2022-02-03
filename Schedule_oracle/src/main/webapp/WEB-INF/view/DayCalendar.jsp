<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.ArrayList" %>
 <%@ page import="form.CalendarForm" %> <%@ page import="dto.HolidayCalendarDTO" %><%@ page import="dto.HolidayDTO" %>
<%@ page import="dto.ScheduleDTO" %><%@ page import="java.util.Calendar" %>
<% Calendar cal=Calendar.getInstance(); %>
<%int year;
	  int month = cal.get(Calendar.MONTH)+1; 
	  int day = cal.get(Calendar.DATE); %>
 <% CalendarForm calendar=(CalendarForm)request.getAttribute("calendar"); %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title><%=cal.get(Calendar.MONTH)+1 %>/<%=cal.get(Calendar.DATE) %></title>

	<link rel="stylesheet"  href="css/DayCalendar.css">
</head>
<body>

<div id="left">

<table class="sche">
<tr><td class="top" style="width:80px"></td>
	<td class="top" style="width:300px"><h3><%=cal.get(Calendar.MONTH)+1 %>/<%=cal.get(Calendar.DATE) %></h3></td>
</tr>
<tr><td class="top" style="width:80px">時刻</td><td class="top" style="width:300px">予定</td></tr>
<tr><td class="time">00:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">01:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">02:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">03:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">04:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">05:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">06:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">07:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">08:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">09:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">10:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">11:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">12:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">13:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">14:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">15:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">16:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">17:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">18:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">19:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">20:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">21:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">22:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>
<tr><td class="time">23:00</td><td class="contents"></td></tr>
<tr><td class="timeb"></td><td class="contentsb"></td></tr>

</table>

<br>
	<form action="CalendarServlet" method="get">
		<input type="submit" value="ホームに戻る" />
	</form>
<br>	

</div>




</body>
</html>