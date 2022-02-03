package logic;

//import java.sql.Connection;
import java.util.ArrayList;

import dao.DAOfactory;
//import dao.DBconnection;
import dao.ScheduleDAO;
import dto.ScheduleDTO;
import form.ScheduleForm;

public class ScheduleLogic {
	//DBコネクション
	//Connection con = DBconnection.connection();
	
	//FactoryからDAO生成
	//ScheduleDAO dao = DAOfactory.createScheduleDAO(con);
	ScheduleDAO dao = DAOfactory.createScheduleDAO();
	
/*
 * ①カレンダーに表示する予定を検索する
 */
	public ArrayList<ScheduleDTO> setSchedule(int year, int month, int lastMonthDay)  {
		ArrayList<ScheduleDTO> scheduleCalendar = new ArrayList<ScheduleDTO>();	//戻り値用
		//数値からStringに変換
		String stryear =  String.valueOf(year);	//年
		String strmonth =  String.valueOf(month);	//月		
		String strlastMonthDay =  String.valueOf(lastMonthDay);	//月末の日付
		//月初と月末を文字列で表記
		String strFirstDay = stryear + "/" + strmonth + "/01 00:00:00" ;	//月初：yyyy/mm/01  00:00:00
		String strLastDay= stryear + "/" + strmonth + "/" + strlastMonthDay + " 23:59:59" ;		//月末：yyyy/mm/dd  23:59:59
		//DAOからメソッド実行
		scheduleCalendar = dao.select(strFirstDay, strLastDay);
		
		//戻り値を返す
		return scheduleCalendar;
	}
	

/*
 * ②予定を1件参照する
 */	
	public ScheduleForm readSchedule(ScheduleForm skd_id) {
		ScheduleForm readSkd = new ScheduleForm();	//戻り値用
		//DAOからメソッド実行
		ArrayList<ScheduleDTO> readList = dao.select(skd_id.getFormSkd_id());
		//DTO⇒form
		for(int i =0; i<readList.size(); i++) {
			readSkd.setFormSkd_id(skd_id.getFormSkd_id());
			readSkd.setFormTitle(readList.get(i).getSkdTitle());
			//開始年月日
			readSkd.setFormStartYear( String.format("%1$tY", readList.get(i).getStartDay())   );
			readSkd.setFormStartMonth( String.format("%1$tm", readList.get(i).getStartDay())  );
			readSkd.setFormStartDay( String.format("%1$td", readList.get(i).getStartDay())  );
			//終了年月日
			readSkd.setFormEndYear( String.format("%1$tY", readList.get(i).getEndDay())  );
			readSkd.setFormEndMonth( String.format("%1$tm", readList.get(i).getEndDay())  );
			readSkd.setFormEndDay( String.format("%1$td", readList.get(i).getEndDay())  );
			//開始時間、終了時間
			readSkd.setFormStartHour( formHour( readList.get(i).getStartTime() ) );
			readSkd.setFormStartMinute( formMinute( readList.get(i).getStartTime() )  );
			readSkd.setFormEndHour( formHour( readList.get(i).getEndTime() ) );
			readSkd.setFormEndMinute( formMinute( readList.get(i).getEndTime() ) );
			//人・場所・メモ・色
			readSkd.setFormPerson( readList.get(i).getPerson()  );
			readSkd.setFormPlace( readList.get(i).getPlace()  );
			readSkd.setFormMemo( readList.get(i).getMemo()  );
			readSkd.setFormColor( readList.get(i).getColorDto()  );
			readSkd.setFormColorName( setFormCName(readList.get(i).getColorDto()) );
		}
		
		//戻り値を返す
		return readSkd;
	}
	
	
/*
 * ③予定を追加する
 */
	public void addSchedule(ScheduleForm formSkd) {
		//付与する予定idの取得
		int skdId = dao.getId();			
		//form⇒DTO
		ScheduleDTO addSkd = formToDTO(formSkd);		
		addSkd.setSkd_id(skdId);	//予定idをset		
		//DAOから追加メソッド実行
		dao.insert(addSkd);
	}
	
/*
 *  ④予定を更新する
 */
	public void upSchedule(ScheduleForm formSkd) {
		//form⇒DTO
		ScheduleDTO upSkd = formToDTO(formSkd);
		//DAOからメソッド実行
		dao.update(upSkd);
	}

/*
 *  ⑤予定を削除する
 */
	public void delSchedule(ScheduleForm skd_id) {
		ScheduleDTO delSkd = new ScheduleDTO();	
		delSkd.setSkd_id(Integer.parseInt(skd_id.getFormSkd_id()));
		//DAOからメソッド実行
		dao.delete(delSkd);
	}

	
	
/*
 * ★formからDTOに変換
 */
	private  ScheduleDTO formToDTO(ScheduleForm formSkd)	{		
		ScheduleDTO skdDto = new ScheduleDTO();//…戻り値用		
		//formをDTOにsetする。
		if(formSkd.getFormSkd_id() == null ) {//…予定追加の場合はnull。
			skdDto.setSkd_id(0);	//とりあえず0を設定し、後で新規idで上書き
		}else {
			skdDto.setSkd_id(Integer.parseInt(formSkd.getFormSkd_id()));	//予定id
		}
		skdDto.setSkdTitle( formSkd.getFormTitle() );	//予定タイトル
		skdDto.setStrStartDay(formSkd.getFormStartYear(), formSkd.getFormStartMonth(), formSkd.getFormStartDay());		//開始日
		skdDto.setStrEndDay(formSkd.getFormEndYear(), formSkd.getFormEndMonth(), formSkd.getFormEndDay());	//終了日
		skdDto.setStartTime(formSkd.getFormStartHour(), formSkd.getFormStartMinute());		//開始時刻
		skdDto.setEndTime(formSkd.getFormEndHour(), formSkd.getFormEndMinute());		//終了時刻
		skdDto.setPerson(formSkd.getFormPerson());		//人
		skdDto.setPlace(formSkd.getFormPlace());		//場所
		skdDto.setMemo(formSkd.getFormMemo());	//メモ
		skdDto.setColorDto(formSkd.getFormColor().substring(0,4));		//カラーコード		
		
		return skdDto;
	}
	
/*
 * ★DTOからformに変換
 */
	//hour
	private String formHour(String time) {
		String hour;
		if(time.matches(".*指定なし*")) {
			hour = "指定なし";
		}else {
			hour = time.substring(0, 2);
		}		
		return hour;
	}
	//minute
	private String formMinute(String time) {
		String minute;
		if(time.matches(".*指定なし*")) {
			minute = "指定なし";
		}else {
			minute = time.substring(3, 5);
		}	
		return minute;
	}
	//表示用カラー名
	private String setFormCName(String colorName) {
		if(colorName.equals("C001")) {
			colorName="赤";
			return colorName;
		}else if(colorName.equals("C002")) {
			colorName="青";
			return colorName;
		}else if(colorName.equals("C003")) {
			colorName="黄";
			return colorName;
		}else if(colorName.equals("C004")) {
			colorName="緑";
			return colorName;
		}else {
			colorName="なし";
			return colorName;
		}
	}
	
	
//	private  ScheduleForm DTOtoForm(ScheduleDTO skdDTO) {
//		ScheduleForm skdForm = new ScheduleForm();//…戻り値用	
//			/*
//			 * ＊＊＊＊＊中身記載する＊＊＊＊＊
//			 */
//		return skdForm;
//	}
	



}
