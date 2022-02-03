/*--------------------------------------------------------------------------------------------------------
 * DAOを生成するクラス
 --------------------------------------------------------------------------------------------------------*/
package dao;

import java.sql.Connection;

public class DAOfactory {
	
	//HolidayDAO生成
	public static HolidayDAO createHolidayDAO() {
        return new HolidayDAO();
    }
	 //HolidayDAO生成（con有り）
	public static HolidayDAO createHolidayDAO(Connection con) {
		return new HolidayDAO(con);
	}
	
/*--------------------------------------------------------------------------------*/	
	
	//ScheduleDAO生成
    public static ScheduleDAO createScheduleDAO() {
        return new ScheduleDAO();
    }
    //ScheduleDAO生成（con有り）
    public static ScheduleDAO createScheduleDAO(Connection con) {
        return new ScheduleDAO(con);
    }

}
