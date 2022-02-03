<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="dto.ScheduleDTO" %><%@ page import="form.ScheduleForm" %>
 <%ScheduleForm formUp = (ScheduleForm) request.getAttribute("formUp");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>予定更新画面</title>
	<link rel="stylesheet"  href="css/Schedule.css">
</head>
<body>

	<h4>更新内容を入力してください。</h4>
	<br>

<form action="ScheduleServlet" method="post">
<input type="hidden" name="id" value="<%=formUp.getFormSkd_id() %>" />	
	
<table>
    <tbody>    
        <tr>
            <th>● タイトル </th>
            <td>
				<%if(formUp == null ){ %>
					<input type="text" name="skdTitle" size="55" required="required"/>	
				<%}else{ %>
					<input type="text" name="skdTitle" size="55" required="required" value="<%=formUp.getFormTitle() %>">
				<%} %>                                   
            </td>
        </tr>
        
         <tr>
            <th>● 開始日</th>
            <td>
				<select size="1" name="startYear"  required="required">
					<option value="2021" ${formUp.getFormStartYear() == "2021" ? "selected" : ""}>2021</option> 
					<option value="2022" ${formUp.getFormStartYear() == "2022" ? "selected" : ""}>2022</option> 
					<option value="2023" ${formUp.getFormStartYear() == "2023" ? "selected" : ""}>2023</option>
				</select>
				&nbsp;年
				<select size="1" name="startMonth" required="required">
					<option value="01" ${formUp.getFormStartMonth() == "01" ? "selected" : ""} >01</option>
					<option value="02" ${formUp.getFormStartMonth() == "02" ? "selected" : ""} >02</option>
					<option value="03" ${formUp.getFormStartMonth() == "03" ? "selected" : ""} >03</option>
					<option value="04" ${formUp.getFormStartMonth() == "04" ? "selected" : ""} >04</option>
					<option value="05" ${formUp.getFormStartMonth() == "05" ? "selected" : ""} >05</option>
					<option value="06" ${formUp.getFormStartMonth() == "06" ? "selected" : ""} >06</option>
					<option value="07" ${formUp.getFormStartMonth() == "07" ? "selected" : ""} >07</option>
					<option value="08" ${formUp.getFormStartMonth() == "08" ? "selected" : ""} >08</option>
					<option value="09" ${formUp.getFormStartMonth() == "09" ? "selected" : ""} >09</option>
					<option value="10" ${formUp.getFormStartMonth() == "10" ? "selected" : ""} >10</option>
					<option value="11" ${formUp.getFormStartMonth() == "11" ? "selected" : ""} >11</option>
					<option value="12" ${formUp.getFormStartMonth() == "12" ? "selected" : ""} >12</option>							
				</select>
				&nbsp;月
				<select size="1" name="startDay" required="required">
