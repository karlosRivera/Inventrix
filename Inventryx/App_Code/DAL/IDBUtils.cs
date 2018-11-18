
using System.Data;
using System.Data.SqlClient;
using System;
using System.Collections;

namespace Components
{
	interface IDBUtils
	{
        #region Notes
        //THIS INTERFACE WILL MAINTAIN DAL RELATED CONSISTENCY
        //BASICALLY HERE WE ARE DEFINING RULES FOR OUR DAL
        #endregion Notes

		string GetConnectionString();
		string GetConnectionString(string configStr);
		object GetNull(object Field);
		Hashtable GetTableColumnDetail(SqlDataReader reader);
		object GetSingleValue(string vSql, string SPName);
		object GetSingleValue(string vSql);
		DataSet ExecuteSqlDataSet(string vSql, string SPName);
		DataSet ExecuteSqlDataSet(string vSql);
		SqlDataReader ExecuteSqlReader(string vSql, string SPName);
		SqlDataReader ExecuteSqlReader(string vSql);
		DataSet ExecutePagingSql(string sConStr, string spName, object[] objArr);
		ArrayList GetSPParams(string SpName);
		int HandleData(ArrayList objArr, string SpName);
		int HandleData(string Sql);
        string HandleDataWithReturnParams(ArrayList objArr, string SpName);
        SqlDataReader HandleDataWithDataReader(ArrayList objArr, string SpName);
		DataTable FillDatatableForCrpt(string vSql, DataTable tmpTbl);
    }
}
