/*--------------------------------------------------------------------------------------------------------
 * DAOのインタフェースを提供する
 --------------------------------------------------------------------------------------------------------*/
package dao;

import java.util.List;

import dto.ScheduleDTO;

public interface DAOinterface { 
	//共通項を定義する。
	List select(String... args);	//検索
	int getId();	//予定idの払い出し
	/*
	 * *****引数をDTOinterfaceにする*****
	 */
	void insert(ScheduleDTO  dto);	//追加
	void update(ScheduleDTO  dto);	//更新
	void delete(ScheduleDTO  dto);	//削除
	

}

