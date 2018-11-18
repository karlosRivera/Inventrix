

//Developed By : Indranil Roy

using System;
using System.Collections;
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
/// Summary description for PurchaseOrder
/// </summary>
/// 
namespace BLL.Transaction
{
    public class PurchaseInvoice
    {
        public PurchaseInvoice()
        {
        }

        #region GetComboData
        #region Notes
        //THIS FUNCTION WILL FETCH DATA THROUGH STORE PROCEDURE AND POPULATE DATAREADER AND RETURN
        //DATAREADER TO ITS CALLING ENVIRONMENT FOR POPULATING COMBO
        #endregion

        public static SqlDataReader GetComboData(string SpName,ArrayList  objArrVal)
        {
            ArrayList objArrFields = new ArrayList();
            ArrayList objArrParams = new ArrayList();

            //ArrayList objArrVal = new ArrayList();

            //objArrVal.Add("");
            //objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            //objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            //objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

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


        #region ListBoxData
        #region Notes

        #endregion

        public static SqlDataReader ListBoxData(string SpName,ArrayList ArrVal)
        {
            ArrayList objArrFields = new ArrayList();
            ArrayList objArrParams = new ArrayList();
            int i;
            objArrParams = DBUtils.GetInstance.GetSPParams(SpName);
            for (i = 0; i <= objArrParams.Count - 1; i++)
            {
                objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, ArrVal[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
            }

            SqlDataReader oDr = Components.DAL.DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, SpName);
            return oDr;

        }
        #endregion

        #region GetDataForViewPage
        #region Notes
        //THIS FUNCTION WILL FETCH DATA THROUGH STORE PROCEDURE AND POPULATE DATAREADER AND RETURN
        //DATAREADER TO ITS CALLING ENVIRONMENT FOR POPULATING FORMS CONTROL
        #endregion
        public static SqlDataReader GetDataForViewPage(ArrayList objArrVal)
        {
            ArrayList objArrFields = new ArrayList();
            ArrayList objArrParams = new ArrayList();
            int i;
            objArrParams = DBUtils.GetInstance.GetSPParams("TrnPurchaseInvoice_Select");
            for (i = 0; i <= objArrParams.Count - 1; i++)
            {
                objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, objArrVal[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
            }

            SqlDataReader oDr = Components.DAL.DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, "TrnPurchaseInvoice_Select");
            return oDr;
        }
        #endregion

        #region BindGrid
        #region Notes
        //THIS FUNCTION WILL FETCH DATA THROUGH STORE PROCEDURE AND POPULATE DATAREADER AND RETURN
        //DATASET TO ITS CALLING ENVIRONMENT FOR PAGINATION OF THE GRID
        #endregion
        public static DataSet BindGrid(string spName, object[] objArr)
        {
            return Components.DAL.DBUtils.GetInstance.ExecutePagingSql(Components.DAL.DBUtils.GetInstance.GetConnectionString(), spName, objArr);
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
                sSpName = "TrnPurchaseInvoice_Insert";
            }
            else if (OperationMode == "E")
            {
                sSpName = "TrnPurchaseInvoice_Update";
            }
            else if (OperationMode == "D")
            {
                sSpName = "TrnPurchaseInvoice_Delete";
            }
            else if (OperationMode == "C")
            {
                sSpName = "TrnPurchaseInvoice_Cancel";
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
        //THIS FUNCTION WILL FETCH DATA FROM DATABASE THROUGH STORE PROCEDURE CALL
        //WHENEVER WE CALL THIS FUNCTION THEN WE JUST PASS THE VALUES IN A ARRAYLIST AND
        //STORE PROCEDURE NAME AND THEN THIS FUNCTION WILL RETURN DATA THROUGH DATAREADER
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
        //THIS FUNCTION WILL DELETE DATA THROUGH CALLING STOREPROCEDURE
        #endregion
        public static object Delete(string PurchaseOrderID, string sAction)
        {
            ArrayList objArr = new ArrayList();
            objArr.Add(PurchaseOrderID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
            object tmpMsg = Operate(objArr, sAction);
            return tmpMsg;
        }
        #endregion

        #region GetPurchaseInvoiceDetailForReport
        #region Notes
        //THIS FUNCTION WILL FETCH PURCHASEORDERDETAIL THROUGH STORE PROCEDURE 
        //RETURN THE DATAREADER TO ITS CALLING ENVIRONMENT
        #endregion
        public static SqlDataReader GetPurchaseInvoiceDetailForReport(string PurchaseInvoiceID, string SpName)
        {
            ArrayList objArrFields = new ArrayList();
            ArrayList objArrParams = new ArrayList();
            ArrayList objArr=new ArrayList();

            objArr.Add(PurchaseInvoiceID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

            int i;
            objArrParams = DBUtils.GetInstance.GetSPParams(SpName);
            for (i = 0; i <= objArrParams.Count - 1; i++)
            {
                objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, objArr[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
            }

            SqlDataReader oDr = Components.DAL.DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, SpName);
            return oDr;
        }
        #endregion

    }
}