package testweb.vo;

import java.util.List;

/**
 * server side response that will be return to front end.
 * 
 * @author chenyh
 *
 */
public class QueryResponse extends BaseResponse {

	public int draw;// jquery datatable passed
	public int start; // jquery datatable passed
	public int length; // jquery datatable passed
	public int recordsTotal; // return to jquery datatable
	public int recordsFiltered;// return to jquery datatable
	public String error;
	public List<VO> data;// return actual query data
}