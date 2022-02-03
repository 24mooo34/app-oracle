/*--------------------------------------------------------------------------------------------------------
 * DTOのインタフェースを提供する
 --------------------------------------------------------------------------------------------------------*/
package dao;

import java.sql.ResultSet;
import java.util.List;

public interface DTOinterface {
	List setDTO(ResultSet rs);	//各DTOにsetする
}
