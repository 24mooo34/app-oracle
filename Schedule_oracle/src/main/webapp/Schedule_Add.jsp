<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="dto.ScheduleDTO" %><%@ page import="form.ScheduleForm" %>
 <%ScheduleForm formAdd = (ScheduleForm) request.getAttribute("formAdd");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>予定追加画面★★★</title>
	<link rel="stylesheet"  href="css/Schedule.css">
</head>
<body>

	<h4>予定を入力してください。</h4><br>	
	
<form action="ScheduleServlet" method="post">
	
	<table>
    <tbody>
    
        <tr>
            <th>● タイトル </th>
            <td>
				<%if(formAdd == null ){ %>
					<input type="text" name="skdTitle" size="55" required="required"/>	
				<%}else{ %>
					<input type="text" name="skdTitle" size="55" required="required" value="<%=formAdd.getFormTitle() %>">
				<%} %>                                   
            </td>
        </tr>
        
         <tr>
            <th>● 開始日</th>
            <td>
				<select size="1" name="startYear"  required="required">
				
					<%if(formAdd == null ){ %>
						<option value="2021" >2021</option> 
						<option value="2022" selected="selected">2022</option> 
						<option value="2023" >2023</option>	
					<%}else{ %>					
						<option value="2021" ${formAdd.getFormStartYear() == "2021" ? "selected" : ""}>2021</option> 
						<option value="2022" ${formAdd.getFormStartYear() == "2022" ? "selected" : ""}>2022</option> 
						<option value="2023" ${formAdd.getFormStartYear() == "2023" ? "selected" : ""}>2023</option>
					<%} %>
					
				</select>
				&nbsp;年
				<select size="1" name="startMonth" required="required">
					<option value="01" ${formAdd.getFormStartMonth() == "01" ? "selected" : ""} >01</option>
					<option value="02" ${formAdd.getFormStartMonth() == "02" ? "selected" : ""} >02</option>
					<option value="03" ${formAdd.getFormStartMonth() == "03" ? "selected" : ""} >03</option>
					<option value="04" ${formAdd.getFormStartMonth() == "04" ? "selected" : ""} >04</option>
					<option value="05" ${formAdd.getFormStartMonth() == "05" ? "selected" : ""} >05</option>
					<option value="06" ${formAdd.getFormStartMonth() == "06" ? "selected" : ""} >06</option>
					<option value="07" ${formAdd.getFormStartMonth() == "07" ? "selected" : ""} >07</option>
					<option value="08" ${formAdd.getFormStartMonth() == "08" ? "selected" : ""} >08</option>
					<option value="09" ${formAdd.getFormStartMonth() == "09" ? "selected" : ""} >09</option>
					<option value="10" ${formAdd.getFormStartMonth() == "10" ? "selected" : ""} >10</option>
					<option value="11" ${formAdd.getFormStartMonth() == "11" ? "selected" : ""} >11</option>
					<option value="12" ${formAdd.getFormStartMonth() == "12" ? "selected" : ""} >12</option>							
				</select>
				&nbsp;月
				<select size="1" name="startDay" required="required">
