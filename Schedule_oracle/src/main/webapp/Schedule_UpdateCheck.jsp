<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.ScheduleDTO" %><%@ page import="form.ScheduleForm" %>
<% ScheduleForm formUp = (ScheduleForm) request.getAttribute("formUp"); %>
<%request.setAttribute("formUp", formUp); %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>予定更新確認画面</title>
	<link rel="stylesheet"  href="css/Schedule.css">
</head>
<body>

	<h4>以下の内容で更新します。</h4>
	<br>

<form action="ScheduleServlet" method="post">
<input type="hidden" name="id" value="<%=formUp.getFormSkd_id() %>" />

<table>
    <tbody>
    
        <tr>
            <th>● タイトル </th>
            <td>
            	<%=formUp.getFormTitle() %>
            	<input type="hidden" name="skdTitle" value="<%=formUp.getFormTitle() %>" />
            </td>
        </tr>
        
         <tr>
            <th>● 開始日</th>
            <td>			
		         <%=formUp.getFormStartYear() %>
		         &nbsp;年&nbsp;		         
		         <%=formUp.getFormStartMonth() %>
		         &nbsp;月&nbsp;	
		         <%=formUp.getFormStartDay() %>
		         &nbsp;日&nbsp;
		         <input type="hidden" name="startYear" value="<%=formUp.getFormStartYear() %>" />
		         <input type="hidden" name="startMonth" value="<%=formUp.getFormStartMonth() %>" />
		         <input type="hidden" name="startDay" value="<%=formUp.getFormStartDay() %>" />				
				            
            </td>
        </tr>
        
         <tr>
            <th>● 終了日</th>
            <td>
		         <%=formUp.getFormEndYear() %>
		         &nbsp;年&nbsp;		         
		         <%=formUp.getFormEndMonth() %>
		         &nbsp;月&nbsp;	
		         <%=formUp.getFormEndDay() %>
		         &nbsp;日&nbsp;
		         <input type="hidden" name="endYear" value="<%=formUp.getFormEndYear() %>" />
		         <input type="hidden" name="endMonth" value="<%=formUp.getFormEndMonth() %>" />
		         <input type="hidden" name="endDay" value="<%=formUp.getFormEndMonth() %>" />            
            </td>
        </tr>
        
        <%if(! (formUp.getFormStartHour().equals("指定なし")) ){ %>
        <tr>
            <th>● 開始/終了時刻</th>
            <td>				
					<!-- 開始時刻 -->		 
					<input type="hidden" name="startHour" value="<%=formUp.getFormStartHour() %>" />
					<input type="hidden" name="startMinute" value="<%=formUp.getFormStartMinute() %>" />
					<%=formUp.getFormStartHour() %>&nbsp;:&nbsp;<%=formUp.getFormStartMinute() %>
		　			&nbsp;&nbsp;～&nbsp;&nbsp;&nbsp;
					<!-- 終了時刻 --> 
					<input type="hidden" name="EndHour" value="<%=formUp.getFormEndHour() %>" />
					<input type="hidden" name="EndMinute" value="<%=formUp.getFormEndMinute() %>" />
					<%=formUp.getFormEndHour() %>&nbsp;:&nbsp;<%=formUp.getFormEndMinute() %>				           
            </td>
        </tr>
        <%} %> 
  
        <%if(! (formUp.getFormPlace().equals("未記入"))){ %>
        <tr>
            <th>● 場所</th>
            <td>				
					<!-- 場所 -->		
					<%=formUp.getFormPlace() %>
					<input type="hidden" name="place" value="<%=formUp.getFormPlace() %>" />							            
            </td>
        </tr>
        <%} %>
        
        <%if(! (formUp.getFormPerson().equals("未記入"))){ %>
        <tr>
            <th>● 人</th>
            <td>	 			
					<!-- 人 -->			 
					<%=formUp.getFormPerson() %>
					<input type="hidden" name="person" value="<%=formUp.getFormPerson() %>" />	 							 			
            </td>
        </tr>
        <%} %>
 
 		<%if(! (formUp.getFormMemo().equals("未記入"))){ %>       
        <tr>
            <th>● memo</th>
            <td>
					<!-- memo -->	 
					<%=formUp.getFormMemo() %>
					<input type="hidden" name="memo" value="<%=formUp.getFormMemo() %>" />				
            </td>
        </tr>
        <%} %>
        
        <tr>
            <th>● 色</th>
            <td>
            	<input type="hidden" name="color" value="<%=formUp.getFormColor() %>" />	<%=formUp.getFormColorName() %>
            </td>
        </tr>
          
    </tbody>
</table>

<br>
		<input type="submit" value="更新する" class="btn btn-grey btn-radius" style="margin-left: auto;margin-right: auto;" /><br>	
		<input type="hidden" name="処理" value="DB更新" />	
		<input type="hidden" name="process" value="DB処理" />
</form>

	<form action="ScheduleServlet" method="get">
		<input type="submit" value="戻る" class="btn btn-grey btn-radius" style="margin-left: auto;margin-right: auto;" /><br><br>
		<input type="hidden" name="処理" value="更新編集" />		
		<input type="hidden" name="process" value="編集" />
	</form>


</body>
</html>