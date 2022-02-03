/*
 * HolidayCalendarテーブル
 */
package dto;

import java.util.Date;

public class HolidayCalendarDTO {
	//フィールド
	private String holiday_cd;			//祝日cd
	private Date holidayDate;			//日付
	private HolidayDTO holidayDto;	//祝日名cd
	
	//コンストラクタ
		//引数なし
		public HolidayCalendarDTO() {	}	
		//引数あり
		public HolidayCalendarDTO(String holiday_cd, Date holidayDate,  HolidayDTO holidayDto) {
			this.holiday_cd = holiday_cd;			
			this.holidayDate = holidayDate;
			this.holidayDto = holidayDto;
		}
	
	//アクセス用メソッド（※変更は発生しないためsetterなし）
		//祝日cd
		public String getHoliday_cd() {
			return this.holiday_cd;
		}
		//日付
		public Date getHolidayDate() {
			return this.holidayDate;
		}
		//祝日名cdから祝日名を返す
		public String getHolidayDto() {
			//return holidayDto.getHols_cd();
			return holidayDto.getHolidayName();
		}

}
