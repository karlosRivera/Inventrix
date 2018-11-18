//Developed By : Tridip Bhattacharjee

using System;
using System.IO;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Components.DAL;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for Utility
/// </summary>
public class Utility
{
	public Utility(){ }

    #region GetMenuData
    #region Notes
    /*
    * HERE WE WILL FETCH USER RELATED MODULE ACCESS RIGHTS 
    */
     #endregion
    public static DataSet GetMenuData()
    {
        DataSet dst = null;
        dst = DBUtils.GetInstance.ExecuteSqlDataSet("","MstMenu_Select");
        DataRelation oDataRelation=new DataRelation("Children",dst.Tables[0].Columns["OptionID"],dst.Tables[1].Columns["ParentID"],false);
        oDataRelation.Nested=true;
        dst.Relations.Add(oDataRelation);
        return dst;
    }
    #endregion

    #region StoreProfileInfo
    #region Notes
    /*
     HERE WE WILL STORE USER RELATED INFO 
    */
    #endregion
    public static void StoreProfileInfo(string sUserID,string CompanyID,string BranchID,string HoBranchID,string FinYr)
    {
        SqlDataReader oDr = null;
        if (sUserID != "")
        {
            ArrayList arrLst = new ArrayList();
            arrLst.Add(sUserID);

            ArrayList objArrFields = new ArrayList();
            ArrayList objArrParams = new ArrayList();
            int i;
            objArrParams = DBUtils.GetInstance.GetSPParams("MstUserProfileInfo_Select");
            for (i = 0; i <= objArrParams.Count - 1; i++)
            {
                if (((ParamsList)(objArrParams[i])).ParamName == "@Mode")
                {
                    objArrFields.Add(new ParamsList("@Mode", "", SqlDbType.VarChar, ParameterDirection.Input));
                }
                else
                {
                    objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, arrLst[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
                }
            }
            oDr = DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, "MstUserProfileInfo_Select");
        }

        if (oDr != null)
        {
            ArrayList oArrLst = new ArrayList();
            if (oDr.HasRows)
            {
                while (oDr.Read())
                {
                    oArrLst.Add(new User(sUserID, oDr["UserName"].ToString(), oDr["UserTypeID"].ToString(),CompanyID,BranchID, HoBranchID,oDr["CompanyName"].ToString(), oDr["BranchName"].ToString(), FinYr));
                }
            }

            if (oArrLst != null)
            {
                HttpContext.Current.Session["ProfileInfo"] = oArrLst;
            }

            if (!oDr.IsClosed)
                oDr.Close();
        }

    }
    #endregion
    
    #region StoreRightsInfo
    #region Notes
    /*
    * HERE WE WILL STORE USER RELATED AND MODULE WISE COMPLETE RIGHTS INFO 
    */
    #endregion
    public static void StoreRightsInfo(string sUserID)
    {
        SqlDataReader oDr = null;
        if (sUserID != "")
        {
            ArrayList arrLst = new ArrayList();
            arrLst.Add(sUserID);

            ArrayList objArrFields = new ArrayList();
            ArrayList objArrParams = new ArrayList();
            int i;
            objArrParams = DBUtils.GetInstance.GetSPParams("MstUserRightsInfo_Select");
            for (i = 0; i <= objArrParams.Count - 1; i++)
            {
                if (((ParamsList)(objArrParams[i])).ParamName == "@Mode")
                {
                    objArrFields.Add(new ParamsList("@Mode", "", SqlDbType.VarChar, ParameterDirection.Input));
                }
                else
                {
                    objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, arrLst[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
                }
            }
            oDr = DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, "MstUserRightsInfo_Select");
        }

        if (oDr != null)
        {
            ArrayList oArrLst = new ArrayList();
            if (oDr.HasRows)
            {
                while (oDr.Read())
                {
                    oArrLst.Add(new Rights(Convert.ToInt32(oDr["OptionID"].ToString()), Convert.ToString(oDr["AccessTag"]), Convert.ToString(oDr["InsertTag"]), Convert.ToString(oDr["UpdateTag"]), Convert.ToString(oDr["DeleteTag"])));
                }
            }

            if (oArrLst != null)
            {
                HttpContext.Current.Session["RightsInfo"] = oArrLst;
            }

            if (!oDr.IsClosed)
                oDr.Close();
        }
    }
    #endregion

