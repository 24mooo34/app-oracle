package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import dto.ScheduleDTO;
import dto.ColorDTO;

public class ScheduleDAO implements DAOinterface{
	//コネクションインスタンス生成
	Connection con;
	//コンストラクタ
	ScheduleDAO(){ }
	ScheduleDAO(Connection con){ this.con = con; }	

@Override
/*--------------------------------------------------------------------------------------------------------
 *①getSkdId()をオーバーライド（Scheduleテーブルから予定idを払いだす）
 --------------------------------------------------------------------------------------------------------*/
		public int getId()  {
			int skd_id = 0;		//戻り値
			con = DBconnection.connection();		//DB接続
			try {
				//SQL（予定IDの最大値を取得）
				String sql1 = "SELECT MAX(skd_id) FROM Schedule";
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql1);	//SQL実行
				while(rs.next()) {
					skd_id = rs.getInt(1);//最大値取得							
				}		
				skd_id += 1;	//最大値に＋１する				
				System.out.println("予定ID："+ skd_id);				
			}catch(SQLException e) {
	            e.printStackTrace();
			}
			if(con == null) {
			
				DBconnection.close(con);	//DB切断				
			}			
			//戻り値として付与するIDを返す
			return skd_id;
		}
		
@Override
/*--------------------------------------------------------------------------------------------------------
 *②insert()をオーバーライド（Scheduleテーブルに予定を登録する）
 --------------------------------------------------------------------------------------------------------*/
		public void insert(ScheduleDTO newSkd){
			con = DBconnection.connection();		//DB接続		
			try {
				String sql = "INSERT INTO Schedule " 
									+ "(Skd_id,Title,StartDay,EndDay,StartTime,EndTime,Person,Place,Memo,Color_cd) " 
									+ "VALUES ('"+newSkd.getSkd_id()+"','"+newSkd.getSkdTitle()+"','"+newSkd.getStrStartDay()+"',"
									+ "'"+newSkd.getStrEndDay()+"','"+newSkd.getStartTime()+"','"+newSkd.getEndTime()+"'," 
									+"'"+newSkd.getPerson()+"','"+newSkd.getPlace()+"','"+newSkd.getMemo()+"','"+newSkd.getColorDto()+"')";				
				/*SQL原本
				INSERT INTO Schedule
				(Skd_id,Title,StartDay,EndDay,StartTime,EndTime,Person,Place,Memo,Color_cd) 
				VALUES ('"+skdId+"','テストタイトル','2021/09/30','2021/09/30','19:00','20:00',
				'テスト人','テスト場所','テストmemo','C004');
				*/				
				//SQL文実行
				Statement stmt = con.createStatement();
				stmt.executeQuery(sql);
				System.out.println("新規追加OK");				
			}catch(SQLException e) {
	            e.printStackTrace();
			}
			DBconnection.close(con);	//DB切断
		}

