package simpleweb;

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

import simpleweb.dao.DaoFactory;
import simpleweb.dao.UpdateDao;
import simpleweb.vo.UpdateRequest;
import simpleweb.vo.UpdateResponse;

/**
 * 
 * @author Administrator
 *
 */
@WebServlet("/updateserver")
public class UpdateServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log = LoggerFactory.getLogger(UpdateServer.class);

	public UpdateServer() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String reqStr = U.getFromInputStream(request.getInputStream());

		// String[] columns = map.get("columns");

		response.setHeader("Content-Type", "application/json; charset=UTF-8");
		String token = request.getHeader("token");
		log.debug("token=" + token);
		PrintWriter pw = response.getWriter();

		UpdateRequest req = JSON.parseObject(reqStr, UpdateRequest.class);// fastjson

		// U.checkRequestHeader(request, rsp);
		// if (C.RESULT_SUCCESS.equals(rsp.result)) {
		// UpdateDao dao = new UpdateDao();
		UpdateDao dao = DaoFactory.getDao(UpdateDao.class);
		UpdateResponse rsp = dao.execute(req);

		// }
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
