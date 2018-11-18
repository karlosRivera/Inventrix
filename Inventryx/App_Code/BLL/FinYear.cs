//Developed By : Tridip Bhattacharjee

using System;
using System.Collections;
using CutePager;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Components.DAL;

/// <summary>
/// Summary description for FinYear
/// </summary>
/// 

namespace BLL.Master
{
    public class FinYear
    {
        public FinYear() { }

        #region BindGrid
        public static DataSet BindGrid(string spName, object[] objArr)
        {
            return Components.DAL.DBUtils.GetInstance.ExecutePagingSql(Components.DAL.DBUtils.GetInstance.GetConnectionString(), spName, objArr);
        }
        #endregion
        #region LoadFinYr
        #region Notes
        //THIS WILL LOAD FIN YEAR IN SQLDATAREADER AND RETURN SQLDATAREADER TO ITS CALLING ENVIRONMENT
        #endregion
        public static SqlDataReader LoadFinYr()
        {
            SqlDataReader oDr = DBUtils.GetInstance.ExecuteSqlReader("", "MstFinYr_Select");
            return oDr;
        }
        #endregion
        #region GetDataForViewPage
        public static SqlDataReader GetDataForViewPage(string sStockPointID)
        {
            #region GetDataForViewPage
            //WHEN A STOCK POINT DATA WILL BE SHOWN IN VIEW MODE THEN THIS FUNCTION WILL FETCH DATA
            //AND POPULATE A DATAREADER AND RETURN THE DATAREADER TO ITS CALLING ENVIRONMENT
            #endregion

            string sSupplierName = "";
            ArrayList objArrFields = new ArrayList();
            ArrayList objArrParams = new ArrayList();
            int i;
            objArrParams = DBUtils.GetInstance.GetSPParams("MstStockPoint_Select");
            for (i = 0; i <= objArrParams.Count - 1; i++)
            {
                objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, sStockPointID, ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
            }

            SqlDataReader oDr = Components.DAL.DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, "MstStockPoint_Select");
            return oDr;
        }
        #endregion

        #region Operate
        #region Notes
        //THIS FUNCTION WILL CALL STORE PROCEDURE AND PASS USER ID AND PWD THERE FOR CHECKING USER CREDENTIAL
        #endregion
        public static object Operate(ArrayList arrLst, string OperationMode)
        {
            string sSpName = "";
            object _object = null;
            ArrayList objArrFields = new ArrayList();
            ArrayList objArrParams = new ArrayList();
            int i;
            if (OperationMode == "A")
            {
                sSpName = "MstFinYear_Insert";
            }
            else if (OperationMode == "E")
            {
                sSpName = "MstFinYear_Update";
            }
            else if (OperationMode == "D")
            {
                sSpName = "MstFinYear_Delete";
            }

            objArrParams = DBUtils.GetInstance.GetSPParams(sSpName);
            for (i = 0; i <= objArrParams.Count - 1; i++)
            {
                objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, arrLst[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
            }
            _object = DBUtils.GetInstance.HandleDataWithReturnParams(objArrFields, sSpName);
            return _object;
        }
        #endregion

        #region FetchData
        #region Notes
        //THIS FUNCTION WILL CALL STORE PROCEDURE AND PASS USER ID AND PWD THERE FOR CHECKING USER CREDENTIAL
        #endregion
        public static SqlDataReader FetchData(ArrayList arrLst, string SpName)
        {
            SqlDataReader oSqlDataReader = null;
            ArrayList objArrFields = new ArrayList();
            ArrayList objArrParams = new ArrayList();
            int i;
            objArrParams = DBUtils.GetInstance.GetSPParams(SpName);
            for (i = 0; i <= objArrParams.Count - 1; i++)
            {
                objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, arrLst[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
            }
            oSqlDataReader = DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, SpName);
            return oSqlDataReader;
        }
        #endregion


        #region Operate
        #region Notes
        //THIS FUNCTION WILL CALL STORE PROCEDURE AND PASS USER ID AND PWD THERE FOR CHECKING USER CREDENTIAL
        #endregion
        public static object Delete(string ID, string sAction)
        {
            ArrayList objArr = new ArrayList();
            objArr.Add(ID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
            object tmpMsg = Operate(objArr, sAction);
            return tmpMsg;
        }
        #endregion

    }
}