@Override		
/*--------------------------------------------------------------------------------------------------------
 *③select()をオーバーライド（Scheduleテーブルから予定検索処理）
 ------------------------------------------------------------------------------------------------------- */
		public ArrayList<ScheduleDTO> select(String... args)  {
			//戻り値の準備（ScheduleDTO型の配列で戻ってくる）
			ArrayList<ScheduleDTO> schedule = new ArrayList<ScheduleDTO>();
			con = DBconnection.connection();		//DB接続
	/* ③-1 カレンダーに表示する予定取得 */	
			if(args.length==2) {
				String firstDay = args[0];
				String lastDay = args[1];				
			//DB接続
			//con = DBconnection.connection();			
			try {
				String sql = "SELECT a.skd_id, a.title, a.startday, a.endday, a.starttime, a.endtime, "
								+ "a.person, a.place, a.memo, a.color_cd, b.HTML  " 
								+ "FROM Schedule a JOIN color b ON a.color_cd = b.color_cd " 
								+ "where a.startday " 
								+ "BETWEEN TO_DATE('"+firstDay+"', 'YY-MM-DD HH24:MI:SS')" 
								+ "AND TO_DATE('"+lastDay+"', 'YY-MM-DD HH24:MI:SS')";
				//SQL文実行
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()) {
					int skd_id = rs.getInt("Skd_id");	//カラム名をいれる
					String title = rs.getString("Title");	
					Date startday = rs.getDate("StartDay");
					Date endday = rs.getDate("EndDay");
					String starttime = rs.getString("StartTime");	
					String endtime = rs.getString("EndTime");	
					String person = rs.getString("Person");	
					String place = rs.getString("Place");	
					String memo = rs.getString("Memo");	
					String color_cd = rs.getString("Color_cd");	//外部キー	
					String html = rs.getString("HTML");	
					ColorDTO colorDto =  new ColorDTO(color_cd, html);
					//配列にセット
					schedule.add( new ScheduleDTO(skd_id, title, startday, endday, starttime, endtime, person, place, memo, colorDto) );
					System.out.println("予定id: " + skd_id + " 	、予定タイトル: " + title +  " 、開始日: " + startday + "、HTMLコード: " + html );										
				}				
			}catch(SQLException e) {
	            e.printStackTrace();
			}	
			//DB切断
			DBconnection.close(con);								

	/* ③-2 予定を1件参照 */				
			}else if(args.length==1) {
				String skdId = args[0];
				System.out.println("参照する予定id: " + skdId );
				//DB接続
				con = DBconnection.connection();		
				try {
					String sql = "SELECT a.skd_id, a.title, a.startday, a.endday, a.starttime, a.endtime, " 
									+ "a.person, a.place, a.memo, a.color_cd, b.HTML  "
									+ "FROM Schedule a JOIN color b ON a.color_cd = b.color_cd "
									+ "WHERE SKD_ID = "+skdId+" ";

					//SQL文実行
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					
					System.out.println("sqlOK "+ sql);
					
					while(rs.next()) {
						int skd_Id = rs.getInt("Skd_id");	//カラム名をいれる
						String title = rs.getString("Title");	
						Date startday = rs.getDate("StartDay");
						Date endday = rs.getDate("EndDay");
						String starttime = rs.getString("StartTime");	
						String endtime = rs.getString("EndTime");	
						String person = rs.getString("Person");	
						String place = rs.getString("Place");	
						String memo = rs.getString("Memo");	
						String color_cd = rs.getString("Color_cd");	//外部キー	
						String html = rs.getString("HTML");
						ColorDTO colorDto =  new ColorDTO(color_cd, html );
						//配列にセット
						schedule.add( new ScheduleDTO(skd_Id, title, startday, endday, starttime, endtime, person, place, memo, colorDto) );
						System.out.println("予定id: " + skd_Id + " 	、予定タイトル: " + title +  " 、開始日: " + startday + "、HTMLコード: " + html );										
					}				
				}catch(SQLException e) {
		            e.printStackTrace();
				}	
				//DB切断
				DBconnection.close(con);
			}
			return schedule ;	
		}

@Override	
/*--------------------------------------------------------------------------------------------------------
 *④update()をオーバーライド（Scheduleテーブルから予定を1件更新する）
------------------------------------------------------------------------------------------------------- */
		public void update(ScheduleDTO upSkd) {
			con = DBconnection.connection();		//DB接続
			try {
				String sql = "UPDATE Schedule "
						+ "SET title = '"+upSkd.getSkdTitle()+"' ,startday = '"+upSkd.getStrStartDay()+"', endday = '"+upSkd.getStrEndDay()+"', "
						+ "starttime = '"+upSkd.getStartTime()+"' , endtime = '"+upSkd.getEndTime()+"' ,"
						+ "person = '"+upSkd.getPerson()+"', place = '"+upSkd.getPlace()+"', memo = '"+upSkd.getMemo()+"',  color_cd ='"+upSkd.getColorDto()+"'"
						+ "WHERE skd_id = '"+upSkd.getSkd_id()+"'";		
				/*SQL原本
				 * UPDATE Schedule
					SET title = '背景無し更新' , startday = '2021/10/30', endday = '2021/10/30', 
					starttime = '' , endtime = '' ,person = '', place = '', memo = 'メモ',  color_cd ='C001'
					WHERE skd_id = '100020';
				 * */	
				System.out.println(sql);
				//SQL文実行
				Statement stmt = con.createStatement();
				stmt.executeQuery(sql);
				System.out.println("予定更新OK");				
			}catch(SQLException e) {
	            e.printStackTrace();
			}
			DBconnection.close(con);	//DB切断
		}

@Override
/*--------------------------------------------------------------------------------------------------------
 *⑤delete()をオーバーライド（Scheduleテーブルから予定を1件削除する）
------------------------------------------------------------------------------------------------------- */		
		public void delete(ScheduleDTO delSkd) {
			con = DBconnection.connection();		//DB接続
			try {
				String sql = "DELETE FROM Schedule WHERE SKD_ID =  "+delSkd.getSkd_id()+" ";	
				/*SQL原本
				 * DELETE FROM Schedule WHERE SKD_ID = 100020;
				 * */								
				//SQL文実行
				Statement stmt = con.createStatement();
				stmt.executeQuery(sql);
				System.out.println("予定削除OK");				
			}catch(SQLException e) {
	            e.printStackTrace();
			}
			DBconnection.close(con);	//DB切断
		}


/*--------------------------------------------------------------------------------------------------------
 *★setDTO()をオーバーライド（SQLの結果をDTOにsetする）
------------------------------------------------------------------------------------------------------- */	
		public void setDTO(ResultSet rs) {
			
		}

	
}
