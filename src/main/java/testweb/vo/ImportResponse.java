package testweb.vo;

/**
 * server side response that will be return to front end.
 * 
 * @author chenyh
 *
 */
public class ImportResponse extends BaseResponse {

	public String fileUrl;// import error file.
	public String sourceFile;// return when import
	public int totalNum; // return when import
	public int successNum;// return when import
	public int errorNum;// return when import
}