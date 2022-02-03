package dto;

import java.util.Date;

public class ScheduleDTO {
	//フィールド
	private int skd_id;			//予定id
	private String skdTitle;		//予定タイトル
	private Date startDay;	private String strStartDay;		//開始日
	private Date endDay;	private String strEndDay;		//終了日

	private String startTime;	//開始時刻
	private String endTime;	//終了時刻
	//private int dayFlag;			//終日フラグ
	private String person;		//人
	private String place;		//場所
	private String memo;		//メモ
	private ColorDTO colorDto = new ColorDTO();	//色
		
	//コンストラクタ
		//引数なし
		public ScheduleDTO() {	}	
		//引数あり
		public ScheduleDTO(int skd_id, String skdTitle, Date startDay, Date endDay, String startTime, String endTime,
											String person,  String place, String memo, ColorDTO colorDto) {
			this.skd_id = skd_id;	this.skdTitle = skdTitle;	
			this.startDay = startDay;	this.endDay = endDay;	
			this.startTime = startTime;		this.endTime = endTime;	
			this.person= person;	this.place = place; 	this.memo = memo;	
			this.colorDto = colorDto;
		}
		
	//アクセス用メソッド
		//予定id
		public int getSkd_id() {		return skd_id;		}
		public void setSkd_id(int skd_id) {	this.skd_id = skd_id;		}
		//予定タイトル
		public String getSkdTitle() {	return skdTitle;		}
		public void setSkdTitle(String skdTitle) {	this.skdTitle = skdTitle;		}
		//開始日
		public Date getStartDay() {	return startDay;		}
		public void setStartDay(Date startDay) {this.startDay = startDay;}
		public String getStrStartDay() {	return strStartDay;		}
		public void setStrStartDay(String year, String month, String day) {this.strStartDay = dayFormat(year, month, day);}		
		//終了日
		public Date getEndDay() {	return endDay;		}
		public void setEndDay(Date endDay) {this.endDay = endDay;}
		public String getStrEndDay() {	return strEndDay;		}
		public void setStrEndDay(String year, String month, String day) {this.strEndDay = dayFormat(year, month, day);}	
		//開始時刻
		public String getStartTime() {	return startTime;		}
		public void setStartTime(String hour, String minute) {	this.startTime = 	timeFormat(hour, minute);	}
		//終了時刻
		public String getEndTime() {		return endTime;		}
		public void setEndTime(String hour, String minute) {	this.endTime = 	timeFormat(hour, minute);}
		/*
		//終日フラグ
		public int getDayFlag() {	return dayFlag;		}
		public void setDayFlag(int dayFlag) {	this.dayFlag = dayFlag;		}
		*/
		//人
		public String getPerson() {		return person;		}
		public void setPerson(String person) {	this.person = person;	}
		//場所
		public String getPlace() {	return place;		}
		public void setPlace(String place) {	this.place = place;	}
		//メモ
		public String getMemo() {	return memo;		}
		public void setMemo(String memo) {	this.memo = memo;	}
		
		//色コード
		public String getColorDto() { return colorDto.getColor_cd(); }
		public void setColorDto(String color_cd){ this.colorDto.setColor_cd(color_cd); }
		public String getColorDto(String color_cd) {return colorDto.getHtml();	}//HTML
		
		
		
					
	//メソッド
		//日付フォーマット
		private String dayFormat(String year, String month, String day) {
			String strDay = year + "/" + month + "/" + day;
			return strDay;	
		}
		//時間フォーマット
		private String timeFormat(String hour, String minute) {
			String time;
			if(hour==null || hour.equals("") || minute==null || minute.equals("")) {
			time = "指定なし";	
			}else {
			time = hour + ":" + minute ;
			}
			return time;
		}
		/*
		//「未記入」を設定する
		private String setStr(String str) {
			if(str==null || str.equals("")) {
				String nullStr = "未記入";
				return nullStr;
			}else {
				return str;	
			}					
		}
		*/
	

	
}
