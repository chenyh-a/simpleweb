package testweb.vo;

import java.util.List;

/**
 * User request parameters passed from front end.
 * 
 * @author chenyh
 *
 */
public class UpdateRequest extends BaseRequest {

	/**
	 * parameter passed from UI page, if it is a query,pass only one set parameter
	 * as query condition, if update, user can pass more than one set of data.
	 */
	public List<VO> data;

	public UpdateResponse copy() {
		UpdateResponse rsp = new UpdateResponse();
		super.baseCopy(rsp);
		return rsp;
	}
}