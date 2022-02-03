/*
 * Holidayテーブル
 */
package dto;

public class HolidayDTO {
	//フィールド
	private String hols_cd;			//祝日名cd
	private String holidayName;	//祝日名
	
	//コンストラクタ
		//引数なし
		public HolidayDTO() {	}	
		//引数あり
		public HolidayDTO(String hols_cd,  String holidayName) {
			this.hols_cd = hols_cd;			
			this.holidayName = holidayName;
		}

	//アクセス用メソッド（※変更は発生しないためsetterなし）
		//祝日名cd
		public String getHols_cd() {
			return this.hols_cd;
		}
		//祝日名
		public String getHolidayName() {
			return this.holidayName;
		}	

}
