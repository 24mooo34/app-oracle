/*
 * カレンダーに必要なフィールド＋α
 */
package form;

import java.util.ArrayList;

import dto.HolidayCalendarDTO;
import dto.ScheduleDTO;

public class CalendarForm {
	//フィールド	
	private int year;	//カレンダーの年
	private int month;	//カレンダーの月
	private String[][] data;	//カレンダーの日付を保持する配列
	private int lastmonthday;	//月末の日付
	
	private ArrayList<HolidayCalendarDTO> holiday;	//祝日
	private ArrayList<ScheduleDTO> skd;	//スケジュール
	
	//アクセス用メソッド
		//年
		public int getYear() {	return year; }
		public void setYear(int year) {	this.year = year;	}
		//月
		public int getMonth() {	return month;		}
		public void setMonth(int month) {	this.month = month;	}
		//日
		public String[][] getData() {	return data;	}
		public void setData(String[][] data) {	this.data = data;	}
		//月末の日付
		public int getLastmonthday() {	return lastmonthday;	}
		public void setLastmonthday(int lastmonthday) {	this.lastmonthday = lastmonthday; 	}

		//祝日
		public ArrayList<HolidayCalendarDTO> getHoliday(){	return holiday;	}
		public void setHoliday(ArrayList<HolidayCalendarDTO> holiday) {	this.holiday = holiday;	}
		//スケジュール
		public ArrayList<ScheduleDTO> getSkd(){	return skd;	}
		public void setSkd(ArrayList<ScheduleDTO> skd) {	this.skd = skd;	}
		


}
