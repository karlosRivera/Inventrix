

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
/// Summary description for Company
/// </summary>
namespace BLL.Master
{
    public class Company
    {
        public Company() { }

        public static DataSet BindGrid(string spName, object[] objArr)
        {
            return Components.DAL.DBUtils.GetInstance.ExecutePagingSql(Components.DAL.DBUtils.GetInstance.GetConnectionString(), spName, objArr);
        }


        #region GetDataForViewPage
        public static SqlDataReader GetDataForViewPage(string CompanyID)
        {
            #region GetDataForViewPage
            //WHEN A STOCK POINT DATA WILL BE SHOWN IN VIEW MODE THEN THIS FUNCTION WILL FETCH DATA
            //AND POPULATE A DATAREADER AND RETURN THE DATAREADER TO ITS CALLING ENVIRONMENT
            #endregion

            ArrayList objArrFields = new ArrayList();
            ArrayList objArrParams = new ArrayList();
            ArrayList objArrValues = new ArrayList();
            int i;
            objArrValues.Add(CompanyID);
           
            objArrParams = DBUtils.GetInstance.GetSPParams("MstCompany_Select");
            for (i = 0; i <= objArrParams.Count - 1; i++)
            {
                objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, objArrValues[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
            }

            SqlDataReader oDr = Components.DAL.DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, "MstCompany_Select");
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
                sSpName = "MstCompany_Insert";
            }
            else if (OperationMode == "E")
            {
                sSpName = "MstCompany_Update";
            }
            else if (OperationMode == "D")
            {
                sSpName = "MstCompany_Delete";
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

        #region Operate
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
        public static object Delete(string CompanyID, string sAction)
        {
            ArrayList objArr = new ArrayList();
            objArr.Add(CompanyID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            object tmpMsg = BLL.Master.Company.Operate(objArr, sAction);
            return tmpMsg;
        }
        #endregion

        #region LoadCompany
        #region Notes
        //THIS WILL LOAD Company detail IN SQLDATAREADER AND RETURN SQLDATAREADER TO ITS CALLING ENVIRONMENT
        #endregion
        public static SqlDataReader LoadCompany()
        {
            SqlDataReader oDr = DBUtils.GetInstance.ExecuteSqlReader("", "MstLoginCompany_Select");
            return oDr;
        }
        #endregion
    }
}
