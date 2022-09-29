package testweb.vo;

/**
 * User request parameters passed from front end.
 * 
 * @author chenyh
 *
 */
public class ExportRequest extends BaseRequest {

	public String filename;// export file name without suffix
	public String currRootDir;// current absolute dir. testweb/
	public boolean autoSizeColumn;//
	public boolean watermark;//
	public VOS cols;// table column name and caption, required when import/export.

	public VO data = new VO();

	public ExportResponse copy() {
		ExportResponse rsp = new ExportResponse();
		super.baseCopy(rsp);
		return rsp;
	}
}