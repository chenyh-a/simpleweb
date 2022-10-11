package simpleweb.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import simpleweb.C;
import simpleweb.U;
import simpleweb.vo.ImportRequest;
import simpleweb.vo.ImportResponse;
import simpleweb.vo.ProcedureColumn;
import simpleweb.vo.VO;
import simpleweb.vo.VOS;

/**
 * DB utilities
 * 
 * @author chenyh
 *
 */
public class ImportDao extends BaseDao<ImportRequest, ImportResponse> {

	private static Logger log = LoggerFactory.getLogger(ImportDao.class);
	private static final String PARAM_ROWNUM = "p_rownum";

	/**
	 * Import a excel file, the first row of the excel file is column header.<br/>
	 * In Database, you should create 1 table and 2 store procedures<br/>
	 * xxxx_import (table) include 3 new column: token, rownum, error_message
	 * besides needed table column<br/>
	 * sp_imp_xxxx (SP) insert one row<br/>
	 * sp_imp_xxxx_verify(SP) verify data in xxxx_import and save error info in
	 * error_message column<br/>
	 * 
	 * @param req ImportRequest
	 * @return ImportResponse
	 */
	@Override
	public ImportResponse execute(ImportRequest req0) {

		ImportRequest req = (ImportRequest) req0;
		ImportResponse rsp = req.copy();
		try {
			if (stmt1 == null || stmt1.isClosed()) {
				init(req0.method);
			}
			Workbook wb = new XSSFWorkbook(new File(req.fullPath));
			Sheet sheet1 = wb.getSheetAt(0);
			Row row = sheet1.getRow(0);

			initExcelIndex(req.cols, row);
			for (ProcedureColumn pc : spCols) {
				String dbColName = pc.COLUMN_NAME.substring(2);
				if (!req.cols.containsKey(dbColName) && (!"token".equals(dbColName)) && (!"rownum".equals(dbColName))) {
					String ss = "Error: SP parameter not defined in front end,SP=" + req.method + ",dbColName= "
							+ pc.COLUMN_NAME;
					log.error(ss);
					throw new Exception(ss);
				}
			}
			int n = 0;
			conn.setAutoCommit(false);// Important!
			for (int i = 1; i <= sheet1.getLastRowNum() + 1; i++) {
				row = sheet1.getRow(i);
				if (row == null) {
					continue;
				}

				for (ProcedureColumn pc : spCols) {
					Object val = null;

					Cell cell = row.getCell(pc.excelIndex);
					CellType tp = cell.getCellType();
					String key = pc.COLUMN_NAME;
					if (key.equals(PARAM_TOKEN)) {
						val = req.token;
					} else if (key.equals(PARAM_ROWNUM)) {
						val = i;
					} else if (tp == CellType.NUMERIC) {
						val = cell.getNumericCellValue();
					} else if (tp == CellType.STRING) {
						val = cell.getStringCellValue().trim();
					}
					stmt1.setObject(pc.pos, val);
				}
				stmt1.addBatch();
				n++;
				if (i % 500 == 0) {
					stmt1.executeBatch();
					stmt1.clearBatch();
					conn.commit();
					n = 0;
				}
			}
			if (n > 0) {
				stmt1.executeBatch();
				conn.commit();
			}
			wb.close();
			conn.setAutoCommit(true);
			executeImportVerify(req, rsp);
		} catch (Exception e) {
			rsp.result = C.RESULT_FAIL;
			rsp.message = e.getMessage();
			log.error(e.getMessage(), e);
		}
		return rsp;
	}

	private void initExcelIndex(VOS cols, Row row) throws Exception {

		for (ProcedureColumn pc : spCols) {
			String key = pc.COLUMN_NAME;
			if (PARAM_TOKEN.equals(key) || PARAM_ROWNUM.equals(key)) {
				continue;
			}
			key = key.substring(2);
			pc.excelHeader = cols.get(key);
			boolean found = false;
			for (int i = 0; i < row.getLastCellNum(); i++) {
				String headerValue = row.getCell(i).getStringCellValue();
				if (cols.get(key).equals(headerValue)) {
					pc.excelIndex = i;
					found = true;
					break;
				}
			}
			if (!found) {
				throw new Exception("Error: Not found excel header:key=" + key + ",header=" + cols.get(key));
			}
		}

	}

	private void executeImportVerify(ImportRequest req, ImportResponse rsp) throws Exception {

		try {
			String spName = req.method + "_verify";
			if (stmt2 == null || stmt2.isClosed()) {
				stmt2 = conn.prepareCall("{call " + spName + "(?,?)}");// fixed SP name with suffix _verify
			}

			stmt2.setObject(1, req.token);// fixed parameter
			stmt2.setObject(2, req.userCode);// fixed parameter
			stmt2.executeUpdate();

			rs = stmt2.getResultSet();
			List<VO> list = U.getDataFromResultSet(rs);

			FileInputStream fis = new FileInputStream(req.fullPath);
			XSSFWorkbook wb = new XSSFWorkbook(fis);
			XSSFSheet sheet1 = wb.getSheetAt(0);
			XSSFRow row0 = sheet1.getRow(0);
			int n = sheet1.getLastRowNum();
			rsp.totalNum = n;
			rsp.successNum = n;

			CellStyle style = wb.createCellStyle();
			Font font1 = wb.createFont();
			font1.setFontName("Arial");
			font1.setFontHeightInPoints((short) 11);// 设置字体大小
			style.setFont(font1);// 选择需要用到的字体格式
			style.setFillForegroundColor(IndexedColors.RED1.getIndex()); // 设置背景色
			style.setFillPattern(FillPatternType.SOLID_FOREGROUND);

			if (rs != null && list.size() > 0) {
				int ncol = row0.getLastCellNum();
				for (VO vo : list) {
					int rownum = Integer.valueOf(vo.get("rownum").toString());
					Row row = sheet1.getRow(rownum);
					Cell cell = row.createCell(ncol);
					cell.setCellValue(vo.get("error_message").toString());
					for (int i = 0; i < ncol + 1; i++) {// need set every cell instead of setRowStyle
						row.getCell(i).setCellStyle(style);
					}
				}

				rsp.errorNum = list.size();
				rsp.successNum = rsp.totalNum - rsp.errorNum;
			}
			rsp.message = "Total=" + rsp.totalNum + ", success=" + rsp.successNum + ", error=" + rsp.errorNum;
			File file = new File(req.fullPath);
			try (OutputStream fileOut = new FileOutputStream(file)) {
				wb.write(fileOut);
				;
			}
			fis.close();
			wb.close();

		} catch (Exception e) {
			rsp.result = C.RESULT_FAIL;
			rsp.message = e.getMessage();
			log.error(e.getMessage(), e);
			throw e;
		} finally {
			close();
		}

	}
}