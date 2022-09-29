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

import com.alibaba.fastjson2.JSONObject;

import testweb.vo.UploadResponse;

/**
 * Servlet implementation class FileServer
 */
@WebServlet("/uploadserver")
public class UploadServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private File uploadPath;
	private File tempPath;
	private static final int DEFUALT_SIZE_THRESHOLD = 8192;
	private static Logger log = LoggerFactory.getLogger(UploadServer.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadServer() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UploadResponse urp = new UploadResponse();
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Content-Type", "text/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		// pw.append("Served at: ").append(request.getContextPath());

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(DEFUALT_SIZE_THRESHOLD); // large file will saved in a temp dir firstly.
		factory.setRepository(tempPath);
		ServletFileUpload upload = new ServletFileUpload(factory);
		// upload.setSizeMax(1000000 * 20);// set max upload file size.
		try {
			List<FileItem> fileItems = upload.parseRequest(request);
			String s_today = new SimpleDateFormat("yyyyMMdd").format(new Date());
			File dir_today = new File(uploadPath, s_today);
			if (!dir_today.exists()) {
				dir_today.mkdirs();
			}
			for (FileItem item : fileItems) {
				if (item.isFormField()) {
					String s = String.format("\nForm field name=%s, value=%s", item.getFieldName(),
							U.getFromInputStream(item.getInputStream()));
					log.debug(s);
				} else {// upload file
					String fileName = item.getName();

					String s = String.format("\nSource file name: %s; file size: %,d", fileName, item.getSize());
					log.debug(s);
					// pw.append(s);
					urp.fileSize = item.getSize();

					String newName = getTempFileName(fileName);
					File target = new File(dir_today, newName);
					item.write(target);// write upload file

					s = "\nUpload file saved in server dir: " + target.getCanonicalPath();
					log.debug(s);
					// pw.append(s);
					urp.serverPath = target.getCanonicalPath();
					urp.result = "SUCCESS";
					String str = JSONObject.toJSONString(urp);// fastjson
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

	public void init() {
		uploadPath = new File("upload");
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