<option value="01" ${formUp.getFormStartDay() == "01" ? "selected" : ""} >01</option> <option value="02" ${formUp.getFormStartDay() == "02" ? "selected" : ""} >02</option>
<option value="03" ${formUp.getFormStartDay() == "03" ? "selected" : ""} >03</option> <option value="04" ${formUp.getFormStartDay() == "04" ? "selected" : ""} >04</option>
<option value="05" ${formUp.getFormStartDay() == "05" ? "selected" : ""} >05</option> <option value="06" ${formUp.getFormStartDay() == "06" ? "selected" : ""} >06</option>
<option value="07" ${formUp.getFormStartDay() == "07" ? "selected" : ""} >07</option> <option value="08" ${formUp.getFormStartDay() == "08" ? "selected" : ""} >08</option>
<option value="09" ${formUp.getFormStartDay() == "09" ? "selected" : ""} >09</option> <option value="10" ${formUp.getFormStartDay() == "10" ? "selected" : ""} >10</option>
<option value="11" ${formUp.getFormStartDay() == "11" ? "selected" : ""} >11</option> <option value="12" ${formUp.getFormStartDay() == "12" ? "selected" : ""} >12</option>
<option value="13" ${formUp.getFormStartDay() == "13" ? "selected" : ""} >13</option> <option value="14" ${formUp.getFormStartDay() == "14" ? "selected" : ""} >14</option>
<option value="15" ${formUp.getFormStartDay() == "15" ? "selected" : ""} >15</option> <option value="16" ${formUp.getFormStartDay() == "16" ? "selected" : ""} >16</option>
<option value="17" ${formUp.getFormStartDay() == "17" ? "selected" : ""} >17</option> <option value="18" ${formUp.getFormStartDay() == "18" ? "selected" : ""} >18</option>
<option value="19" ${formUp.getFormStartDay() == "19" ? "selected" : ""} >19</option> <option value="20" ${formUp.getFormStartDay() == "20" ? "selected" : ""} >20</option>
<option value="21" ${formUp.getFormStartDay() == "21" ? "selected" : ""} >21</option> <option value="22" ${formUp.getFormStartDay() == "22" ? "selected" : ""} >22</option>
<option value="23" ${formUp.getFormStartDay() == "23" ? "selected" : ""} >23</option> <option value="24" ${formUp.getFormStartDay() == "24" ? "selected" : ""} >24</option>
<option value="25" ${formUp.getFormStartDay() == "25" ? "selected" : ""} >25</option> <option value="26" ${formUp.getFormStartDay() == "26" ? "selected" : ""} >26</option>
<option value="27" ${formUp.getFormStartDay() == "27" ? "selected" : ""} >27</option> <option value="28" ${formUp.getFormStartDay() == "28" ? "selected" : ""} >28</option>
<option value="29" ${formUp.getFormStartDay() == "29" ? "selected" : ""} >29</option> <option value="30" ${formUp.getFormStartDay() == "30" ? "selected" : ""} >30</option>
<option value="31" ${formUp.getFormStartDay() == "31" ? "selected" : ""} >31</option>		
	  		</select>
	  		&nbsp;日            
            </td>
        </tr>
        
         <tr>
            <th>● 終了日</th>
            <td>
		<select size="1" name="endYear" required="required">
			<option value="2021" ${formUp.getFormEndYear() == "2021" ? "selected" : ""}>2021</option> 
			<option value="2022" ${formUp.getFormEndYear() == "2022" ? "selected" : ""}>2022</option> 
			<option value="2023" ${formUp.getFormEndYear() == "2023" ? "selected" : ""}>2023</option>
		</select>
		&nbsp;年
		<select size="1" name="endMonth" required="required">
			<option value="01" ${formUp.getFormEndMonth() == "01" ? "selected" : ""} >01</option>
			<option value="02" ${formUp.getFormEndMonth() == "02" ? "selected" : ""} >02</option>
			<option value="03" ${formUp.getFormEndMonth() == "03" ? "selected" : ""} >03</option>
			<option value="04" ${formUp.getFormEndMonth() == "04" ? "selected" : ""} >04</option>
			<option value="05" ${formUp.getFormEndMonth() == "05" ? "selected" : ""} >05</option>
			<option value="06" ${formUp.getFormEndMonth() == "06" ? "selected" : ""} >06</option>
			<option value="07" ${formUp.getFormEndMonth() == "07" ? "selected" : ""} >07</option>
			<option value="08" ${formUp.getFormEndMonth() == "08" ? "selected" : ""} >08</option>
			<option value="09" ${formUp.getFormEndMonth() == "09" ? "selected" : ""} >09</option>
			<option value="10" ${formUp.getFormEndMonth() == "10" ? "selected" : ""} >10</option>
			<option value="11" ${formUp.getFormEndMonth() == "11" ? "selected" : ""} >11</option>
			<option value="12" ${formUp.getFormEndMonth() == "12" ? "selected" : ""} >12</option>						
		</select>
		&nbsp;月
