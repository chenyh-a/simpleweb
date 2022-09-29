package simpleweb.vo;

/**
 * Stored procedure column
 * 
 * @author chenyh
 *
 */
public class ProcedureColumn {
	public String PROCEDURE_CAT;
	public String PROCEDURE_SCHEM;
	public String PROCEDURE_NAME;
	public String COLUMN_NAME; // SP parameter name should start with prefix p_
	public short COLUMN_TYPE; // 0~5
	/**
	 * procedureColumnUnknown - <br/>
	 * procedureColumnIn - IN <br/>
	 * procedureColumnInOut - INOUT <br/>
	 * procedureColumnOut - OUT <br/>
	 * procedureColumnReturn - Return <br/>
	 * procedureColumnResult - ResultSet
	 */

	public int DATA_TYPE;// java.sql.Types
	public String TYPE_NAME;
	public int PRECISION;
	public int LENGTH;
	public short SCALE;
	public short RADIX;
	public short NULLABLE;// 0~2
	/**
	 * procedureNoNulls <br/>
	 * procedureNullable <br/>
	 * procedureNullableUnknown
	 */

	public String REMARKS;//
	public int pos;// SP parameter position
	public String excelHeader;// use it when import
	public int excelIndex;// use it when import
}