    #region StoreRightsInfo
    #region Notes
    /*
    * HERE WE WILL SET SORTING IMAGE AS A RESULT USER CAN UNDERSTAND THE SORT IN WHICH DIRECTION 
    */
    #endregion
    public static void HandleSorting(DataGrid dg, string sortExpr, string sortOrder)
    {
        foreach (DataGridColumn tmpcol in dg.Columns)
        {
            tmpcol.HeaderText = Regex.Replace(tmpcol.HeaderText, "&nbsp;<.*>", string.Empty);
            if (tmpcol.SortExpression == sortExpr)
            {
                if (sortOrder == "ASC")
                {
                    tmpcol.HeaderText += string.Concat("&nbsp;<img src=", dg.ResolveUrl("../Images/upp.gif"), " border=0,width=11,height=7/>");
                }
                else
                {
                    tmpcol.HeaderText += string.Concat("&nbsp;<img src=", dg.ResolveUrl("../Images/down.gif"), " border=0,width=11,height=7/>");
                }
            }
        }
    }
    #endregion

    #region ShowMessage
    public static void ShowMessage(System.Web.UI.Page refPage,string sMessage)
    {
        #region info
        //THIS FUNCTION WILL EMIT JAVASCRIPT IN A PAGE FROM CODEBEHIND FOR SHOWING MESSAGE TO THE USER
        #endregion

        string sScript = "<script language='javascript'>";
        if (sMessage.IndexOf("'") > 0)
        {
            sMessage = sMessage.Replace("'", "\\'");
        }
        sScript = sScript + "alert('"+sMessage+"')";
        sScript = sScript + "</script>";
        refPage.ClientScript.RegisterStartupScript(typeof(Page), "strScript", sScript);
    }
    #endregion

    #region FillFilterDropDown
    public static void FillFilterDropDown(DropDownList LVSearchingDropDown, string LVDataFieldText, string LVDataFieldIDValue, string LVCondition,string LVPageName)
    {
        #region info
        //THIS FUNCTION WILL POPUALATE COMBO FOR DYNAMIC SEARCH IN ALL THE DATA LISTING PAGE
        #endregion
        SqlDataReader oDr=null;
        ArrayList arrLst = new ArrayList();
        ArrayList objArrFields = new ArrayList();
        ArrayList objArrParams = new ArrayList();

        arrLst.Add(LVCondition);
        arrLst.Add(LVPageName);
        int i;
        try
        {
            objArrParams = DBUtils.GetInstance.GetSPParams("SelectSearchingTables_Select");
            for (i = 0; i <= objArrParams.Count - 1; i++)
            {
                if (((ParamsList)(objArrParams[i])).ParamName == "@Mode")
                {
                    objArrFields.Add(new ParamsList("@Mode", "", SqlDbType.VarChar, ParameterDirection.Input));
                }
                else
                {
                    objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, arrLst[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
                }
            }
            oDr = DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, "SelectSearchingTables_Select");

            while (oDr.Read())
            {
                LVSearchingDropDown.Items.Add(new ListItem(Convert.ToString(oDr[LVDataFieldText]), Convert.ToString(oDr[LVDataFieldIDValue])));
            }
        }
        catch (Exception ex) 
        {
            string sMsg = ex.Message.ToString();
        }
        finally {oDr.Close();}

    }
    #endregion