<select size="1" name="endDay">
	<option value="01" ${formUp.getFormEndDay() == "01" ? "selected" : ""} >01</option> <option value="02" ${formUp.getFormEndDay() == "02" ? "selected" : ""} >02</option>
	<option value="03" ${formUp.getFormEndDay() == "03" ? "selected" : ""} >03</option> <option value="04" ${formUp.getFormEndDay() == "04" ? "selected" : ""} >04</option>
	<option value="05" ${formUp.getFormEndDay() == "05" ? "selected" : ""} >05</option> <option value="06" ${formUp.getFormEndDay() == "06" ? "selected" : ""} >06</option>
	<option value="07" ${formUp.getFormEndDay() == "07" ? "selected" : ""} >07</option> <option value="08" ${formUp.getFormEndDay() == "08" ? "selected" : ""} >08</option>
	<option value="09" ${formUp.getFormEndDay() == "09" ? "selected" : ""} >09</option> <option value="10" ${formUp.getFormEndDay() == "10" ? "selected" : ""} >10</option>
	<option value="11" ${formUp.getFormEndDay() == "11" ? "selected" : ""} >11</option> <option value="12" ${formUp.getFormEndDay() == "12" ? "selected" : ""} >12</option>
	<option value="13" ${formUp.getFormEndDay() == "13" ? "selected" : ""} >13</option> <option value="14" ${formUp.getFormEndDay() == "14" ? "selected" : ""} >14</option>
	<option value="15" ${formUp.getFormEndDay() == "15" ? "selected" : ""} >15</option> <option value="16" ${formUp.getFormEndDay() == "16" ? "selected" : ""} >16</option>
	<option value="17" ${formUp.getFormEndDay() == "17" ? "selected" : ""} >17</option> <option value="18" ${formUp.getFormEndDay() == "18" ? "selected" : ""} >18</option>
	<option value="19" ${formUp.getFormEndDay() == "19" ? "selected" : ""} >19</option> <option value="20" ${formUp.getFormEndDay() == "20" ? "selected" : ""} >20</option>
	<option value="21" ${formUp.getFormEndDay() == "21" ? "selected" : ""} >21</option> <option value="22" ${formUp.getFormEndDay() == "22" ? "selected" : ""} >22</option>
	<option value="23" ${formUp.getFormEndDay() == "23" ? "selected" : ""} >23</option> <option value="24" ${formUp.getFormEndDay() == "24" ? "selected" : ""} >24</option>
	<option value="25" ${formUp.getFormEndDay() == "25" ? "selected" : ""} >25</option> <option value="26" ${formUp.getFormEndDay() == "26" ? "selected" : ""} >26</option>
	<option value="27" ${formUp.getFormEndDay() == "27" ? "selected" : ""} >27</option> <option value="28" ${formUp.getFormEndDay() == "28" ? "selected" : ""} >28</option>
	<option value="29" ${formUp.getFormEndDay() == "29" ? "selected" : ""} >29</option> <option value="30" ${formUp.getFormEndDay() == "30" ? "selected" : ""} >30</option>
	<option value="31" ${formUp.getFormEndDay() == "31" ? "selected" : ""} >31</option>		
</select>
&nbsp;日            
            </td>
        </tr>
        
        <tr>
            <th>● 開始/終了時刻</th>
            <td>
<select size="1" name="startHour">
	<option value=""></option>
	<option value="00" ${formUp.getFormStartHour() == "00" ? "selected" : ""} >00</option> <option value="01" ${formUp.getFormStartHour() == "01" ? "selected" : ""} >01</option>
	<option value="02" ${formUp.getFormStartHour() == "02" ? "selected" : ""} >02</option> <option value="03" ${formUp.getFormStartHour() == "03" ? "selected" : ""} >03</option> 
	<option value="04" ${formUp.getFormStartHour() == "04" ? "selected" : ""} >04</option> <option value="05" ${formUp.getFormStartHour() == "05" ? "selected" : ""} >05</option>
	<option value="06" ${formUp.getFormStartHour() == "06" ? "selected" : ""} >06</option> <option value="07" ${formUp.getFormStartHour() == "07" ? "selected" : ""} >07</option> 
	<option value="08" ${formUp.getFormStartHour() == "08" ? "selected" : ""} >08</option> <option value="09" ${formUp.getFormStartHour() == "09" ? "selected" : ""} >09</option>
	<option value="10" ${formUp.getFormStartHour() == "10" ? "selected" : ""} >10</option> <option value="11" ${formUp.getFormStartHour() == "11" ? "selected" : ""} >11</option> 
	<option value="12" ${formUp.getFormStartHour() == "12" ? "selected" : ""} >12</option> <option value="13" ${formUp.getFormStartHour() == "13" ? "selected" : ""} >13</option>
	<option value="14" ${formUp.getFormStartHour() == "14" ? "selected" : ""} >14</option> <option value="15" ${formUp.getFormStartHour() == "15" ? "selected" : ""} >15</option> 					
	<option value="16" ${formUp.getFormStartHour() == "16" ? "selected" : ""} >16</option> <option value="17" ${formUp.getFormStartHour() == "17" ? "selected" : ""} >17</option>
	<option value="18" ${formUp.getFormStartHour() == "18" ? "selected" : ""} >18</option> <option value="19" ${formUp.getFormStartHour() == "19" ? "selected" : ""} >19</option> 
	<option value="20" ${formUp.getFormStartHour() == "20" ? "selected" : ""} >20</option> <option value="21" ${formUp.getFormStartHour() == "21" ? "selected" : ""} >21</option>
	<option value="22" ${formUp.getFormStartHour() == "22" ? "selected" : ""} >22</option> <option value="23" ${formUp.getFormStartHour() == "23" ? "selected" : ""} >23</option> 	
