<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.ScheduleDTO" %><%@ page import="form.ScheduleForm" %>
<% ScheduleForm formAdd = (ScheduleForm) request.getAttribute("formAdd"); %>
<%request.setAttribute("formAdd", formAdd); %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>予定追加確認画面</title>
	<link rel="stylesheet"  href="css/Schedule.css">
</head>
<body>

	<h4>以下の予定を登録します。</h4>
	<br>

<form action="ScheduleServlet" method="post">

<table>
    <tbody>
    
        <tr>
            <th>● タイトル </th>
            <td>
            	<%=formAdd.getFormTitle() %>
            	<input type="hidden" name="skdTitle" value="<%=formAdd.getFormTitle() %>" />
            </td>
        </tr>
        
         <tr>
            <th>● 開始日</th>
            <td>			
		         <%=formAdd.getFormStartYear() %>
		         &nbsp;年&nbsp;		         
		         <%=formAdd.getFormStartMonth() %>
		         &nbsp;月&nbsp;	
		         <%=formAdd.getFormStartDay() %>
		         &nbsp;日&nbsp;
		         <input type="hidden" name="startYear" value="<%=formAdd.getFormStartYear() %>" />
		         <input type="hidden" name="startMonth" value="<%=formAdd.getFormStartMonth() %>" />
		         <input type="hidden" name="startDay" value="<%=formAdd.getFormStartDay() %>" />				
				            
            </td>
        </tr>
        
         <tr>
            <th>● 終了日</th>
            <td>
		         <%=formAdd.getFormEndYear() %>
		         &nbsp;年&nbsp;		         
		         <%=formAdd.getFormEndMonth() %>
		         &nbsp;月&nbsp;	
		         <%=formAdd.getFormEndDay() %>
		         &nbsp;日&nbsp;
		         <input type="hidden" name="endYear" value="<%=formAdd.getFormEndYear() %>" />
		         <input type="hidden" name="endMonth" value="<%=formAdd.getFormEndMonth() %>" />
		         <input type="hidden" name="endDay" value="<%=formAdd.getFormEndMonth() %>" />            
            </td>
        </tr>
        
        <%if(! (formAdd.getFormStartHour().equals("指定なし")) ){ %>
        <tr>
            <th>● 開始/終了時刻</th>
            <td>				
					<!-- 開始時刻 -->		 
					<input type="hidden" name="startHour" value="<%=formAdd.getFormStartHour() %>" />
					<input type="hidden" name="startMinute" value="<%=formAdd.getFormStartMinute() %>" />
					<%=formAdd.getFormStartHour() %>&nbsp;:&nbsp;<%=formAdd.getFormStartMinute() %>
		　			&nbsp;&nbsp;～&nbsp;&nbsp;&nbsp;
					<!-- 終了時刻 --> 
					<input type="hidden" name="EndHour" value="<%=formAdd.getFormEndHour() %>" />
					<input type="hidden" name="EndMinute" value="<%=formAdd.getFormEndMinute() %>" />
					<%=formAdd.getFormEndHour() %>&nbsp;:&nbsp;<%=formAdd.getFormEndMinute() %>				          
            </td>
        </tr>
        <%} %>  
  
        <%if(! (formAdd.getFormPlace().equals("未記入"))){ %>
        <tr>
            <th>● 場所</th>
            <td>				
					<!-- 場所 -->		
					<%=formAdd.getFormPlace() %>
					<input type="hidden" name="place" value="<%=formAdd.getFormPlace() %>" />							            
            </td>
        </tr>
        <%} %>
        
        <%if(! (formAdd.getFormPerson().equals("未記入"))){ %>
        <tr>
            <th>● 人</th>
            <td>	 			
					<!-- 人 -->			 
					<%=formAdd.getFormPerson() %>
					<input type="hidden" name="person" value="<%=formAdd.getFormPerson() %>" />	 							 			
            </td>
        </tr>
        <%} %>
 
 		<%if(! (formAdd.getFormMemo().equals("未記入"))){ %>       
        <tr>
            <th>● memo</th>
            <td>
					<!-- memo -->	 
					<%=formAdd.getFormMemo() %>
					<input type="hidden" name="memo" value="<%=formAdd.getFormMemo() %>" />				
            </td>
        </tr>
        <%} %>
        
        <tr>
            <th>● 色</th>
            <td>
            	<input type="hidden" name="color" value="<%=formAdd.getFormColor() %>" />	<%=formAdd.getFormColorName() %>
            </td>
        </tr>
          
    </tbody>
</table>
		
		<br>
		<input type="submit" value="登録する" class="btn btn-grey btn-radius" style="margin-left: auto;margin-right: auto;" /><br>	
		<input type="hidden" name="処理" value="DB追加" />	
		<input type="hidden" name="process" value="DB処理" />
</form>
	
<form action="ScheduleServlet" method="get">
	<input type="submit" value="戻る" class="btn btn-grey btn-radius" style="margin-left: auto;margin-right: auto;" /><br><br>
	<input type="hidden" name="処理" value="追加編集" />		
	<input type="hidden" name="process" value="編集" />
</form>


</body>
</html>