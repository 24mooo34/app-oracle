<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.ScheduleDTO" %><%@ page import="form.ScheduleForm" %>
<%ScheduleForm formRead = (ScheduleForm) request.getAttribute("formRead");%>
<%ScheduleForm formUp = (ScheduleForm) session.getAttribute("formUp");%>
<%session.setAttribute("formUp", formUp); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>予定確認画面</title>
	<link rel="stylesheet"  href="css/Schedule.css">
</head>
<body>

<form action="ScheduleServlet" method="post">
<br><br><br>
<table>
    <tbody>
    
        <tr>
            <th>● タイトル </th>
            <td>
            	<%=formRead.getFormTitle() %>
            	<input type="hidden" name="skdTitle" value="<%=formRead.getFormTitle() %>" />
            </td>
        </tr>
        
         <tr>
            <th>● 開始日</th>
            <td>			
		         <%=formRead.getFormStartYear() %>
		         &nbsp;年&nbsp;		         
		         <%=formRead.getFormStartMonth() %>
		         &nbsp;月&nbsp;	
		         <%=formRead.getFormStartDay() %>
		         &nbsp;日&nbsp;
		         <input type="hidden" name="startYear" value="<%=formRead.getFormStartYear() %>" />
		         <input type="hidden" name="startMonth" value="<%=formRead.getFormStartMonth() %>" />
		         <input type="hidden" name="startDay" value="<%=formRead.getFormStartDay() %>" />				
				            
            </td>
        </tr>
        
         <tr>
            <th>● 終了日</th>
            <td>
		         <%=formRead.getFormEndYear() %>
		         &nbsp;年&nbsp;		         
		         <%=formRead.getFormEndMonth() %>
		         &nbsp;月&nbsp;	
		         <%=formRead.getFormEndDay() %>
		         &nbsp;日&nbsp;
		         <input type="hidden" name="endYear" value="<%=formRead.getFormEndYear() %>" />
		         <input type="hidden" name="endMonth" value="<%=formRead.getFormEndMonth() %>" />
		         <input type="hidden" name="endDay" value="<%=formRead.getFormEndMonth() %>" />            
            </td>
        </tr>
        
        <%if(! (formRead.getFormStartHour().equals("指定なし")) ){ %>
        <tr>
            <th>● 開始/終了時刻</th>
            <td>				
					<!-- 開始時刻 -->		 
					<input type="hidden" name="startHour" value="<%=formRead.getFormStartHour() %>" />
					<input type="hidden" name="startMinute" value="<%=formRead.getFormStartMinute() %>" />
					<%=formRead.getFormStartHour() %>&nbsp;:&nbsp;<%=formRead.getFormStartMinute() %>
		　			&nbsp;&nbsp;～&nbsp;&nbsp;&nbsp;
					<!-- 終了時刻 --> 
					<input type="hidden" name="EndHour" value="<%=formRead.getFormEndHour() %>" />
					<input type="hidden" name="EndMinute" value="<%=formRead.getFormEndMinute() %>" />
					<%=formRead.getFormEndHour() %>&nbsp;:&nbsp;<%=formRead.getFormEndMinute() %>				            
            </td>
        </tr>
        <%} %>
  
        <%if(! (formRead.getFormPlace().equals("未記入"))){ %>
        <tr>
            <th>● 場所</th>
            <td>				
					<!-- 場所 -->		
					<%=formRead.getFormPlace() %>
					<input type="hidden" name="place" value="<%=formRead.getFormPlace() %>" />							            
            </td>
        </tr>
        <%} %>
        
        <%if(! (formRead.getFormPerson().equals("未記入"))){ %>
        <tr>
            <th>● 人</th>
            <td>	 			
					<!-- 人 -->			 
					<%=formRead.getFormPerson() %>
					<input type="hidden" name="person" value="<%=formRead.getFormPerson() %>" />	 							 			
            </td>
        </tr>
        <%} %>
 
 		<%if(! (formRead.getFormMemo().equals("未記入"))){ %>       
        <tr>
            <th>● memo</th>
            <td>
					<!-- memo -->	 
					<%=formRead.getFormMemo() %>
					<input type="hidden" name="memo" value="<%=formRead.getFormMemo() %>" />				
            </td>
        </tr>
        <%} %>
        
        <tr>
            <th>● 色</th>
            <td>
            	<input type="hidden" name="color" value="<%=formRead.getFormColor() %>" />	<%=formRead.getFormColorName() %>
            </td>
        </tr>
          
    </tbody>
</table>
		  	  				 
<br><br>


		<input type="submit" value="予定を更新する" class="btn btn-grey btn-radius" style="margin-left: auto;margin-right: auto;"  />
		<input type="hidden" name="id" value="<%=formRead.getFormSkd_id() %>" />
		<input type="hidden" name="process" value="更新" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</form>
	
	<form action="CalendarServlet" method="get">
		<input type="submit" value="ホームに戻る" class="btn btn-grey btn-radius" style="margin-left: auto;margin-right: auto;"  />
	</form>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<form action="ScheduleServlet" method="post">
		<input type="submit" value="予定を削除する" class="btn btn-grey btn-radius" style="margin-left: auto;margin-right: auto;"  /><br><br>
		<input type="hidden" name="id" value="<%=formRead.getFormSkd_id() %>" />
		<input type="hidden" name="処理" value="DB削除" />	
		<input type="hidden" name="process" value="DB処理" />
	</form>


</body>
</html>