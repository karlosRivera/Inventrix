
// Developed by Swarnali Datta //
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Components.DAL;
using System.Collections;

namespace BLL.Master
{
   public class LabourCategory
    {
        public LabourCategory()
        {
            
        }
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
               sSpName = "MstLabourCategory_Insert";
           }
           else if (OperationMode == "E")
           {
               sSpName = "MstLabourCategory_Update";
           }
           else if (OperationMode == "D")
           {
               sSpName = "MstLabourCategory_Delete";
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
       public static object Delete(string LabourCategoryID, string sAction)
       {
           ArrayList objArr = new ArrayList();
           objArr.Add(LabourCategoryID);
           objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
           objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
           objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
           object tmpMsg = BLL.Master.LabourCategory.Operate(objArr, sAction);
           return tmpMsg;
       }
       #endregion

    }
}
