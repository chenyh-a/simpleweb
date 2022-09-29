package testweb.dao;

import java.sql.Types;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import testweb.C;
import testweb.vo.ProcedureColumn;
import testweb.vo.UpdateRequest;
import testweb.vo.UpdateResponse;
import testweb.vo.VO;

/**
 * DB utilities
 * 
 * @author chenyh
 *
 */
public class UpdateDao extends BaseDao<UpdateRequest, UpdateResponse> {

	private static Logger log = LoggerFactory.getLogger(QueryDao.class);

	@Override
	public UpdateResponse execute(UpdateRequest req0) {

		UpdateRequest req = (UpdateRequest) req0;
		UpdateResponse rsp = req.copy();
		if (req.data == null || req.data.size() == 0) {
			String s = "Error: missing update contents,req.data=" + req.data;
			log.error(s);
			rsp.result = "FAILED";
			rsp.message = s;
			return rsp;
		}
		try {
			if (stmt1 == null || stmt1.isClosed()) {
				init(req0);
			}
			for (VO vo : req.data) {
				for (ProcedureColumn pc : spCols) {
					String spParamName = pc.COLUMN_NAME;// SP parameter name, should start with prefix p_
					Object val = null;
					String dbColName = spParamName.substring(2);// remove prefix p_ as a DB column name
					val = vo.get(dbColName);
					int type = pc.DATA_TYPE;
					if (spParamName.equals("p_usercode")) {
						stmt1.setObject(pc.pos, req.userCode);
					} else if (pc.COLUMN_TYPE == 1 || pc.COLUMN_TYPE == 2) {// 1 In 2 InOut 3 Out 4 Return
						if (isNumeric(type) && "".equals(val)) {
							val = 0;
						}
						stmt1.setObject(pc.pos, val);
					}
					if (pc.COLUMN_TYPE == 2 || pc.COLUMN_TYPE == 3 || pc.COLUMN_TYPE == 4) {// register out parameter
						stmt1.registerOutParameter(pc.pos, pc.DATA_TYPE);
					}
				}

				try {
					rsp.affected += stmt1.executeUpdate();
					rsp.result = C.RESULT_SUCCESS;
				} catch (Exception e) {
					rsp.result = C.RESULT_FAIL;
					rsp.message = e.getMessage();
					log.error("Error occured. request row data: " + vo, e);
					throw e;
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		} finally {
			close();
		}
		return rsp;
	}

	boolean isNumeric(int type) {
		return type == Types.INTEGER || type == Types.BIGINT || type == Types.DECIMAL || type == Types.DOUBLE
				|| type == Types.FLOAT || type == Types.NUMERIC || type == Types.REAL;
	}
}