<option value="01" ${formAdd.getFormStartDay() == "01" ? "selected" : ""} >01</option> <option value="02" ${formAdd.getFormStartDay() == "02" ? "selected" : ""} >02</option>
<option value="03" ${formAdd.getFormStartDay() == "03" ? "selected" : ""} >03</option> <option value="04" ${formAdd.getFormStartDay() == "04" ? "selected" : ""} >04</option>
<option value="05" ${formAdd.getFormStartDay() == "05" ? "selected" : ""} >05</option> <option value="06" ${formAdd.getFormStartDay() == "06" ? "selected" : ""} >06</option>
<option value="07" ${formAdd.getFormStartDay() == "07" ? "selected" : ""} >07</option> <option value="08" ${formAdd.getFormStartDay() == "08" ? "selected" : ""} >08</option>
<option value="09" ${formAdd.getFormStartDay() == "09" ? "selected" : ""} >09</option> <option value="10" ${formAdd.getFormStartDay() == "10" ? "selected" : ""} >10</option>
<option value="11" ${formAdd.getFormStartDay() == "11" ? "selected" : ""} >11</option> <option value="12" ${formAdd.getFormStartDay() == "12" ? "selected" : ""} >12</option>
<option value="13" ${formAdd.getFormStartDay() == "13" ? "selected" : ""} >13</option> <option value="14" ${formAdd.getFormStartDay() == "14" ? "selected" : ""} >14</option>
<option value="15" ${formAdd.getFormStartDay() == "15" ? "selected" : ""} >15</option> <option value="16" ${formAdd.getFormStartDay() == "16" ? "selected" : ""} >16</option>
<option value="17" ${formAdd.getFormStartDay() == "17" ? "selected" : ""} >17</option> <option value="18" ${formAdd.getFormStartDay() == "18" ? "selected" : ""} >18</option>
<option value="19" ${formAdd.getFormStartDay() == "19" ? "selected" : ""} >19</option> <option value="20" ${formAdd.getFormStartDay() == "20" ? "selected" : ""} >20</option>
<option value="21" ${formAdd.getFormStartDay() == "21" ? "selected" : ""} >21</option> <option value="22" ${formAdd.getFormStartDay() == "22" ? "selected" : ""} >22</option>
<option value="23" ${formAdd.getFormStartDay() == "23" ? "selected" : ""} >23</option> <option value="24" ${formAdd.getFormStartDay() == "24" ? "selected" : ""} >24</option>
<option value="25" ${formAdd.getFormStartDay() == "25" ? "selected" : ""} >25</option> <option value="26" ${formAdd.getFormStartDay() == "26" ? "selected" : ""} >26</option>
<option value="27" ${formAdd.getFormStartDay() == "27" ? "selected" : ""} >27</option> <option value="28" ${formAdd.getFormStartDay() == "28" ? "selected" : ""} >28</option>
<option value="29" ${formAdd.getFormStartDay() == "29" ? "selected" : ""} >29</option> <option value="30" ${formAdd.getFormStartDay() == "30" ? "selected" : ""} >30</option>
<option value="31" ${formAdd.getFormStartDay() == "31" ? "selected" : ""} >31</option>		
	  		</select>
	  		&nbsp;日            
            </td>
        </tr>
        
         <tr>
            <th>● 終了日</th>
            <td>
		<select size="1" name="endYear" required="required">
		
					<%if(formAdd == null ){ %>
						<option value="2021" >2021</option> 
						<option value="2022" selected="selected">2022</option> 
						<option value="2023" >2023</option>	
					<%}else{ %>					
						<option value="2021" ${formAdd.getFormEndYear() == "2021" ? "selected" : ""}>2021</option> 
						<option value="2022" ${formAdd.getFormEndYear() == "2022" ? "selected" : ""}>2022</option> 
						<option value="2023" ${formAdd.getFormEndYear() == "2023" ? "selected" : ""}>2023</option>
					<%} %>		

		</select>
		&nbsp;年
		<select size="1" name="endMonth" required="required">
			<option value="01" ${formAdd.getFormEndMonth() == "01" ? "selected" : ""} >01</option>
			<option value="02" ${formAdd.getFormEndMonth() == "02" ? "selected" : ""} >02</option>
			<option value="03" ${formAdd.getFormEndMonth() == "03" ? "selected" : ""} >03</option>
			<option value="04" ${formAdd.getFormEndMonth() == "04" ? "selected" : ""} >04</option>
			<option value="05" ${formAdd.getFormEndMonth() == "05" ? "selected" : ""} >05</option>
			<option value="06" ${formAdd.getFormEndMonth() == "06" ? "selected" : ""} >06</option>
			<option value="07" ${formAdd.getFormEndMonth() == "07" ? "selected" : ""} >07</option>
			<option value="08" ${formAdd.getFormEndMonth() == "08" ? "selected" : ""} >08</option>
			<option value="09" ${formAdd.getFormEndMonth() == "09" ? "selected" : ""} >09</option>
			<option value="10" ${formAdd.getFormEndMonth() == "10" ? "selected" : ""} >10</option>
			<option value="11" ${formAdd.getFormEndMonth() == "11" ? "selected" : ""} >11</option>
			<option value="12" ${formAdd.getFormEndMonth() == "12" ? "selected" : ""} >12</option>						
		</select>
		&nbsp;月
