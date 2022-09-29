package testweb.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import testweb.C;
import testweb.U;
import testweb.vo.ProcedureColumn;
import testweb.vo.QueryRequest;
import testweb.vo.QueryResponse;

/**
 * DB utilities<br/>
 * If you query data list, you must define 4 parameters below in your SP:<br/>
 * p_get_offset -- start to query skipped record number<br/>
 * p_get_num -- page size<br/>
 * p_order_column -- order by DB column<br/>
 * p_order_type -- DESC/ASC<br/>
 * p_total_records -- output parameter <br/>
 * 
 * @author chenyh
 *
 */
public class QueryDao extends BaseDao<QueryRequest, QueryResponse> {

	static final String PARAM_GET_OFFSET = "p_get_offset"; // skip record
	static final String PARAM_GET_NUM = "p_get_num";// page size
	static final String PARAM_ORDER_COLUMN = "p_order_column";// order by column
	static final String PARAM_ORDER_DIR = "p_order_dir";// DESC / ASC
	static final String PARAM_TOTAL_RECORDS = "p_total_records";// Should define this output parameter in you list SP
	static final String PARAM_USER_CODE = "p_usercode";// login user code

	private static Logger log = LoggerFactory.getLogger(QueryDao.class);

	@Override
	public QueryResponse execute(QueryRequest req0) {

		QueryRequest req = (QueryRequest) req0;
		QueryResponse rsp = req.copy();

		try {
			if (stmt1 == null || stmt1.isClosed()) {
				init(req0);
			}
			int totalPos = 0;
			for (ProcedureColumn pc : spCols) {
				String spParamName = pc.COLUMN_NAME;// SP parameter name with prefix p_
				Object val = null;
				String dbColName = spParamName.substring(2);// remove prefix p_ as DB column name
				if (spParamName.equals(PARAM_GET_NUM)) {
					val = req.length;
				} else if (spParamName.equals(PARAM_GET_OFFSET)) {
					val = req.start;
				} else if (spParamName.equals(PARAM_ORDER_COLUMN)) {
					val = req.orderColumn;
				} else if (spParamName.equals(PARAM_ORDER_DIR)) {
					val = req.orderDir;
				} else if (spParamName.equals(PARAM_USER_CODE)) {
					val = req.userCode;
				} else {
					val = req.data.get(dbColName);
				}
				if (pc.COLUMN_TYPE == 1 || pc.COLUMN_TYPE == 2) {// 1 In 2 InOut 3 Out 4 Return
					stmt1.setObject(pc.pos, val);
				}
				if (pc.COLUMN_TYPE == 2 || pc.COLUMN_TYPE == 3 || pc.COLUMN_TYPE == 4) {// register out parameter
					stmt1.registerOutParameter(pc.pos, pc.DATA_TYPE);
					if (spParamName.equals(PARAM_TOTAL_RECORDS)) {
						totalPos = pc.pos;
					}
				}
			}
			rs = stmt1.executeQuery();
			if (totalPos > 0) {
				rsp.recordsTotal = stmt1.getInt(totalPos);
			}
			rsp.data = U.getDataFromResultSet(rs);
			rsp.result = C.RESULT_SUCCESS;
		} catch (Exception e) {
			rsp.result = C.RESULT_FAIL;
			rsp.error = e.getMessage();
			log.error(e.getMessage(), e);
		} finally {
			close();
		}
		return rsp;
	}

}