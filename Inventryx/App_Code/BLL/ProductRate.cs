
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
using System.Collections;
using Components.DAL;

namespace BLL.Master
{
    public class ProductRate
    {
        public ProductRate()
        {}

        public static DataSet BindGrid(string spName, object[] objArr) 
       {
           return Components.DAL.DBUtils.GetInstance.ExecutePagingSql(Components.DAL.DBUtils.GetInstance.GetConnectionString(), spName, objArr);
       }

       #region GetComboData
       #region Notes
       //THIS FUNCTION WILL FETCH DATA THROUGH STORE PROCEDURE AND POPULATE DATAREADER AND RETURN
       //DATAREADER TO ITS CALLING ENVIRONMENT FOR POPULATING COMBO
       #endregion
       public static SqlDataReader GetComboData(string SpName, ArrayList objArrVal)
       {
           ArrayList objArrFields = new ArrayList();
           ArrayList objArrParams = new ArrayList();

           int i;
           objArrParams = DBUtils.GetInstance.GetSPParams(SpName);
           for (i = 0; i <= objArrParams.Count - 1; i++)
           {
               objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, objArrVal[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
           }

           SqlDataReader oDr = Components.DAL.DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, SpName);
           return oDr;
       }
       #endregion

        #region GetDataForViewPage
        public static SqlDataReader GetDataForViewPage(ArrayList ObjArrVal)
        {
            #region GetDataForViewPage
            //WHEN A STOCK POINT DATA WILL BE SHOWN IN VIEW MODE THEN THIS FUNCTION WILL FETCH DATA
            //AND POPULATE A DATAREADER AND RETURN THE DATAREADER TO ITS CALLING ENVIRONMENT
            #endregion

            ArrayList objArrFields = new ArrayList();
            ArrayList objArrParams = new ArrayList();

            int i;
            objArrParams = DBUtils.GetInstance.GetSPParams("MstProductRate_Select");
            for (i = 0; i <= objArrParams.Count - 1; i++)
            {
                objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, ObjArrVal[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
            }

            SqlDataReader oDr = Components.DAL.DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, "MstProductRate_Select");
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
               sSpName = "MstProductRate_Insert";
           }
           else if (OperationMode == "E")
           {
               sSpName = "MstProductRate_Update";
           }
           else if (OperationMode == "D")
           {
               sSpName = "MstProductRate_Delete";
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
        public static object Delete(string ProductRateID, string sAction)
       {
           ArrayList objArr = new ArrayList();
           objArr.Add(ProductRateID);
           objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
           objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
           objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
           object tmpMsg = BLL.Master.ProductRate.Operate(objArr, sAction);
           return tmpMsg;
       }
       #endregion
        
        #region GetProductName
       #region Notes
       //THIS FUNCTION WILL FETCH PRODUCT GROUP NAME THROUGH STORE PROCEDURE 
       //RETURN THE PRODUCT GROUP NAME TO ITS CALLING ENVIRONMENT
       #endregion
       public static string GetProductName(string ProductID)
       {
           string sProductName = "";
           ArrayList objArrFields = new ArrayList();
           ArrayList objArrParams = new ArrayList();
           int i;
           objArrParams = DBUtils.GetInstance.GetSPParams("MstGetProductName_Select");
           for (i = 0; i <= objArrParams.Count - 1; i++)
           {
               objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, ProductID, ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
           }

           SqlDataReader oDr = Components.DAL.DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, "MstGetProductName_Select");
           while (oDr.Read())
           {
               if (oDr[0] != DBNull.Value)
               {
                   sProductName = oDr[0].ToString();
               }
           }
           oDr.Close();
           return sProductName;
       }
       #endregion
    }
}
