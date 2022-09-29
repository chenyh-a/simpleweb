package simpleweb.vo;

/**
 * server side response that will be return to front end.
 * 
 * @author chenyh
 *
 */
public class UpdateResponse extends BaseResponse {

	public int affected; // return affected rows count when update/insert/delete

}