package simpleweb;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;

import simpleweb.dao.QueryDao;
import simpleweb.vo.QueryRequest;
import simpleweb.vo.QueryResponse;

/**
 * 
 * @author Administrator
 *
 */
@WebServlet("/queryserver")
public class QueryServer extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static Logger log = LoggerFactory.getLogger(QueryServer.class);

	public QueryServer() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setHeader("Content-Type", "application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		QueryRequest req = new QueryRequest();
		String sdraw = request.getParameter("draw");
		String sstart = request.getParameter("start");
		String slength = request.getParameter("length");

		boolean isGet = (sdraw != null);

		QueryResponse rsp = new QueryResponse();
		if (isGet) {// get
			req.method = request.getParameter("method");
			req.tag = request.getParameter("tag");
			req.userCode = request.getParameter("userCode");
			req.draw = Integer.valueOf(sdraw);
			req.start = Integer.valueOf(sstart);
			req.length = Integer.valueOf(slength);
			String iorder = request.getParameter("order[0][column]");
			String search = request.getParameter("search[value]");
			if (iorder != null) {
				req.orderColumn = request.getParameter("columns[" + iorder + "][data]");
				req.orderDir = request.getParameter("order[0][dir]");
			}
			req.data.put("search", search);
			Map<String, String[]> map = request.getParameterMap();
			for (String key : map.keySet()) {
				String[] val = map.get(key);
				// log.debug("---key=" + key + ", value=" + val[0]);
				if (key.startsWith("data[")) {
					int len = key.length();
					String key0 = key.substring(5, len - 1);
					req.data.put(key0, val[0]);
				}
			}
		} else {// post
			Enumeration<String> keys = request.getParameterNames();
			if (!keys.hasMoreElements()) {
				String s = "Error: missing post data";
				log.error(s);
				rsp.result = C.RESULT_FAIL;
				rsp.message = s;
			} else {
				String key = keys.nextElement();
				req = JSON.parseObject(key, QueryRequest.class);// fastjson
				String token = request.getHeader("token");
				log.debug("token={}", token);
			}
		}
		if (!C.RESULT_FAIL.equals(rsp.result)) {
			rsp = req.copy();
			// U.checkRequestHeader(request, rsp);
			// if (C.RESULT_SUCCESS.equals(rsp.result)) {
			QueryDao dao = new QueryDao();
			// QueryDao dao = DaoFactory.getDao(QueryDao.class);
			rsp = dao.execute(req);
			rsp.recordsFiltered = rsp.recordsTotal;
			// }
		}
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