<select size="1" name="endDay">
	<option value="01" ${formAdd.getFormEndDay() == "01" ? "selected" : ""} >01</option> <option value="02" ${formAdd.getFormEndDay() == "02" ? "selected" : ""} >02</option>
	<option value="03" ${formAdd.getFormEndDay() == "03" ? "selected" : ""} >03</option> <option value="04" ${formAdd.getFormEndDay() == "04" ? "selected" : ""} >04</option>
	<option value="05" ${formAdd.getFormEndDay() == "05" ? "selected" : ""} >05</option> <option value="06" ${formAdd.getFormEndDay() == "06" ? "selected" : ""} >06</option>
	<option value="07" ${formAdd.getFormEndDay() == "07" ? "selected" : ""} >07</option> <option value="08" ${formAdd.getFormEndDay() == "08" ? "selected" : ""} >08</option>
	<option value="09" ${formAdd.getFormEndDay() == "09" ? "selected" : ""} >09</option> <option value="10" ${formAdd.getFormEndDay() == "10" ? "selected" : ""} >10</option>
	<option value="11" ${formAdd.getFormEndDay() == "11" ? "selected" : ""} >11</option> <option value="12" ${formAdd.getFormEndDay() == "12" ? "selected" : ""} >12</option>
	<option value="13" ${formAdd.getFormEndDay() == "13" ? "selected" : ""} >13</option> <option value="14" ${formAdd.getFormEndDay() == "14" ? "selected" : ""} >14</option>
	<option value="15" ${formAdd.getFormEndDay() == "15" ? "selected" : ""} >15</option> <option value="16" ${formAdd.getFormEndDay() == "16" ? "selected" : ""} >16</option>
	<option value="17" ${formAdd.getFormEndDay() == "17" ? "selected" : ""} >17</option> <option value="18" ${formAdd.getFormEndDay() == "18" ? "selected" : ""} >18</option>
	<option value="19" ${formAdd.getFormEndDay() == "19" ? "selected" : ""} >19</option> <option value="20" ${formAdd.getFormEndDay() == "20" ? "selected" : ""} >20</option>
	<option value="21" ${formAdd.getFormEndDay() == "21" ? "selected" : ""} >21</option> <option value="22" ${formAdd.getFormEndDay() == "22" ? "selected" : ""} >22</option>
	<option value="23" ${formAdd.getFormEndDay() == "23" ? "selected" : ""} >23</option> <option value="24" ${formAdd.getFormEndDay() == "24" ? "selected" : ""} >24</option>
	<option value="25" ${formAdd.getFormEndDay() == "25" ? "selected" : ""} >25</option> <option value="26" ${formAdd.getFormEndDay() == "26" ? "selected" : ""} >26</option>
	<option value="27" ${formAdd.getFormEndDay() == "27" ? "selected" : ""} >27</option> <option value="28" ${formAdd.getFormEndDay() == "28" ? "selected" : ""} >28</option>
	<option value="29" ${formAdd.getFormEndDay() == "29" ? "selected" : ""} >29</option> <option value="30" ${formAdd.getFormEndDay() == "30" ? "selected" : ""} >30</option>
	<option value="31" ${formAdd.getFormEndDay() == "31" ? "selected" : ""} >31</option>		
</select>
&nbsp;日            
            </td>
        </tr>
        
        <tr>
            <th>● 開始/終了時刻</th>
            <td>
<select size="1" name="startHour">
	<option value=""></option>
	<option value="00" ${formAdd.getFormStartHour() == "00" ? "selected" : ""} >00</option> <option value="01" ${formAdd.getFormStartHour() == "01" ? "selected" : ""} >01</option>
	<option value="02" ${formAdd.getFormStartHour() == "02" ? "selected" : ""} >02</option> <option value="03" ${formAdd.getFormStartHour() == "03" ? "selected" : ""} >03</option> 
	<option value="04" ${formAdd.getFormStartHour() == "04" ? "selected" : ""} >04</option> <option value="05" ${formAdd.getFormStartHour() == "05" ? "selected" : ""} >05</option>
	<option value="06" ${formAdd.getFormStartHour() == "06" ? "selected" : ""} >06</option> <option value="07" ${formAdd.getFormStartHour() == "07" ? "selected" : ""} >07</option> 
	<option value="08" ${formAdd.getFormStartHour() == "08" ? "selected" : ""} >08</option> <option value="09" ${formAdd.getFormStartHour() == "09" ? "selected" : ""} >09</option>
	<option value="10" ${formAdd.getFormStartHour() == "10" ? "selected" : ""} >10</option> <option value="11" ${formAdd.getFormStartHour() == "11" ? "selected" : ""} >11</option> 
	<option value="12" ${formAdd.getFormStartHour() == "12" ? "selected" : ""} >12</option> <option value="13" ${formAdd.getFormStartHour() == "13" ? "selected" : ""} >13</option>
	<option value="14" ${formAdd.getFormStartHour() == "14" ? "selected" : ""} >14</option> <option value="15" ${formAdd.getFormStartHour() == "15" ? "selected" : ""} >15</option> 					
	<option value="16" ${formAdd.getFormStartHour() == "16" ? "selected" : ""} >16</option> <option value="17" ${formAdd.getFormStartHour() == "17" ? "selected" : ""} >17</option>
	<option value="18" ${formAdd.getFormStartHour() == "18" ? "selected" : ""} >18</option> <option value="19" ${formAdd.getFormStartHour() == "19" ? "selected" : ""} >19</option> 
	<option value="20" ${formAdd.getFormStartHour() == "20" ? "selected" : ""} >20</option> <option value="21" ${formAdd.getFormStartHour() == "21" ? "selected" : ""} >21</option>
	<option value="22" ${formAdd.getFormStartHour() == "22" ? "selected" : ""} >22</option> <option value="23" ${formAdd.getFormStartHour() == "23" ? "selected" : ""} >23</option> 	
