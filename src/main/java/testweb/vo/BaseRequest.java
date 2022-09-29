package testweb.vo;

import java.util.List;

/**
 * User request parameters passed from front end.
 * 
 * @author chenyh
 *
 */
public abstract class BaseRequest {

	public String method;// DB stored procedure(SP),, required for all.
	public String userCode;//
	public String roleCode;//
	public String tag;// extra info

	/**
	 * parameter passed from UI page, if it is a query,pass only one set parameter
	 * as query condition, if update, user can pass more than one set of data.
	 */
	public List<VO> data;

	public abstract BaseResponse copy();

	public void baseCopy(BaseResponse rsp) {
		rsp.method = this.method;
		rsp.tag = this.tag;
	}
}