    #region MakeTable
    public static DataTable MakeTable(ArrayList LVColumns)
    {

        /* 
         * This function is for creating Data Table which will pass to the above function.
         * This function has One parameter.
         * The only parameter is name of the columns which will display in Grid
         * 
         * *****************************************************************************
         * FUNCTIONALITY
         * *****************************************************************************
         * 
         * Creating data table with some columns.
         * 
        */

        DataTable LVTableForColumnName = new DataTable();
        int LVLength = LVColumns.Count;


        for (int LVCount = 0; LVCount <= LVColumns.Count - 1; LVCount++)
        {
            DataColumn LVColumn = new DataColumn();
            LVColumn.DataType = System.Type.GetType("System.String");
            LVColumn.ColumnName = LVColumns[LVCount].ToString();

            LVTableForColumnName.Columns.Add(LVColumn);
        }

        return LVTableForColumnName;

    }
    #endregion

    #region GenerateWhereClause
    public static string GenerateWhereClause(ArrayList LVColumns, ArrayList LVSerachValues)
    {
        #region info
        //THIS FUNCTION WILL GENERATE WHERE CLAUSE FOR DYNAMIC SEARCH
        #endregion

        string sInputXml = "";
        string LVWhereClauseExpression = "";
        DataTable LVDataTable = new DataTable();
        DataRow LVDataRow;
        DataSet LVDataSet = new DataSet();
        int LVLoopCount = 0;
        int LVCount = 0;
        int LVCounter = 0;

        LVDataTable = MakeTable(LVColumns);

        if (LVSerachValues.Count == 4)
        { LVLoopCount = 1; }
        if (LVSerachValues.Count == 8)
        { LVLoopCount = 2; }
        if (LVSerachValues.Count == 12)
        { LVLoopCount = 3; }

        while (LVCounter <= LVLoopCount - 1)
        {
            LVDataRow = LVDataTable.NewRow();
            LVDataRow["SearchField"] = LVSerachValues[LVCount];
            LVDataRow["FilterCondition"] = LVSerachValues[LVCount + 1];
            LVDataRow["ConditionData"] = LVSerachValues[LVCount + 2];
            if (Convert.ToBoolean(LVSerachValues[LVCount + 3]) == true)
                LVDataRow["MatchCase"] = 1;
            else
                LVDataRow["MatchCase"] = 0;
            LVDataTable.Rows.Add(LVDataRow);
            LVCount = LVCount + 4;
            LVCounter = LVCounter + 1;
        }
        LVDataSet.Tables.Add(LVDataTable);
        LVDataSet.Tables[0].TableName = "Search";

        //******************************************************
        ArrayList arrLst = new ArrayList();
        ArrayList objArrFields = new ArrayList();
        ArrayList objArrParams = new ArrayList();
        
        sInputXml = LVDataSet.GetXml();
        arrLst.Add(sInputXml);
        arrLst.Add("");

        int i;
        try
        {
            objArrParams = DBUtils.GetInstance.GetSPParams("SearchWithXML_Select");
            for (i = 0; i <= objArrParams.Count - 1; i++)
            {
                if (((ParamsList)(objArrParams[i])).ParamName == "@Mode")
                {
                    objArrFields.Add(new ParamsList("@Mode", "", SqlDbType.VarChar, ParameterDirection.Input));
                }
                else
                {
                    objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, arrLst[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
                }
            }
            LVWhereClauseExpression = DBUtils.GetInstance.HandleDataWithReturnParams(objArrFields, "SearchWithXML_Select");
        }
        catch (Exception ex)
        {
            string sMsg = ex.Message.ToString();
        }
        finally {  }
        return LVWhereClauseExpression;
    }
    #endregion

    #region IsUserLoggedIn

    #region Notes
    /*
    * HERE WE WILL CHECK USER HAS LOGGED IN OR NO
    */
    #endregion

    public static bool IsUserLoggedIn()
    {
        if (((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID.ToString().Trim() != "")
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    #endregion

    #region RedirectToLoginPage

    #region Notes
    /*
    *   THIS FUNCTION WILL REDIRECT TO LOGIN PAGE WITH ALL THE PRESERVE QUERYSTRING IF THE USER IS NOT LOGGED IN 
    */
    #endregion
    public static void RedirectToLoginPage(string sPageName)
    {
        string sReturnPage = sPageName + "?" + HttpContext.Current.Request.ServerVariables["QUERY_STRING"];
        string sLoginPage = "Login.aspx?ReturnUrl=" + HttpContext.Current.Server.UrlEncode(sReturnPage);
        HttpContext.Current.Response.Redirect(sLoginPage);
    }
    #endregion

    #region LoadErrMsg
    #region Notes
    //THIS FUNCTION WILL READ ERROR MESSAGE FROM A XML FILE BASED ON ERROR ID AND RETURN THE ERROR MESSAGE TO ITS
    //CALLING ENVIRONMENT
    #endregion
    public static string LoadErrMsg(string ErrID)
    {
        string sErrMsg = "";
        DataSet oDS = new DataSet();
        string sModFilePath = HttpContext.Current.Request.PhysicalApplicationPath + @"Includes\ErrorMsg.xml";
        sModFilePath = sModFilePath.Replace("\\", @"\");
        oDS.ReadXml(sModFilePath);
        for (int i = 0; i <= oDS.Tables[0].Rows.Count - 1; i++)
        {
            if (ErrID == oDS.Tables[0].Rows[i]["ID"].ToString().ToUpper())
            {
                sErrMsg = oDS.Tables[0].Rows[i]["Message"].ToString();
                break;
            }
        }

        return sErrMsg;
    }
    #endregion

    #region SetPageTitle
    #region Notes
    /*
    *   THIS FUNCTION WILL REDIRECT TO LOGIN PAGE WITH ALL THE PRESERVE QUERYSTRING IF THE USER IS NOT LOGGED IN 
    */
    #endregion
    public static void SetPageTitle(System.Web.UI.Page refPage,string PageName)
    {
        string sTmpPage = "";
        PageName = Path.GetFileNameWithoutExtension(PageName).ToUpper();
        switch (PageName)
        {
            case "INDEX":
                sTmpPage="Inventryx Home";
                break;
            case "ACCESSRIGHTMASTER":
                sTmpPage = "Access Rights Master";
                break;
            case "CHANGEPWD":
                sTmpPage = "Change Password";
                break;
            case "ERRMSG":
                sTmpPage = "Customized Error Message";
                break;
            case "SIGNOUT":
                sTmpPage = "Sign Out";
                break;

            case "BRANCH":
                sTmpPage = "Branch Listing";
                break;
            case "BRANCHADMIN":
                sTmpPage = "Branch Master";
                break;
            case "BRANCHVIEW":
                sTmpPage = "Branch View";
                break;

            case "CUSTOMER":
                sTmpPage = "Customer Listing";
                break;
            case "CUSTOMERMASTER":
                sTmpPage = "Customer Master";
                break;
            case "CUSTOMERVIEW":
                sTmpPage = "Customer View";
                break;

            case "DEPARTMENT":
                sTmpPage = "Department Listing";
                break;
            case "DEPARTMENTMASTER":
                sTmpPage = "Department Master";
                break;
            case "DEPARTMENTVIEW":
                sTmpPage = "Department View";
                break;

            case "FINYEARLIST":
                sTmpPage = "Financial Year Listing";
                break;
            case "FINYEARMASTER":
                sTmpPage = "Financial Year Master";
                break;
            case "FINYEARVIEW":
                sTmpPage = "Financial Year View";
                break;

            case "LABOURCATEGORY":
                sTmpPage = "Labour Category Listing";
                break;
            case "LABOURCATEGORYMASTER":
                sTmpPage = "Labour Category Master";
                break;
            case "LABOURCATEGORYVIEW":
                sTmpPage = "Labour Category View";
                break;

            case "PRODUCT":
                sTmpPage = "Product Listing";
                break;
            case "PRODUCTMASTER":
                sTmpPage = "Product Master";
                break;
            case "PRODUCTVIEW":
                sTmpPage = "Product View";
                break;

            case "PRODUCTGROUP":
                sTmpPage = "Product Group Listing";
                break;
            case "PRODUCTGROUPMASTER":
                sTmpPage = "Product Group Master";
                break;
            case "PRODUCTGROUPVIEW":
                sTmpPage = "Product Group View";
                break;

            case "PRODUCTRATE":
                sTmpPage = "Product Rate Listing";
                break;
            case "PRODUCTRATEMASTER":
                sTmpPage = "Product Rate Master";
                break;
            case "PRODUCTRATEVIEW":
                sTmpPage = "Product Rate View";
                break;

            case "PURCHASEORDERMASTER":
                sTmpPage = "Purchase Order Master";
                break;
            case "PURCHASEORDER":
                sTmpPage = "Purchase Order Listing";
                break;
            case "PURCHASEORDERVIEW":
                sTmpPage = "Purchase Order View";
                break;

            case "SERVICEITEMMASTER":
                sTmpPage = "Service Item Master";
                break;
            case "SERVICEITEM":
                sTmpPage = "Service Item Listing";
                break;
            case "SERVICEITEMVIEW":
                sTmpPage = "Service Item View";
                break;

            case "STOCKPOINT":
                sTmpPage = "Stock Point Listing";
                break;
            case "STOCKPOINTMASTER":
                sTmpPage = "Stock Point Master";
                break;
            case "STOCKPOINTVIEW":
                sTmpPage = "Stock Point View";
                break;

            case "SUPPLIER":
                sTmpPage = "Supplier Listing";
                break;
            case "SUPPLIERMASTER":
                sTmpPage = "Supplier Master";
                break;
            case "SUPPLIERVIEW":
                sTmpPage = "Supplier View";
                break;

            case "SUPPLIERRATE":
                sTmpPage = "Supplier Rate Listing";
                break;
            case "SUPPLIERRATEMASTER":
                sTmpPage = "Supplier Rate Master";
                break;
            case "SUPPLIERRATEVIEW":
                sTmpPage = "Supplier Rate View";
                break;

            case "USERLIST":
                sTmpPage = "User Listing";
                break;
            case "USERMASTER":
                sTmpPage = "User Master";
                break;
            case "USERMASTERVIEW":
                sTmpPage = "User View";
                break;

            case "COMPANY":
                sTmpPage = "Company Listing";
                break;
            case "COMPANYADMIN":
                sTmpPage = "Company Master";
                break;
            case "COMPANYVIEW":
                sTmpPage = "Company View";
                break;

            case "GOODSRECEIPTNOLIST":
                sTmpPage = "Goods Receipt Note Listing";
                break;
            case "GoodsReceiptNoMaster":
                sTmpPage = "Goods Receipt Note Master";
                break;
            case "GOODSRECEIPTNOTEVIEW":
                sTmpPage = "Goods Receipt Note View";
                break;
            case "GOODSRECEIPTNOCANCEL":
                sTmpPage = "Goods Receipt Note Cancel";
                break;

            case "PROFORMAINVOICE":
                sTmpPage = "Proforma Invoice Listing";
                break;
            case "PROFORMAINVOICETRANSACTION":
                sTmpPage = "Proforma Invoice Master";
                break;
            case "PROFORMAINVOICEVIEW":
                sTmpPage = "Proforma Invoice View";
                break;
        }
        refPage.Title = sTmpPage;
    }
    #endregion

    #region PopulateCombo
    public static void PopulateCombo(SqlDataReader oDr,System.Web.UI.WebControls.DropDownList ddlCom,string DataTextField1, string DataTextField2, string DataValueField, string Initialtext)
    {
        #region info
        //THIS FUNCTION WILL POPULATE COMBO WITH DATA FROM DATABASE
        #endregion
        string sTempText = "", sTempValue = "";
        ddlCom.Items.Clear();

        if (Initialtext.Trim() == "")
        {
            ddlCom.Items.Add(new ListItem("--Select One--", System.DBNull.Value.ToString()));
        }
        else
        {
            ddlCom.Items.Add(new ListItem(Initialtext.Trim(), System.DBNull.Value.ToString()));
        }

        while (oDr.Read())
        {
            if (DataTextField2.Trim() != "")
            {
                sTempText = oDr[DataTextField1.ToString()] + " [" + oDr[DataTextField2.ToString()] + "]";
                sTempValue = oDr[DataValueField.ToString()].ToString();
                ddlCom.Items.Add(new ListItem(sTempText, sTempValue));
            }
            else
            {
                sTempText = oDr[DataTextField1.ToString()].ToString();
                sTempValue = oDr[DataValueField.ToString()].ToString();
                ddlCom.Items.Add(new ListItem(sTempText, sTempValue));
            }
        }

        if (!oDr.IsClosed)
        {
            oDr.Close();
        }
    }
    #endregion

    #region SetComboValue
    public static void SetComboValue(System.Web.UI.WebControls.DropDownList ddlCombo, string sValue, string ComboPopulateType)
    {
        #region Notes
        //THIS WILL SET VALUE FOR A COMBO
        #endregion

        int i=0;
        ddlCombo.SelectedIndex = -1;
        if (ComboPopulateType.ToUpper() == "MANUAL")
        {
            for (i = 0; i <= ddlCombo.Items.Count - 1; i++)
            {
                if (ddlCombo.Items[i].Value.Trim() == sValue.Trim())
                {
                    ddlCombo.Items[i].Selected = true;
                    break;
                }
            }
        }
        else if (ComboPopulateType.ToUpper() == "AUTOMATIC")
        {
            ddlCombo.Items.FindByValue(sValue).Selected = true;
        }
    }
    #endregion

    

    #region FindControlRecursive
    #region Notes
    //THIS WILL FIND CONTROL IN A CONTAINER OF THE PAGE AND RETURN CONTROL REFERENCE
    #endregion

    public static Control FindControlRecursive(Control Root, string Id)
    {
        if (Root.ID == Id)
            return Root;

        foreach (Control Ctl in Root.Controls)
        {
            Control FoundCtl = FindControlRecursive(Ctl, Id);
            if (FoundCtl != null)
                return FoundCtl;
        }
        return null;
    }
    #endregion

    public static DataSet ConvertDataReaderToDataSet(SqlDataReader reader)
    {
        DataSet dataSet = new DataSet();
        do
        {
            DataTable schemaTable = reader.GetSchemaTable();
            DataTable dataTable = new DataTable();
            if (schemaTable != null)
            {
                for (int i = 0; i < schemaTable.Rows.Count; i++)
                {
                    DataRow dataRow = schemaTable.Rows[i];
                    string columnName = (string)dataRow["ColumnName"]; 
                    DataColumn column = new DataColumn(columnName, (Type)dataRow["DataType"]);
                    dataTable.Columns.Add(column);
                }
                dataSet.Tables.Add(dataTable);

                while (reader.Read())
                {
                    DataRow dataRow = dataTable.NewRow();
                    for (int i = 0; i < reader.FieldCount; i++)
                        dataRow[i] = reader.GetValue(i);

                    dataTable.Rows.Add(dataRow);
                }
            }
            else
            {
                DataColumn column = new DataColumn("RowsAffected");
                dataTable.Columns.Add(column);
                dataSet.Tables.Add(dataTable);
                DataRow dataRow = dataTable.NewRow();
                dataRow[0] = reader.RecordsAffected;
                dataTable.Rows.Add(dataRow);
            }
        }
        while (reader.NextResult());
        return dataSet;
    }
}
