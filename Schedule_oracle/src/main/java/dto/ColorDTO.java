package dto;

public class ColorDTO {
	//フィールド
	private String color_cd;		//色コード
	private String html;			//HTMLコード
	
	//コンストラクタ
			//引数なし
			public ColorDTO() {	}	
			//引数あり
			public ColorDTO(String color_cd,  String html) {
				this.color_cd = color_cd;			
				this.html = html;
			}
	
	//アクセス用メソッド
		//色コード
		public String getColor_cd() {
			return color_cd;
		}
		public void setColor_cd(String color_cd) {
			this.color_cd = color_cd; 
		}
		//HTLMコード
		public String getHtml() {
			return html;
		}

		
	

}
