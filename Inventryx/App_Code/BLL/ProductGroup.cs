
// Developed by Swarnali Datta //
using System;
using System.Data;
using System.Configuration;
using CutePager;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Components.DAL;
using System.Data.SqlClient;
using System.Collections;


namespace BLL.Master
{

    public class ProductGroup
    {
        public ProductGroup() { }

        public static DataSet BindGrid(string spName, object[] objArr)
        {
            return Components.DAL.DBUtils.GetInstance.ExecutePagingSql(Components.DAL.DBUtils.GetInstance.GetConnectionString(), spName, objArr);
        }

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
                sSpName = "MstProductGroup_Insert";
            }
            else if (OperationMode == "E")
            {
                sSpName = "MstProductGroup_Update";
            }
            else if (OperationMode == "D")
            {
                sSpName = "MstProductGroup_Delete";
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

        #region Delete
        #region Notes
        //THIS FUNCTION WILL CALL STORE PROCEDURE AND PASS USER ID AND PWD THERE FOR CHECKING USER CREDENTIAL
        #endregion
        public static object Delete(string StockPointID, string sAction)
        {
            ArrayList objArr = new ArrayList();
            objArr.Add(StockPointID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            object tmpMsg = BLL.Master.ProductGroup.Operate(objArr, sAction);
            return tmpMsg;
        }
        #endregion

    }
}
