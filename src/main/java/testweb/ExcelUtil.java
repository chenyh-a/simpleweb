package testweb;

import java.awt.Font;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import testweb.WatermarkImage.Watermark;
import testweb.vo.ExportRequest;
import testweb.vo.ExportResponse;

public class ExcelUtil {

	private static Logger log = LoggerFactory.getLogger(ExcelUtil.class);

	public static void export(ResultSet rs, ExportRequest req, ExportResponse rsp) throws Exception {

		int n = 0;
		Date date = new Date();
		String today = new SimpleDateFormat("yyyyMMdd").format(date);
		String sdir = "export/" + today;
		File fulldir = new File(req.currRootDir + sdir);
		if (!fulldir.exists()) {
			fulldir.mkdirs();
		}
		String fname = req.filename;
		if (fname == null || "".equals(fname)) {
			fname = "export";
		} else {
			fname = fname.trim().replaceAll(" ", "");
			fname = fname.replaceAll("/", "");
		}
		fname += "-" + req.userCode + "-" + new SimpleDateFormat("yyyyMMdd-HHmmss-S").format(date) + ".xlsx";

		if (rs != null) {
			File file = new File(fulldir, fname);
			XSSFWorkbook wb = new XSSFWorkbook();
			XSSFSheet sheet1 = wb.createSheet("My Sheet 1");
			XSSFRow row0 = sheet1.createRow(n);

			XSSFFont font0 = wb.createFont();
			font0.setFontName("Arial");
			font0.setFontHeightInPoints((short) 11);// 设置字体大小

			XSSFCellStyle style0 = wb.createCellStyle();
			style0.setFont(font0);// 选择需要用到的字体格式
			style0.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex()); // 设置背景色
			style0.setFillPattern(FillPatternType.SOLID_FOREGROUND);

			XSSFFont font1 = wb.createFont();
			font1.setFontName("Arial");
			font1.setFontHeightInPoints((short) 10);// 设置字体大小
			XSSFCellStyle style1 = wb.createCellStyle();
			style1.setFont(font1);// 选择需要用到的字体格式

			int i = 0;
			for (String key : req.cols.keySet()) {
				XSSFCell cell = row0.createCell(i);
				cell.setCellValue(req.cols.get(key).toString());
				cell.setCellStyle(style0);
				i++;
			}

			while (rs.next()) {
				XSSFRow row = sheet1.createRow(sheet1.getLastRowNum() + 1);
				i = 0;
				for (String key : req.cols.keySet()) {
					Object val = rs.getObject(key);
					XSSFCell cell = row.createCell(i);
					if (val instanceof Integer) {
						cell.setCellValue(Integer.valueOf(val.toString()));
					} else if (val instanceof String) {
						cell.setCellValue(String.valueOf(val.toString()));
					}
					cell.setCellStyle(style1);
					i++;
				}
				// write row to excel file.
				n++;
			}
			if (req.autoSizeColumn) {
				for (int j = 0; j < req.cols.size(); j++) {
					sheet1.autoSizeColumn(j);
				}
			}
			if (req.watermark) {
				Watermark w = new Watermark();
				w.text = req.userCode;// Watermark text
				w.writeDate = true;
				w.dateFormat = "yyyy-MM-dd HH:mm";
				w.color = "#d3d7d4";
				w.font = new Font("Arial", Font.PLAIN | Font.BOLD, 30);

				w.width = 400;
				w.height = 200;
				WatermarkImage.write(wb, w);
			}
			try (OutputStream fileOut = new FileOutputStream(file)) {
				wb.write(fileOut);
			}
			wb.close();

			rsp.fileUrl = sdir + "/" + fname;
			log.debug("Exported file path:" + file.getAbsolutePath());
		}
		rsp.totalNum = n;
		rsp.successNum = n;
		rsp.result = C.RESULT_SUCCESS;

	}

}
