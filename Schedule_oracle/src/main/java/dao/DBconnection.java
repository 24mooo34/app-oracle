/*--------------------------------------------------------------------------------------------------------
 * DBコネクションを提供するクラス
 --------------------------------------------------------------------------------------------------------*/
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {	
	//DB接続用フィールド
	private static String driver = "oracle.jdbc.driver.OracleDriver";
	private static String url = "jdbc:oracle:thin:@test-oracle.ctcb5xn3a4zt.ap-northeast-1.rds.amazonaws.com:1521/ORCL";
	private static String user = "testuser";
	private static String pass = "nattou24";
	//DBコネクション
	private static Connection con = null;
	
	/* * DB接続 * */
	public static Connection connection() {	
		try {
			//JDBCドライバー読み込み
			Class.forName( DBconnection.driver );
			System.out.println("JDBCok");
			//コネクションを取得する（引数：URL,ユーザID,パスワード）
			DBconnection.con = DriverManager.getConnection( DBconnection.url, DBconnection.user, DBconnection.pass );	
    				
			System.out.println("接続ok");
    
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
		
	/* * DB切断 * */
	public static void close(Connection con) {
		//データベースが接続されている場合
		try {
			if (con != null) {
				//接続を切断
				con.close();
			}
			System.out.println("切断ok");
					
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}	
	
}
