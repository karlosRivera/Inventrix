using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;

namespace Components.DAL
{
	
	public abstract class BaseDBUtils : IDBUtils
	{
        #region Notes
        //THIS ABSTRACT CLASS WILL EXTEND INTERFACE AND DEFINE ABSTRACT FUNCTION.
        //BASICALLY THIS ABSTRACT CLASS BEHAVE LIKE A ADAPTER CLASS.
        //IT WILL ALSO MAINTAIN DAL RELATED CONSISTENCY
        #endregion Notes

		public abstract System.Data.SqlClient.SqlDataReader ExecuteSqlReader(string vSql);
		public abstract System.Data.SqlClient.SqlDataReader ExecuteSqlReader(string vSql, string SPName);
		public abstract object GetNull(object Field);
		public abstract System.Collections.ArrayList GetSPParams(string SpName);
		public abstract System.Collections.Hashtable GetTableColumnDetail(System.Data.SqlClient.SqlDataReader reader);
		public abstract int HandleData(string Sql);
		public abstract int HandleData(System.Collections.ArrayList objArr, string SpName);
        public abstract string HandleDataWithReturnParams(ArrayList objArr, string SpName);
        public abstract SqlDataReader HandleDataWithDataReader(ArrayList objArr, string SpName);
		public abstract string GetConnectionString();
		public abstract string GetConnectionString(string configStr);
		public abstract object GetSingleValue(string vSql, string SPName);
		public abstract object GetSingleValue(string vSql);
		public abstract System.Data.DataSet ExecutePagingSql(string sConStr, string spName, object[] objArr);
		public abstract System.Data.DataSet ExecuteSqlDataSet(string vSql);
		public abstract System.Data.DataSet ExecuteSqlDataSet(string vSql, string SPName);
		public abstract DataTable FillDatatableForCrpt(string vSql, DataTable tmpTbl);
	}




	public class DBUtils : BaseDBUtils
	{
		static DBUtils _instance = new DBUtils();

		public static DBUtils GetInstance
		{
			get
			{
				return _instance;
			}
        }

        #region GetConnectionString
        public override string GetConnectionString()
		{
            #region Notes
            //THIS FUNCTION WILL RETURN FIXED CONNECTION STRING RELATED INFO.
            #endregion Notes
            return ConfigurationManager.AppSettings["ConnectionString"];
        }
        #endregion

        #region GetConnectionString
        public override string GetConnectionString(string configStr)
		{
            #region Notes
            //THIS FUNCTION WILL RETURN CONNECTION STRING RELATED INFO BASED ON USER SUPPLIED CONNECTION_STRING KEY.
            #endregion Notes
            return ConfigurationManager.AppSettings[configStr];
        }
        #endregion

        #region GetNull
        public override object GetNull(object Field)
		{
            #region Notes
            //THIS FUNCTION WILL RETURN ONLY NULL VALUE
            #endregion Notes

			return DBNull.Value;
        }
        #endregion

        #region GetTableColumnDetail
        public override Hashtable GetTableColumnDetail(SqlDataReader reader)
		{
            #region Notes
            //THIS FUNCTION WILL POPULATE TABLE SCHEMA RELATED INFO INTO HASTABLE AND RETURN HASTABLE
            #endregion Notes

			Hashtable objHtbl = new Hashtable();
			DataTable schemaTable = reader.GetSchemaTable();
			int intCounter=0;
			objHtbl.Clear();
			for (intCounter = 0; intCounter <= schemaTable.Rows.Count - 1; intCounter++) 
			{
				DataRow dataRow = schemaTable.Rows[intCounter];
				objHtbl.Add(((string)(dataRow["ColumnName"])), ((Type)(dataRow["DataType"])));
			}
			return objHtbl;
        }
        #endregion