</select>
&nbsp;:&nbsp;
<select size="1" name="startMinute" >
	<option value=""></option>
	<option value="00" ${formUp.getFormStartMinute() == "00" ? "selected" : ""} >00</option> <option value="05" ${formUp.getFormStartMinute() == "05" ? "selected" : ""} >05</option>
	<option value="10" ${formUp.getFormStartMinute() == "10" ? "selected" : ""} >10</option> <option value="15" ${formUp.getFormStartMinute() == "15" ? "selected" : ""} >15</option>
	<option value="20" ${formUp.getFormStartMinute() == "20" ? "selected" : ""} >20</option> <option value="25" ${formUp.getFormStartMinute() == "25" ? "selected" : ""} >25</option>
	<option value="30" ${formUp.getFormStartMinute() == "30" ? "selected" : ""} >30</option> <option value="35" ${formUp.getFormStartMinute() == "35" ? "selected" : ""} >35</option>
	<option value="40" ${formUp.getFormStartMinute() == "40" ? "selected" : ""} >40</option> <option value="45" ${formUp.getFormStartMinute() == "45" ? "selected" : ""} >45</option>
	<option value="50" ${formUp.getFormStartMinute() == "50" ? "selected" : ""} >50</option> <option value="55" ${formUp.getFormStartMinute() == "55" ? "selected" : ""} >55</option> 
</select>
&nbsp;&nbsp;&nbsp;～&nbsp;&nbsp;&nbsp;
<!-- 終了時刻 -->		
<select size="1" name="endHour">
	<option value=""></option>
	<option value="00" ${formUp.getFormEndHour() == "00" ? "selected" : ""} >00</option> <option value="01" ${formUp.getFormEndHour() == "01" ? "selected" : ""} >01</option>
	<option value="02" ${formUp.getFormEndHour() == "02" ? "selected" : ""} >02</option> <option value="03" ${formUp.getFormEndHour() == "03" ? "selected" : ""} >03</option> 
	<option value="04" ${formUp.getFormEndHour() == "04" ? "selected" : ""} >04</option> <option value="05" ${formUp.getFormEndHour() == "05" ? "selected" : ""} >05</option>
	<option value="06" ${formUp.getFormEndHour() == "06" ? "selected" : ""} >06</option> <option value="07" ${formUp.getFormEndHour() == "07" ? "selected" : ""} >07</option> 
	<option value="08" ${formUp.getFormEndHour() == "08" ? "selected" : ""} >08</option> <option value="09" ${formUp.getFormEndHour() == "09" ? "selected" : ""} >09</option>
	<option value="10" ${formUp.getFormEndHour() == "10" ? "selected" : ""} >10</option> <option value="11" ${formUp.getFormEndHour() == "11" ? "selected" : ""} >11</option> 
	<option value="12" ${formUp.getFormEndHour() == "12" ? "selected" : ""} >12</option> <option value="13" ${formUp.getFormEndHour() == "13" ? "selected" : ""} >13</option>
	<option value="14" ${formUp.getFormEndHour() == "14" ? "selected" : ""} >14</option> <option value="15" ${formUp.getFormEndHour() == "15" ? "selected" : ""} >15</option> 					
	<option value="16" ${formUp.getFormEndHour() == "16" ? "selected" : ""} >16</option> <option value="17" ${formUp.getFormEndHour() == "17" ? "selected" : ""} >17</option>
	<option value="18" ${formUp.getFormEndHour() == "18" ? "selected" : ""} >18</option> <option value="19" ${formUp.getFormEndHour() == "19" ? "selected" : ""} >19</option> 
	<option value="20" ${formUp.getFormEndHour() == "20" ? "selected" : ""} >20</option> <option value="21" ${formUp.getFormEndHour() == "21" ? "selected" : ""} >21</option>
	<option value="22" ${formUp.getFormEndHour() == "22" ? "selected" : ""} >22</option> <option value="23" ${formUp.getFormEndHour() == "23" ? "selected" : ""} >23</option> 
