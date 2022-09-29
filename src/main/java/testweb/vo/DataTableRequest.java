package testweb.vo;

import java.util.List;

public class DataTableRequest {
	public int draw;
	public int start;
	public int length;
	public List<VOS> columns;
	public List<VOS> order;

}
