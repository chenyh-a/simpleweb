package simpleweb.vo;

/**
 * server side response that will be return to front end.
 * 
 * @author chenyh
 *
 */
public class ExportResponse extends BaseResponse {

	public String fileUrl;// actual export file name for download, also the import error file.
	public int totalNum; // return when import
	public int successNum;// return when import
}