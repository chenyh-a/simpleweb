package simpleweb.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import simpleweb.C;
import simpleweb.ExcelUtil;
import simpleweb.vo.ExportRequest;
import simpleweb.vo.ExportResponse;
import simpleweb.vo.ProcedureColumn;

/**
 * DB utilities
 * 
 * @author chenyh
 *
 */
public class ExportDao extends BaseDao<ExportRequest, ExportResponse> {

	private static Logger log = LoggerFactory.getLogger(ExportDao.class);

	@Override
	public ExportResponse execute(ExportRequest req0) {

		ExportRequest req = (ExportRequest) req0;
		ExportResponse rsp = req.copy();
		try {

			if (stmt1 == null || stmt1.isClosed()) {
				init(req0.method);
			}
			for (ProcedureColumn pc : spCols) {
				String spParamName = pc.COLUMN_NAME;// SP parameter name with prefix p_

				String dbColName = spParamName.substring(2);// remove prefix p_ as DB column name

				Object val = req.data.get(dbColName);

				if (pc.COLUMN_TYPE == 1 || pc.COLUMN_TYPE == 2) {// 1 In 2 InOut 3 Out 4 Return
					stmt1.setObject(pc.pos, val);
				}
			}
			rs = stmt1.executeQuery();
			ExcelUtil.export(rs, req, rsp);

		} catch (Exception e) {
			rsp.result = C.RESULT_FAIL;
			rsp.message = e.getMessage();
			log.error(e.getMessage(), e);
		} finally {
			close();
		}
		return rsp;
	}
}