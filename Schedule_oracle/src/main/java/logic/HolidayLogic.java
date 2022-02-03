package logic;

//import java.sql.Connection;
import java.util.ArrayList;

import dao.DAOfactory;
//import dao.DBconnection;
import dao.HolidayDAO;
import dto.HolidayCalendarDTO;

public class HolidayLogic {
	//DBコネクション
	//private Connection con = DBconnection.connection();	
		
/*--------------------------------------------------------------------------------------------------------
 * 祝日を検索するロジック
 --------------------------------------------------------------------------------------------------------*/
			public ArrayList<HolidayCalendarDTO> setHoliday(int year, int month, int lastMonthDay)  {
				//戻り値の準備（HolidayCalendarDTO型の配列で戻ってくる）
				ArrayList<HolidayCalendarDTO> holidayCalendar = new ArrayList<HolidayCalendarDTO>();
				
				//数値からStringに変換
				String stryear =  String.valueOf(year);	//年
				String strmonth =  String.valueOf(month);	//月		
				String strlastMonthDay =  String.valueOf(lastMonthDay);	//月末の日付
				//月初と月末を文字列で表記
				String strFirstDay = stryear + "/" + strmonth + "/01 00:00:00" ;	//月初：yyyy/mm/01  00:00:00
				String strLastDay= stryear + "/" + strmonth + "/" + strlastMonthDay + " 23:59:59" ;		//月末：yyyy/mm/dd  23:59:59
								
				System.out.println("カレンダー日付：" + strFirstDay+"~"+strLastDay);
				
				//con付でDAO生成する				
				//FactoryからDAO生成
				//HolidayDAO dao = DAOfactory.createHolidayDAO(con);
				HolidayDAO dao = DAOfactory.createHolidayDAO();
				holidayCalendar = dao.select(strFirstDay, strLastDay);
				
				//戻り値を返す
				return holidayCalendar;
								
			}	
}
