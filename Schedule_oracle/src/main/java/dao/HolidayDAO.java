package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
//import java.util.List;

import dto.HolidayCalendarDTO;
import dto.HolidayDTO;
import dto.ScheduleDTO;

public class HolidayDAO implements DAOinterface {
	//コネクションインスタンス生成
	Connection con;
	//コンストラクタ
	public HolidayDAO(){ }
	public HolidayDAO(Connection con){ this.con = con; }
	
	/*--------------------------------------------------------------------------------------------------------
	 * select()をオーバーライド（HolidayCalendarテーブルから祝日検索処理）
	 --------------------------------------------------------------------------------------------------------*/
		public ArrayList<HolidayCalendarDTO> select(String... args)  {
			//戻り値の準備（HolidayCalendarDTO型の配列で戻ってくる）
			ArrayList<HolidayCalendarDTO> holidayCalendar = new ArrayList<HolidayCalendarDTO>();
			con = DBconnection.connection();	
			
			/* カレンダーに表示する祝日取得 */				
			if(args.length==2) {
				String firstDay = args[0];
				String lastDay = args[1];										
			try {
				String sql = "SELECT a.holiday_cd, a.holidayDate, a.hols_cd, b.holidayName  " 
		  						+ "FROM HolidayCalendar a JOIN Holiday b ON a.hols_cd = b.hols_cd " 
		  						+ "where a.HolidayDate " 
		  						+ "BETWEEN TO_DATE('"+firstDay+"', 'YY-MM-DD HH24:MI:SS')" 
		  						+ "AND TO_DATE('"+lastDay+"', 'YY-MM-DD HH24:MI:SS')";
				
					//SQL文実行
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					while(rs.next()) {
						String holiday_cd = rs.getString("Holiday_cd");	//カラム名をいれる
						Date holidayDate = rs.getDate("HolidayDate");
						String hols_cd = rs.getString("Hols_cd");	//外部キー	
						String holidayName = rs.getString("HolidayName");	
						HolidayDTO holidayDto =  new HolidayDTO(hols_cd, holidayName);
						//配列にセット
						holidayCalendar.add( new HolidayCalendarDTO(holiday_cd, holidayDate, holidayDto) );
						System.out.println("祝日cd: " + holiday_cd + " 日付: " + holidayDate + "、祝日名: " + holidayName );										
					}			
				}
				catch(SQLException e) {
					e.printStackTrace();
				}
			}
				//DB切断
				DBconnection.close(con);
				
				//戻り値を返す
				return holidayCalendar;		
			}
		
/*--------------------------------------------------------------------------------------------------------
 *（SQLの結果をDTOにsetする）
------------------------------------------------------------------------------------------------------- */	
		public void setDTO(ResultSet rs) {
			//ArrayList<HolidayCalendarDTO> holidayCalendar = new ArrayList<HolidayCalendarDTO>();
		}		
			
		
		//************↓↓↓空実装↓↓↓************
@Override
		public int getId() {
    		try{
    			throw new Exception();  //例外を発生させる   			        
    		}catch(Exception e){
    			System.out.println("メソッドが空実装です。");
    		}
    		return 0;    		
		}
@Override
		public void insert(ScheduleDTO  dto) {
			try{
				throw new Exception();    //例外を発生させる   			        
			}catch(Exception e){
				System.out.println("メソッドが空実装です。");
			}
		};	
@Override	
		public void update(ScheduleDTO  dto) {
			try{
				throw new Exception();  //例外を発生させる     			        
			}catch(Exception e){
				System.out.println("メソッドが空実装です。");
			}
		};	
@Override			
		public void delete(ScheduleDTO  dto) {
			try{
				throw new Exception();  //例外を発生させる     			        
			}catch(Exception e){
				System.out.println("メソッドが空実装です。");
			}
		};	
		
		
}





/*--------------------------------------------------------------------------------------------------------

SQL文原本
	String sql = "select * from HolidayCalendar "
					+ "where HolidayDate "
					+ "BETWEEN TO_DATE('2021/09/01 00:00:00', 'YY-MM-DD HH24:MI:SS') "
					+ "AND TO_DATE('2021/09/30 23:59:59', 'YY-MM-DD HH24:MI:SS')";	

外部キー参照バージョン
  	SELECT a.holiday_cd, a.holidayDate, a.hols_cd, b.holidayName  
	FROM HolidayCalendar a JOIN Holiday b ON a.hols_cd = b.hols_cd 
	where a.HolidayDate
	BETWEEN TO_DATE('2021/09/01 00:00:00', 'YY-MM-DD HH24:MI:SS')
	AND TO_DATE('2021/09/30 23:59:59', 'YY-MM-DD HH24:MI:SS');
	
--------------------------------------------------------------------------------------------------------*/
