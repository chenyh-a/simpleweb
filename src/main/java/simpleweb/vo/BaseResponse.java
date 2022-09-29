package simpleweb.vo;

/**
 * server side response that will be return to front end.
 * 
 * @author chenyh
 *
 */
public class BaseResponse {
	public String method; // name of stored procedure, required, passed from front end
	public String tag;// extra info passed from front end
	public String result;// business result code SUCCESS/FAIL
	public String message;
	public long consumed;// consumed milliseconds

}