        #region GetSingleValue
        public override object GetSingleValue(string vSql, string SPName)
		{
            #region Notes
            //THIS FUNCTION WILL CAPTURE A SINGLE VALUE PASSED BY STORE PROCEDURE
            #endregion Notes

			object i;
			SqlParameter[] arParms = new SqlParameter[0];
			try 
			{
                if (vSql.Trim() != "")
                {
                    arParms[0] = new SqlParameter("@sSql", SqlDbType.NText);
                    arParms[0].Value = vSql;
                    i = SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, SPName, arParms);
                }
                else
                {
                    i = SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, SPName);
                }
			} 
			catch (Exception ex) 
			{
				throw ex;
			}
			return i;
        }
        #endregion

        #region GetSingleValue
        public override object GetSingleValue(string vSql)
		{
            #region Notes
            //THIS FUNCTION WILL CAPTURE A SINGLE VALUE AFTER EXECUTING INLINE SQL
            #endregion Notes

			object i;
			try 
			{
				i = SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.Text, vSql);
			} 
			catch (Exception ex) 
			{
				throw ex;
			}
			return i;
        }
        #endregion

        #region ExecuteSqlDataSet
        public override DataSet ExecuteSqlDataSet(string vSql)
        {
            #region Notes
            //THIS FUNCTION WILL POPULATE DATASET AFTER EXECUTING INLINE SQL
            //AND ALSO RETURN DATASET TO IT'S CALLING ENVIRONMENT
            #endregion Notes

            DataSet ds;
            try
            {
                ds = SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.Text, vSql);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }
        #endregion

        #region ExecuteSqlDataSet
        public override DataSet ExecuteSqlDataSet(string vSql, string SPName)
		{
            #region Notes
            //THIS FUNCTION WILL POPULATE DATASET AFTER EXECUTING DYNAMIC STORE PROCEDURE
            //AND ALSO RETURN DATASET TO IT'S CALLING ENVIRONMENT
            #endregion Notes

			DataSet ds;
			SqlParameter[] arParms = new SqlParameter[0];
			try 
			{
                if (vSql != "")
                {
                    arParms[0] = new SqlParameter("@sSql", SqlDbType.NText);
                    arParms[0].Value = vSql;

                    ds = SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, SPName, arParms);
                }
                else
                {
                    ds = SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.StoredProcedure, SPName);
                }
			} 
			catch (Exception ex) 
			{
				throw ex;
			}
			return ds;
        }
        #endregion

        #region FillDatatableForCrpt
        public override DataTable FillDatatableForCrpt(string vSql, DataTable retDatatbl)
		{
            #region Notes
            //THIS FUNCTION WILL POPULATE DATATABLE AFTER EXECUTING DYNAMIC STORE PROCEDURE
            //AND ALSO RETURN DATATABLE TO IT'S CALLING ENVIRONMENT
            //IT WILL BE USED FOR BINDING CRYSTAL REPORT
            #endregion Notes

			try 
			{
				retDatatbl = SqlHelper.ExecuteDataset(GetConnectionString(), CommandType.Text, vSql).Tables[0];
			} 
			catch (Exception ex) 
			{
				throw ex;
			}
			return retDatatbl;
        }
        #endregion

        #region ExecuteSqlReader
        public override SqlDataReader ExecuteSqlReader(string vSql, string SPName)
		{
            #region Notes
            //THIS FUNCTION WILL POPULATE SQLDATAREADER AFTER EXECUTING DYNAMIC STORE PROCEDURE
            //AND ALSO RETURN SQLDATAREADER TO IT'S CALLING ENVIRONMENT
            #endregion Notes

			SqlDataReader dr;
			SqlParameter[] arParms = new SqlParameter[0];
			try 
			{
                if (vSql.Trim() != "")
                {
                    arParms[0] = new SqlParameter("@sSql", SqlDbType.NText);
                    arParms[0].Value = vSql;
                    dr = SqlHelper.ExecuteReader(GetConnectionString(), CommandType.StoredProcedure, SPName, arParms);
                }
                else
                {
                    dr = SqlHelper.ExecuteReader(GetConnectionString(), CommandType.StoredProcedure, SPName);
                }
			} 
			catch (Exception ex) 
			{
				throw ex;
			}
			return dr;
        }
        #endregion

        #region ExecuteSqlReader
        public override SqlDataReader ExecuteSqlReader(string vSql)
		{
            #region Notes
            //THIS FUNCTION WILL POPULATE SQLDATAREADER AFTER EXECUTING STORE PROCEDURE
            //AND ALSO RETURN SQLDATAREADER TO IT'S CALLING ENVIRONMENT
            #endregion Notes

			SqlDataReader dr;
			try 
			{
				dr = SqlHelper.ExecuteReader(GetConnectionString(), CommandType.Text, vSql);
			} 
			catch (Exception ex) 
			{
				throw ex;
			}
			return dr;
        }
        #endregion

        #region ExecutePagingSql
        public override DataSet ExecutePagingSql(string sConStr, string spName, object[] objArr)
		{
            #region Notes
            //THIS FUNCTION WILL POPULATE DATASET AFTER EXECUTING STORE PROCEDURE
            //AND ALSO RETURN DATASET TO IT'S CALLING ENVIRONMENT.
            //IT WILL BE USED ONLY FOR HAVING PAGING FUNCTIONALITY
            #endregion Notes

			DataSet ds = new DataSet();
			ds = SqlHelper.ExecuteDataset(sConStr, spName, objArr);
			return ds;
        }
        #endregion

        #region GetSPParams
        public override ArrayList GetSPParams(string SpName)
		{
            #region Notes
            //THIS FUNCTION WILL FETCH PROCEDURE'S PARAM RELATED INFO ONE BY ONE LIKE PARAM NAME,PARAM TYPE,
            //PARAM DIRECTION AND SIDE-BY-SIDE IT WILL POPULATED A ARRAYLIST WITH EACH PARAM RELATED INFO
            #endregion Notes

			ArrayList objArrParams = new ArrayList();
			int i=0;
			SqlParameter[] objParams = SqlHelperParameterCache.GetSpParameterSet(GetConnectionString(), SpName);
			objArrParams.Clear();
			for (i = 0; i <= objParams.Length - 1; i++)
			{
				objArrParams.Add(new ParamsList(objParams[i].ParameterName, objParams[i].Value, objParams[i].SqlDbType, objParams[i].Direction));
			}
			return objArrParams;
        }
        #endregion

        #region HandleData
        public override int HandleData(ArrayList objArr, string SpName)
		{
            #region Notes
            //THIS FUNCTION WILL TAKE STOTRE PROCEDURE NAME AND STORE PROCEDURE PARAMS RELATED VALUES
            //FROM USER AND DYNAMICALLY EXCUTE STOTRE PROCEDURE AND RETURN HOW MANY ROWS ARE AFFECTED
            //TO IT'S CALLING ENVIRONMENT
            #endregion Notes

			int i=0;
			SqlParameter[] arParms = new SqlParameter[objArr.Count];
			for (i = 0; i <= objArr.Count - 1; i++) 
			{
				SqlParameter param = new SqlParameter();
				param.ParameterName = ((ParamsList)(objArr[i])).ParamName;
				param.SqlDbType = ((ParamsList)(objArr[i])).ParamType;
				if (((ParamsList)(objArr[i])).ParamType == SqlDbType.DateTime) 
				{
					if (!(((ParamsList)(objArr[i])).ParamValue == DBNull.Value)) 
					{
						param.Value = System.Convert.ToDateTime(((ParamsList)(objArr[i])).ParamValue);
					} 
					else 
					{
						param.Value = DBNull.Value;
					}
				} 
				else 
				{
					param.Value = ((ParamsList)(objArr[i])).ParamValue;
				}
				arParms[i] = param;
			}
			try 
			{
				i = SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.StoredProcedure, SpName, arParms);
			} 
			catch (Exception ex) 
			{
				throw ex;
			}
			return i;
        }
        #endregion

        #region HandleDataWithReturnParams
        public override string HandleDataWithReturnParams(ArrayList objArr, string SpName)
        {
            #region Notes
            //THIS FUNCTION WILL TAKE STOTRE PROCEDURE NAME AND STORE PROCEDURE PARAMS RELATED VALUES
            //FROM USER AND DYNAMICALLY EXCUTE STOTRE PROCEDURE AND CAPTURE SINGLE RETURN VALUE AND
            //RETURN THAT VALUE TO IT'S CALLING ENVIRONMENT
            #endregion Notes

            string  sRetVal = null;
            int i = 0;
            SqlParameter[] arParms = new SqlParameter[objArr.Count];
            for (i = 0; i <= objArr.Count - 1; i++)
            {
                SqlParameter param = new SqlParameter();
                param.ParameterName = ((ParamsList)(objArr[i])).ParamName;
                param.SqlDbType = ((ParamsList)(objArr[i])).ParamType;
                if (((ParamsList)(objArr[i])).ParamDirection == ParameterDirection.Input)
                {
                    if (((ParamsList)(objArr[i])).ParamType == SqlDbType.DateTime)
                    {
                        if (!(((ParamsList)(objArr[i])).ParamValue == DBNull.Value))
                        {
                            param.Value = System.Convert.ToDateTime(((ParamsList)(objArr[i])).ParamValue);
                        }
                        else
                        {
                            param.Value = DBNull.Value;
                        }
                    }
                    else
                    {
                        param.Value = ((ParamsList)(objArr[i])).ParamValue;
                    }
                }
                arParms[i] = param;
            }
            try
            {
                sRetVal = (string)SqlHelper.ExecuteScalar(GetConnectionString(), CommandType.StoredProcedure, SpName, arParms);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return sRetVal;
        }
        #endregion

        #region HandleDataWithDataReader
        public override SqlDataReader HandleDataWithDataReader(ArrayList objArr, string SpName)
        {
            #region Notes
            //THIS FUNCTION WILL TAKE STOTRE PROCEDURE NAME AND STORE PROCEDURE PARAMS RELATED VALUES
            //FROM USER AND DYNAMICALLY EXCUTE STOTRE PROCEDURE AND CAPTURE RETURN VALUES AND POPULATE
            //DATAREADER WITH THE RETURN VALUE AND RETURN POPULATED DATAREADER TO IT'S CALLING ENVIRONMENT
            #endregion Notes

            SqlDataReader oSqlDataReader = null;
            int i = 0;
            SqlParameter[] arParms = new SqlParameter[objArr.Count];
            for (i = 0; i <= objArr.Count - 1; i++)
            {
                SqlParameter param = new SqlParameter();
                param.ParameterName = ((ParamsList)(objArr[i])).ParamName.ToString();
                param.SqlDbType = ((ParamsList)(objArr[i])).ParamType;
                if (((ParamsList)(objArr[i])).ParamDirection == ParameterDirection.Input)
                {
                    if (((ParamsList)(objArr[i])).ParamType == SqlDbType.DateTime)
                    {
                        if (!(((ParamsList)(objArr[i])).ParamValue == DBNull.Value))
                        {
                            param.Value = System.Convert.ToDateTime(((ParamsList)(objArr[i])).ParamValue);
                        }
                        else
                        {
                            param.Value = DBNull.Value;
                        }
                    }
                    else
                    {
                        param.Value = ((ParamsList)(objArr[i])).ParamValue;
                    }
                }
                arParms[i] = param;
            }
            try
            {
                oSqlDataReader = SqlHelper.ExecuteReader(GetConnectionString(), CommandType.StoredProcedure, SpName, arParms);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return oSqlDataReader;
        }
        #endregion

        #region HandleData
        public override int HandleData(string Sql)
		{
            #region Notes
            //THIS FUNCTION WILL TAKE SQL FROM USER AND DYNAMICALLY EXCUTE IT
            #endregion Notes

			int i;
			try 
			{
				i = SqlHelper.ExecuteNonQuery(GetConnectionString(), CommandType.Text, Sql);
			} 
			catch (Exception ex) 
			{
				throw ex;
			}
			return i;
        }
        #endregion
    }

}