</select>
&nbsp;:&nbsp;
<select size="1" name="endMinute" >
	<option value=""></option>
	<option value="00" ${formUp.getFormEndMinute() == "00" ? "selected" : ""} >00</option> <option value="05" ${formUp.getFormEndMinute() == "05" ? "selected" : ""} >05</option>
	<option value="10" ${formUp.getFormEndMinute() == "10" ? "selected" : ""} >10</option> <option value="15" ${formUp.getFormEndMinute() == "15" ? "selected" : ""} >15</option>
	<option value="20" ${formUp.getFormEndMinute() == "20" ? "selected" : ""} >20</option> <option value="25" ${formUp.getFormEndMinute() == "25" ? "selected" : ""} >25</option>
	<option value="30" ${formUp.getFormEndMinute() == "30" ? "selected" : ""} >30</option> <option value="35" ${formUp.getFormEndMinute() == "35" ? "selected" : ""} >35</option>
	<option value="40" ${formUp.getFormEndMinute() == "40" ? "selected" : ""} >40</option> <option value="45" ${formUp.getFormEndMinute() == "45" ? "selected" : ""} >45</option>
	<option value="50" ${formUp.getFormEndMinute() == "50" ? "selected" : ""} >50</option> <option value="55" ${formUp.getFormEndMinute() == "55" ? "selected" : ""} >55</option>  
</select>            
            </td>
        </tr>
        
        <tr>
            <th>● 場所</th>
            <td>
				<%if(formUp == null || formUp.getFormPlace().equals("未記入")  ){ %>
				<input type="text" name="place" />
				<%}else{ %>
				<input type="text" name="place"  value="<%=formUp.getFormPlace() %>"/>				
				<%} %>            
            </td>
        </tr>
        
        <tr>
            <th>● 人</th>
            <td>
				<%if(formUp == null || formUp.getFormPerson().equals("未記入")  ){ %>
				<input type="text" name="person" />
				<%}else{ %>
				<input type="text" name="person"  value="<%=formUp.getFormPerson() %>"/>
				<%} %>            
            </td>
        </tr>
        
        <tr>
            <th>● memo</th>
            <td>
				<%if(formUp == null || formUp.getFormMemo().equals("未記入")  ){ %>
				<input type="text" name="memo" />
				<%}else{ %>
				<input type="text" name="memo"  value="<%=formUp.getFormMemo() %>"/>
				<%} %>            
            </td>
        </tr>
        
        <tr>
            <th>● 色</th>
            <td>
				<input type="radio" name="color" value="C002青" ${formUp.getFormColorName() == "青" ? "checked" : ""} />青　
				<input type="radio" name="color" value="C001赤" ${formUp.getFormColorName() == "赤" ? "checked" : ""} />赤　
				<input type="radio" name="color" value="C004緑" ${formUp.getFormColorName() == "緑" ? "checked" : ""} />緑　
				<input type="radio" name="color" value="C003黄" ${formUp.getFormColorName() == "黄" ? "checked" : ""} />黄　
				<input type="radio" name="color" value="C005なし" ${formUp.getFormColorName() == "なし" ? "checked" : ""} />なし            
            </td>
        </tr>
          
    </tbody>
</table>
				 
		<br><br>
		<input type="submit" value="次へ" class="btn btn-grey btn-radius" style="margin-left: auto;margin-right: auto;" /><br>
		<input type="hidden" name="処理" value="更新確認" />		
		<input type="hidden" name="process" value="内容確認" />		
</form>
	
	<form action="CalendarServlet" method="get">
		<input type="submit" value="ホームに戻る" class="btn btn-grey btn-radius" style="margin-left: auto;margin-right: auto;" /><br><br>
	</form>

</body>
</html>