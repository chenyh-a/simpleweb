package simpleweb.vo;

/**
 * User request parameters passed from front end.
 * 
 * @author chenyh
 *
 */
public class ImportRequest extends BaseRequest {
	public String token;// required when import
	public String fullPath;// full path of actual uploaded file
	public VOS cols;// table column name and caption, required when import/export.

	public ImportResponse copy() {
		ImportResponse rsp = new ImportResponse();
		super.baseCopy(rsp);
		return rsp;
	}
}