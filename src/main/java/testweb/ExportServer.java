package testweb;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;

import testweb.dao.DaoFactory;
import testweb.dao.ExportDao;
import testweb.vo.ExportRequest;
import testweb.vo.ExportResponse;

/**
 * 
 * @author Administrator
 *
 */
@WebServlet("/exportserver")
public class ExportServer extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static Logger log = LoggerFactory.getLogger(ExportServer.class);

	public ExportServer() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long t0 = System.currentTimeMillis();
		String reqStr = U.getFromInputStream(request.getInputStream());
		response.setHeader("Content-Type", "application/json; charset=UTF-8");
		String token = request.getHeader("token");
		log.debug("token=" + token);
		PrintWriter pw = response.getWriter();
		// pw.append("Client at:" + request.getRemoteAddr());
		log.debug("Received Client: " + reqStr);
		ExportRequest req = JSON.parseObject(reqStr, ExportRequest.class);// fastjson
		ExportResponse rsp = req.copy();
		// U.checkRequestHeader(request, rsp);
		// if (C.RESULT_SUCCESS.equals(rsp.result)) {
		req.currRootDir = this.getServletContext().getRealPath("/");
		// ExportDao dao = new ExportDao();
		ExportDao dao = DaoFactory.getDao(ExportDao.class);
		rsp = dao.execute(req);
		// }
		long t1 = System.currentTimeMillis();
		rsp.consumed = t1 - t0;
		String str = JSONObject.toJSONString(rsp);// fastjson
		log.debug(str);
		pw.append(str);
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
