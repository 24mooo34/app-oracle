package form;

//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.Date;

public class ScheduleForm {
	//フィールド（画面表示用）
	private String formSkd_id;			//予定id
	private String formTitle;		//予定タイトル

	private String formStartYear, formStartMonth, formStartDay;//開始（年、月、日）
	private String formEndYear, formEndMonth, formEndDay;//終了（年、月、日）
	private String formStartHour;	//開始hour
	private String formStartMinute;	//開始minute
	private String formEndHour;	//終了hour
	private String formEndMinute;	//終了minute
	private String formPerson;		//人
	private String formPlace;		//場所
	private String formMemo;		//メモ
	private String formColor;	//色コード
	private String formColorName;	//色名表示用
	
	//予定id
	public String getFormSkd_id() {		return formSkd_id;		}
	public void setFormSkd_id(String formSkd_id) {	this.formSkd_id = formSkd_id;		}
	//予定タイトル
	public String getFormTitle() {	return formTitle;		}
	public void setFormTitle(String formTitle) {	this.formTitle = formTitle;		}	
	/*
	//開始日
	public String getStrStartDay() {return strStartDay;}
	public void setStrStartDay(String year, String month, String day) { this.strStartDay = strDayFormat(year, month, day); }
	//終了日
	public String getStrEndDay() {return strEndDay;}
	public void setStrEndDay(String year, String month, String day) { this.strEndDay = strDayFormat(year, month, day); }
	*/

	//開始year、month、day
	public String getFormStartYear() {return this.formStartYear; }	
	public void setFormStartYear(String formStartYear) {	this.formStartYear = formStartYear;		}
	public String getFormStartMonth() {return this.formStartMonth; }	
	public void setFormStartMonth(String formStartMonth) {	this.formStartMonth = formStartMonth;	}
	public String getFormStartDay() {return this.formStartDay; }	
	public void setFormStartDay(String formStartDay) {	this.formStartDay = formStartDay;	}
	//終了year、month、day
	public String getFormEndYear() {return this.formEndYear; }	
	public void setFormEndYear(String formEndYear) {	this.formEndYear = formEndYear;		}
	public String getFormEndMonth() {return this.formEndMonth; }	
	public void setFormEndMonth(String formEndMonth) {	this.formEndMonth = formEndMonth;	}
	public String getFormEndDay() {return this.formEndDay; }	
	public void setFormEndDay(String formEndDay) {	this.formEndDay = formEndDay;	}	
	//開始hour、minute
	public String getFormStartHour() {	return formStartHour;		}
	public void setFormStartHour(String formStartHour) {	this.formStartHour = timeValue(formStartHour);	}
	public String getFormStartMinute() {	return formStartMinute;		}
	public void setFormStartMinute(String formStartMinute) {	this.formStartMinute = timeValue(formStartMinute);	}
	//終了hour、minute
	public String getFormEndHour() {	return formEndHour;		}
	public void setFormEndHour(String formEndHour) {	this.formEndHour = timeValue(formEndHour );	}
	public String getFormEndMinute() {	return formEndMinute;		}
	public void setFormEndMinute(String formEndMinute) {	this.formEndMinute = timeValue(formEndMinute);	}
	/*
	//終日フラグ
	public int getDayFlag() {	return dayFlag;		}
	public void setDayFlag(int dayFlag) {	this.dayFlag = dayFlag;		}
	*/
	//人
	public String getFormPerson() {		return formPerson;		}
	public void setFormPerson(String formPerson) {	this.formPerson = strValue(formPerson);	}
	//場所
	public String getFormPlace() {	return formPlace;		}
	public void setFormPlace(String formPlace) {	this.formPlace = strValue(formPlace);	}
	//メモ
	public String getFormMemo() {	return formMemo;		}
	public void setFormMemo(String formMemo) {	this.formMemo = strValue(formMemo);	}
	//色コード、色名
	public String getFormColor() {	return formColor;		}
	public void setFormColor(String formColor) {	this.formColor = formColor;		}
	public String getFormColorName() {	return formColorName;		}
	public void setFormColorName(String formColorName) {	this.formColorName = formColorName;		}
	
	//メソッド
	//時間フォーマット、未記入時は「指定なし」を設定する
	private String timeValue(String value) {
		String time;
		if(value==null || value.equals("")) {
		time = "指定なし";	
		}else {
		time = value;		
		}
		return time;
	}
	//「未記入」を設定する
	private String strValue(String value) {
		if(value==null || value.equals("")) {
			String nullStr = "未記入";
			return nullStr;
		}else {
			return value;	
		}					
	}

	
}