</select>
&nbsp;:&nbsp;
<select size="1" name="startMinute" >
	<option value=""></option>
	<option value="00" ${formAdd.getFormStartMinute() == "00" ? "selected" : ""} >00</option> <option value="05" ${formAdd.getFormStartMinute() == "05" ? "selected" : ""} >05</option>
	<option value="10" ${formAdd.getFormStartMinute() == "10" ? "selected" : ""} >10</option> <option value="15" ${formAdd.getFormStartMinute() == "15" ? "selected" : ""} >15</option>
	<option value="20" ${formAdd.getFormStartMinute() == "20" ? "selected" : ""} >20</option> <option value="25" ${formAdd.getFormStartMinute() == "25" ? "selected" : ""} >25</option>
	<option value="30" ${formAdd.getFormStartMinute() == "30" ? "selected" : ""} >30</option> <option value="35" ${formAdd.getFormStartMinute() == "35" ? "selected" : ""} >35</option>
	<option value="40" ${formAdd.getFormStartMinute() == "40" ? "selected" : ""} >40</option> <option value="45" ${formAdd.getFormStartMinute() == "45" ? "selected" : ""} >45</option>
	<option value="50" ${formAdd.getFormStartMinute() == "50" ? "selected" : ""} >50</option> <option value="55" ${formAdd.getFormStartMinute() == "55" ? "selected" : ""} >55</option> 
</select>
&nbsp;&nbsp;&nbsp;～&nbsp;&nbsp;&nbsp;
<!-- 終了時刻 -->		
<select size="1" name="endHour">
	<option value=""></option>
	<option value="00" ${formAdd.getFormEndHour() == "00" ? "selected" : ""} >00</option> <option value="01" ${formAdd.getFormEndHour() == "01" ? "selected" : ""} >01</option>
	<option value="02" ${formAdd.getFormEndHour() == "02" ? "selected" : ""} >02</option> <option value="03" ${formAdd.getFormEndHour() == "03" ? "selected" : ""} >03</option> 
	<option value="04" ${formAdd.getFormEndHour() == "04" ? "selected" : ""} >04</option> <option value="05" ${formAdd.getFormEndHour() == "05" ? "selected" : ""} >05</option>
	<option value="06" ${formAdd.getFormEndHour() == "06" ? "selected" : ""} >06</option> <option value="07" ${formAdd.getFormEndHour() == "07" ? "selected" : ""} >07</option> 
	<option value="08" ${formAdd.getFormEndHour() == "08" ? "selected" : ""} >08</option> <option value="09" ${formAdd.getFormEndHour() == "09" ? "selected" : ""} >09</option>
	<option value="10" ${formAdd.getFormEndHour() == "10" ? "selected" : ""} >10</option> <option value="11" ${formAdd.getFormEndHour() == "11" ? "selected" : ""} >11</option> 
	<option value="12" ${formAdd.getFormEndHour() == "12" ? "selected" : ""} >12</option> <option value="13" ${formAdd.getFormEndHour() == "13" ? "selected" : ""} >13</option>
	<option value="14" ${formAdd.getFormEndHour() == "14" ? "selected" : ""} >14</option> <option value="15" ${formAdd.getFormEndHour() == "15" ? "selected" : ""} >15</option> 					
	<option value="16" ${formAdd.getFormEndHour() == "16" ? "selected" : ""} >16</option> <option value="17" ${formAdd.getFormEndHour() == "17" ? "selected" : ""} >17</option>
	<option value="18" ${formAdd.getFormEndHour() == "18" ? "selected" : ""} >18</option> <option value="19" ${formAdd.getFormEndHour() == "19" ? "selected" : ""} >19</option> 
	<option value="20" ${formAdd.getFormEndHour() == "20" ? "selected" : ""} >20</option> <option value="21" ${formAdd.getFormEndHour() == "21" ? "selected" : ""} >21</option>
	<option value="22" ${formAdd.getFormEndHour() == "22" ? "selected" : ""} >22</option> <option value="23" ${formAdd.getFormEndHour() == "23" ? "selected" : ""} >23</option> 
