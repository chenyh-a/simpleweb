package testweb;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;

import testweb.dao.DaoFactory;
import testweb.dao.ImportDao;
import testweb.vo.ImportRequest;
import testweb.vo.ImportResponse;
import testweb.vo.VOS;
import testweb.vo.VO;

/**
 * Upload and import excel file to database
 */
@WebServlet("/importserver")
public class ImportServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private File uploadPath;
	private File tempPath;
	private static final int DEFUALT_SIZE_THRESHOLD = 8192;
	private static Logger log = LoggerFactory.getLogger(ImportServer.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImportServer() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// UploadResponse urp = new UploadResponse();
		long t0 = System.currentTimeMillis();
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Content-Type", "application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(DEFUALT_SIZE_THRESHOLD); // large file will saved in a temp dir firstly.
		factory.setRepository(tempPath);
		ServletFileUpload upload = new ServletFileUpload(factory);
		// upload.setSizeMax(1000000 * 20);// set max upload file size.
		if (uploadPath == null) {
			initDir();
		}

		VO vo = new VO();
		try {
			List<FileItem> fileItems = upload.parseRequest(request);
			String s_today = new SimpleDateFormat("yyyyMMdd").format(new Date());
			File dir_today = new File(uploadPath, s_today);
			if (!dir_today.exists()) {
				dir_today.mkdirs();
			}
			for (FileItem item : fileItems) {
				if (item.isFormField()) {
					String key = item.getFieldName();
					String val = U.getFromInputStream(item.getInputStream());
					String s = String.format("Form field name=%s, value=%s", key, val);
					if ("cols".equals(key)) {
						VOS svo = JSON.parseObject(val, VOS.class);
						vo.put(key, svo);
					} else {
						vo.put(key, val);
					}
					log.debug(s);
				} else {// upload file
					String fileName = item.getName();

					String s = String.format("Source file name: %s; file size: %,d", fileName, item.getSize());
					log.debug(s);
					String newName = getTempFileName(fileName);
					File target = new File(dir_today, newName);
					item.write(target);// write upload file

					s = "Upload file saved in server dir: " + target.getCanonicalPath();

					log.debug(s);

					String reqStr = JSONObject.toJSONString(vo);
					ImportRequest req = JSON.parseObject(reqStr, ImportRequest.class);// fastjson

//					U.checkRequestHeader(request, rsp);

					req.fullPath = target.getCanonicalPath();
					// ImportDao dao = new ImportDao();
					ImportDao dao = DaoFactory.getDao(ImportDao.class);
					ImportResponse rsp = dao.execute(req);

					rsp.sourceFile = fileName;
					int i = req.fullPath.indexOf("upload");
					rsp.fileUrl = req.fullPath.substring(i);

					long t1 = System.currentTimeMillis();
					log.debug("Import token={}, total={} rows in milliseconds:{}", req.token, rsp.totalNum, (t1 - t0));
					rsp.consumed = t1 - t0;
					String str = JSONObject.toJSONString(rsp);// fastjson
					pw.append(str);

				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	private String getTempFileName(String filename) {
		Random random = new Random();
		int rannum = (int) (random.nextDouble() * (99999999 - 10000000 + 1)) + 10000000;// 生成一个8位
		int i = filename.lastIndexOf('.');
		String ext = "";
		String fname = filename;
		if (i > 0) {
			fname = filename.substring(0, i);
			ext = filename.substring(i);
		}
		return fname + "-" + rannum + ext;
	}

	private void initDir() {
		uploadPath = new File(getServletContext().getRealPath("/") + "upload");
		if (!uploadPath.exists()) {
			uploadPath.mkdir();
		}
		tempPath = new File(uploadPath, "temp");
		if (!tempPath.exists()) {
			tempPath.mkdir();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}