package logic;

//import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;

//import dao.DBconnection;
import dto.HolidayCalendarDTO;
import dto.ScheduleDTO;
import form.CalendarForm;

public class CalendarLogic {
//	//DBコネクション取得
//	Connection con;
//	//コンストラクタ
//	public CalendarLogic(){ }
//	public CalendarLogic(Connection con){ this.con = con; }
	
/*--------------------------------------------------------------------------------------------------------
 * カレンダー（＋祝日+予定）を生成する
 --------------------------------------------------------------------------------------------------------*/
		public CalendarForm createCalendar(int... args) {
			//カレンダーDTOインスタンス生成
			CalendarForm calendar=new CalendarForm();
			//現在日時でカレンダーインスタンス生成
			Calendar cal=Calendar.getInstance();
			
			/*引数が２つ（先月or来月を取得する場合）*/
			if(args.length==2) {					
				cal.set(Calendar.YEAR, args[0]);			//1つ目の引数で年を設定					
				cal.set(Calendar.MONTH, args[1]-1);	//2つ目の引数で月を設定
			}
				
			//今月の年月を設定
			calendar.setYear(cal.get(Calendar.YEAR));	//年			
			calendar.setMonth(cal.get(Calendar.MONTH)+1);	//月
			
			//今月の1日が何曜日かを調べる為に日付を1日にする
			cal.set(Calendar.DATE, 1);
			//カレンダーの最初の空白の数（1週目のなかで先月の部分）
			int before = cal.get(Calendar.DAY_OF_WEEK)-1;
			//カレンダーの日付の数（今月が何日まであるか）
			int daysCount = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			calendar.setLastmonthday(daysCount);
			//今月末が何曜日になるかを調べるために日付を最終日にする
			cal.set(Calendar.DATE, daysCount);	//dayCountは月末の日付
			//月末後の空白の数（最終週のなかで来月の部分）
			int after = 7 - cal.get(Calendar.DAY_OF_WEEK);
			//すべての要素数
			int total = before + daysCount + after;
			//その要素数を幅7個の配列に入れていった場合何行になるか
			int rows = total / 7 ;
			//その行数で2次元配列を生成（[行]×[列]）
			String[][] data = new String[rows][7];	//日
			
			/*今見ているカレンダーが今月かどうかを調べるために、
			 * 今時点の日付情報をもつインスタンスを追加で作成する*/
			Calendar now = Calendar.getInstance();
			for(int i = 0; i < rows; i++) {
				for(int j = 0; j < 7; j++) {
					if(i == 0  &&  j < before  ||  i == rows - 1  &&  j >= (7-after) ) {
						//カレンダーの前後に入る空白の部分は空文字
						data[i][j] = "";
					}else {
						//カウンター変数と実際の日付の変換
						int date = i * 7 + j + 1 - before;
						//配列に日付を入れる
						data[i][j] = String.valueOf(date);
						//今作業しているカレンダーが今月のカレンダーだったら今日の日付に印「*」をつける
						if(now.get(Calendar.DATE) == date  
								&&  now.get(Calendar.MONTH) == calendar.getMonth()-1  &&  now.get(Calendar.YEAR) == calendar.getYear() ) {
							data[i][j]="*"+data[i][j];
						}
					}
				}
			}
			//作成した配列をカレンダーにセットする。
			calendar.setData(data);
			
			
			/*--------------祝日を設定する--------------*/
				//祝日Logic呼び出し
				HolidayLogic hLogic = new HolidayLogic();
				ArrayList<HolidayCalendarDTO> holiday = hLogic.setHoliday(calendar.getYear(), calendar.getMonth(), calendar.getLastmonthday());
				//取得した祝日をカレンダーにセットする。
				calendar.setHoliday(holiday);	

								
				
			/*--------------予定を設定する--------------*/	
				//スケジュールLogic呼び出し
				ScheduleLogic sLogic = new ScheduleLogic();
				ArrayList<ScheduleDTO> schedule = sLogic.setSchedule(calendar.getYear(), calendar.getMonth(), calendar.getLastmonthday());				
				//取得した予定をカレンダーにセットする。
				calendar.setSkd(schedule);
							
			return calendar;
		}

}