</select>
&nbsp;:&nbsp;
<select size="1" name="endMinute" >
	<option value=""></option>
	<option value="00" ${formAdd.getFormEndMinute() == "00" ? "selected" : ""} >00</option> <option value="05" ${formAdd.getFormEndMinute() == "05" ? "selected" : ""} >05</option>
	<option value="10" ${formAdd.getFormEndMinute() == "10" ? "selected" : ""} >10</option> <option value="15" ${formAdd.getFormEndMinute() == "15" ? "selected" : ""} >15</option>
	<option value="20" ${formAdd.getFormEndMinute() == "20" ? "selected" : ""} >20</option> <option value="25" ${formAdd.getFormEndMinute() == "25" ? "selected" : ""} >25</option>
	<option value="30" ${formAdd.getFormEndMinute() == "30" ? "selected" : ""} >30</option> <option value="35" ${formAdd.getFormEndMinute() == "35" ? "selected" : ""} >35</option>
	<option value="40" ${formAdd.getFormEndMinute() == "40" ? "selected" : ""} >40</option> <option value="45" ${formAdd.getFormEndMinute() == "45" ? "selected" : ""} >45</option>
	<option value="50" ${formAdd.getFormEndMinute() == "50" ? "selected" : ""} >50</option> <option value="55" ${formAdd.getFormEndMinute() == "55" ? "selected" : ""} >55</option>  
</select>            
            </td>
        </tr>
        
        <tr>
            <th>● 場所</th>
            <td>
				<%if(formAdd == null || formAdd.getFormPlace().equals("未記入")  ){ %>
				<input type="text" name="place" />
				<%}else{ %>
				<input type="text" name="place"  value="<%=formAdd.getFormPlace() %>"/>				
				<%} %>            
            </td>
        </tr>
        
        <tr>
            <th>● 人</th>
            <td>
				<%if(formAdd == null || formAdd.getFormPerson().equals("未記入")  ){ %>
				<input type="text" name="person" />
				<%}else{ %>
				<input type="text" name="person"  value="<%=formAdd.getFormPerson() %>"/>
				<%} %>            
            </td>
        </tr>
        
        <tr>
            <th>● memo</th>
            <td>
				<%if(formAdd == null || formAdd.getFormMemo().equals("未記入")  ){ %>
				<input type="text" name="memo" />
				<%}else{ %>
				<input type="text" name="memo"  value="<%=formAdd.getFormMemo() %>"/>
				<%} %>            
            </td>
        </tr>
        
        <tr>
            <th>● 色</th>
            <td>
				<input type="radio" name="color" value="C002青" ${formAdd.getFormColorName() == "青" ? "checked" : ""} />青　
				<input type="radio" name="color" value="C001赤" ${formAdd.getFormColorName() == "赤" ? "checked" : ""} />赤　
				<input type="radio" name="color" value="C004緑" ${formAdd.getFormColorName() == "緑" ? "checked" : ""} />緑　
				<input type="radio" name="color" value="C003黄" ${formAdd.getFormColorName() == "黄" ? "checked" : ""} />黄　
				<input type="radio" name="color" value="C005なし" ${formAdd.getFormColorName() == "なし" ? "checked" : ""} />なし            
            </td>
        </tr>
          
    </tbody>
</table>
	
		 
					  <br>
		<input type="submit" value="次へ"  class="btn btn-grey btn-radius" style="text-align:center" /><br>
		<input type="hidden" name="処理" value="追加確認" />		
		<input type="hidden" name="process" value="内容確認" />			
</form>

<form action="CalendarServlet" method="get">
	<input type="submit" value="ホームに戻る" class="btn btn-grey btn-radius" style="margin-left: auto;margin-right: auto;" /><br><br>
</form>



</body>
</html>