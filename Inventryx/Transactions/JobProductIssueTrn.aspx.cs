
# region DEVELOPED BY
//This Transaction is developed by Indranil Roy
# endregion


using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public partial class Transactions_JobProductIssueTrn :BasePage
{

    #region Global Variable
        decimal dTotalAmt = 0;
    #endregion

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("JobProductIssueTrn.aspx");
        }
        CheckQString();
        if (!IsPostBack)
        {

            PopulateCombo(this.ddJobNo, "JobNo", "JobNo", "TrnJobDetails_Select", "T", "");

            if (Request["Action"] == "A")
            {
                lblTitle.Text = "Add New Job Product Issue Details";
                BindGrid(0);
            }
            else
            {
                lblTitle.Text = "Modify Job Product Issue Details";
                LoadData(Request["ID"]);
            }
            EmitTotalRows();
        }
    }
    #endregion

    #region EmitTotalRows
    private void EmitTotalRows()
    {
        #region Info
        //THIS FUNCTION REGISTER A HIDDENFIELD IN A PAGE FROM SERVER SIDE
        //THE HIDDENFIELD HOLD THE NO OF ROWS OF GRID AND FROM THE
        //JAVASCRIPT WE READ THE NO OF ROWS FOR ITERATION IN TEXTBOXES IN A GRID FOR CALCULATION
        #endregion

        int i = 0, iRow = 0;
        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (dgList.Items[i].ItemType == ListItemType.AlternatingItem || dgList.Items[i].ItemType == ListItemType.Item)
            {
                iRow = iRow + 1;
            }
        }
        this.ClientScript.RegisterHiddenField("hdnTotalRows", iRow.ToString());
    }
    #endregion

    #region EmitScript
    private void EmitScript()
    {
        #region Info
        //THIS FUNCTION WILL EMIT A JAVASCRIPT FUNCTION CALL FROM THE CODEBEHIND
        #endregion

        string sScript = "<script language='javascript'>";
        sScript = sScript + "CalculateTotalAmount();";
        sScript = sScript + "</script>";
        this.ClientScript.RegisterStartupScript(typeof(Page), "strScript", sScript);
    }
    #endregion

    #region LoadData
    public void LoadData(string JobNo)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        int iRows = 0;
        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        ViewState["JobNo"] = JobNo;
        objArr.Add(JobNo);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
        objArr.Add("E");

        oSqlDataReader = BLL.Transaction.JobDetails.FetchData(objArr, "TrnJobProductIssue_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                this.ddJobNo.SelectedIndex=-1;
                this.ddJobNo.Items.FindByValue(JobNo).Selected=true;

                if (oSqlDataReader["JobStartDate"] != DBNull.Value)
                {
                    this.lblJobStartDate.Text = oSqlDataReader["JobStartDate"].ToString();
                }

                if (oSqlDataReader["CustomerName"] != DBNull.Value)
                {
                    this.lblCustomerName.Text = oSqlDataReader["CustomerName"].ToString();
                }

            }

            oSqlDataReader.NextResult();

            while (oSqlDataReader.Read())
            {
                iRows = Convert.ToInt32(oSqlDataReader["TotalRows"]);
            }
            BindGrid(iRows + 1);
            oSqlDataReader.NextResult();
            int i = 0;


            while (oSqlDataReader.Read())
            {
                ((CheckBox)dgList.Items[i].FindControl("chkSelect")).Checked = true;

                if (oSqlDataReader["JobProductIssueDtlID"] != DBNull.Value)
                {
                    ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtJobProductID")).Text =oSqlDataReader["JobProductIssueDtlID"].ToString();
                }

                if (oSqlDataReader["IssueDate"] != DBNull.Value)
                {
                    ((GrayMatterSoft.GMDatePicker)dgList.Items[i].FindControl("txtIssuekDate")).Date = Convert.ToDateTime(oSqlDataReader["IssueDate"].ToString());
                }

                if (oSqlDataReader["StockPointID"] != DBNull.Value)
                {
                    ((DropDownList)dgList.Items[i].FindControl("ddStockPoint")).SelectedIndex = -1;
                    ((DropDownList)dgList.Items[i].FindControl("ddStockPoint")).Items.FindByValue(oSqlDataReader["StockPointID"].ToString()).Selected = true;
                }

                if (oSqlDataReader["ProductID"] != DBNull.Value)
                {
                    ((DropDownList)dgList.Items[i].FindControl("ddProduct")).SelectedIndex = -1;
                    ((DropDownList)dgList.Items[i].FindControl("ddProduct")).Items.FindByValue(oSqlDataReader["ProductID"].ToString()).Selected = true;
                }

                if (oSqlDataReader["Rate"] != DBNull.Value)
                {
                    ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text = oSqlDataReader["Rate"].ToString();
                }

                if (oSqlDataReader["BalanceStockQty"] != DBNull.Value)
                {
                    ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtBalanceQty")).Text = oSqlDataReader["BalanceStockQty"].ToString();
                }

                if (oSqlDataReader["IssueQty"] != DBNull.Value)
                {
                    ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtIssueQty")).Text = oSqlDataReader["IssueQty"].ToString();
                }

                if (oSqlDataReader["ProductAmt"] != DBNull.Value)
                {
                    ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text = oSqlDataReader["ProductAmt"].ToString();
                }

                dTotalAmt = dTotalAmt + Convert.ToDecimal(oSqlDataReader["ProductAmt"]);

                i++;
            }
        }

        this.txtProductTotal.Text = dTotalAmt.ToString();
        oSqlDataReader.Close();

     }
    #endregion

    # region PopulateCombo
    private void PopulateCombo(DropDownList ddControl, string FieldName, string FieldID, string spName,string sTrack,string sModule)
    {
        SqlDataReader oDr;
        ArrayList objArrVal = new ArrayList();

        if (sTrack == "M")
        {
            if (sModule == "StockPoint")
            {
                objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                objArrVal.Add("V");
            }
            else if (sModule == "Product")
            {
                objArrVal.Add("");
                objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            }

        }
        else
        {
            objArrVal.Add("");
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
            objArrVal.Add("");
        }

        oDr = BLL.Transaction.JobProductIssueDetails.GetComboData(spName, objArrVal);
        ddControl.Items.Clear();
        ddControl.Items.Add(new ListItem("-- Select --", "-1"));
        int iCnt = 0;
        while (oDr.Read())
        {
            ddControl.Items.Add(new ListItem((string)(oDr[FieldName]), (string)(oDr[FieldID])));
            iCnt+=1;
        }
        if (!oDr.IsClosed)
        { oDr.Close(); }
    }
    # endregion

    #region BindGrid
    private void BindGrid(int rows)
    {
        #region Info
        //THIS FUNCTION WILL BIND THE GRID FROM THE DATASET
        #endregion

        DataSet ds = null;
        if (ViewState["data"] == null)
        {
            CreateDataSet(rows);
        }
        ds = ((DataSet)ViewState["data"]);
        dgList.DataSource = ds.Tables[0];
        dgList.DataBind();
    }
    #endregion

    #region CreateDataSet
    private void CreateDataSet(int rows)
    {
        #region Info
        //THIS FUNCTION WILL CREATE DATASET HERE
        #endregion

        DataSet ds = new DataSet();
        ds.Tables.Add(GetBlankTable(rows));
        ViewState["data"] = ds;
    }
    #endregion

    #region GetBlankTable
    private DataTable GetBlankTable(int rows)
    {
        #region Info
        //THIS FUNCTION CREATE A DATATABLE WITH EMPTY ROWS
        #endregion

        int i = 0;
        int iRows = 0;
        if (rows <= 0)
        {
            iRows = 5;
        }
        else
        {
            iRows = rows;
        }

        DataTable tbl = new DataTable();
        DataRow nRow = null;
        tbl.Columns.Add("JobProductIssueDtlID");
        tbl.Columns.Add("IssueDate");
        tbl.Columns.Add("Rate");
        tbl.Columns.Add("BalanceQty");
        tbl.Columns.Add("IssueQty");
        tbl.Columns.Add("Amount");

        for (i = 0; i < iRows; i++)
        {
            nRow = tbl.NewRow();
            nRow["JobProductIssueDtlID"] = "";
            nRow["IssueDate"] = "";
            nRow["Rate"] = "0.00";
            nRow["BalanceQty"] = "0.000";
            nRow["IssueQty"] = "0.000";
            nRow["Amount"] = "0.00";
            tbl.Rows.Add(nRow);
        }
        return tbl;
    }
    #endregion

    #region Populate
    private void Populate(int iRow, string sAction)
    {
        #region Info
        //THIS FUNCTION WILL HELP US TO INSERT A EMPTY NEW ROW AND DELETE EXISTING ROW
        #endregion

        int i;
        int j;
        string[] strValue = new string[6];
        DataRow dr;
        ArrayList arrLstCmbProduct = new ArrayList();
        ArrayList arrLstCmbStockPoint = new ArrayList();
        ArrayList arrLstChk = new ArrayList();
        DataSet ds = ((DataSet)(ViewState["data"]));
        ds.Tables[0].Rows.Clear();
        string sStockPointVal = "",sProductVal="";


        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (sAction == "A")
            {
                sStockPointVal = ((DropDownList)(dgList.Items[i].FindControl("ddStockPoint"))).SelectedItem.Value.ToString();
                arrLstCmbStockPoint.Add(sStockPointVal);

                sProductVal = ((DropDownList)(dgList.Items[i].FindControl("ddProduct"))).SelectedItem.Value.ToString();
                arrLstCmbProduct.Add(sProductVal);

                arrLstChk.Add((((CheckBox)(dgList.Items[i].FindControl("chkSelect"))).Checked == true ? "1" : "0"));

                strValue[0] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtJobProductID"))).Text;
                strValue[1] = ((GrayMatterSoft.GMDatePicker)(dgList.Items[i].FindControl("txtIssuekDate"))).Date.ToShortDateString();
                strValue[2] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtRate"))).Text;
                strValue[3] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtBalanceQty"))).Text;
                strValue[4] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtIssueQty"))).Text;
                strValue[5] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtAmount"))).Text;

                dr = ds.Tables[0].NewRow();
                for (j = 0; j <= 5; j++)
                {
                    dr[j] = strValue[j].ToString();
                }
                ds.Tables[0].Rows.Add(dr);
            }
            else if (sAction == "D")
            {
                if (iRow != i)
                {
                    sStockPointVal = ((DropDownList)(dgList.Items[i].FindControl("ddStockPoint"))).SelectedItem.Value.ToString();
                    arrLstCmbStockPoint.Add(sStockPointVal);

                    sProductVal = ((DropDownList)(dgList.Items[i].FindControl("ddProduct"))).SelectedItem.Value.ToString();
                    arrLstCmbProduct.Add(sProductVal);

                    arrLstChk.Add((((CheckBox)(dgList.Items[i].FindControl("chkSelect"))).Checked == true ? "1" : "0"));

                    strValue[0] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtJobProductID"))).Text;
                    strValue[1] = ((GrayMatterSoft.GMDatePicker)(dgList.Items[i].FindControl("txtIssuekDate"))).Date.ToShortDateString();
                    strValue[2] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtRate"))).Text;
                    strValue[3] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtBalanceQty"))).Text;
                    strValue[4] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtIssueQty"))).Text;
                    strValue[5] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtAmount"))).Text;
                    


                    dr = ds.Tables[0].NewRow();
                    for (j = 0; j <= 5; j++)
                    {
                        dr[j] = strValue[j].ToString();
                    }
                    ds.Tables[0].Rows.Add(dr);
                }
            }
        }

        if (sAction == "A")
        {
            dr = ds.Tables[0].NewRow();
            dr["JobProductIssueDtlID"] = "";
            dr["IssueDate"] = "";
            dr["Rate"] = "0.00";
            dr["BalanceQty"] = "0.000";
            dr["IssueQty"] = "0.000";
            dr["Amount"] = "0.00";
            ds.Tables[0].Rows.Add(dr);
        }

        ViewState["data"] = ds;
        BindGrid(0);

        for (i = 0; i <= arrLstCmbStockPoint.Count - 1; i++)
        {
            ((DropDownList)(dgList.Items[i].FindControl("ddStockPoint"))).SelectedIndex = -1;
            if (arrLstCmbStockPoint[i].ToString().Trim() != string.Empty)
            {
                ((DropDownList)(dgList.Items[i].FindControl("ddStockPoint"))).Items.FindByValue(arrLstCmbStockPoint[i].ToString()).Selected = true;
            }
        }

        for (i = 0; i <= arrLstCmbProduct.Count - 1; i++)
        {
            ((DropDownList)(dgList.Items[i].FindControl("ddProduct"))).SelectedIndex = -1;
            if (arrLstCmbProduct[i].ToString().Trim() != string.Empty)
            {
                ((DropDownList)(dgList.Items[i].FindControl("ddProduct"))).Items.FindByValue(arrLstCmbProduct[i].ToString()).Selected = true;
            }
        }

        for (i = 0; i <= arrLstChk.Count - 1; i++)
        {
            if (arrLstChk[i].ToString() == "1")
            {
                ((CheckBox)(dgList.Items[i].FindControl("chkSelect"))).Checked = true;
            }
            else
            {
                ((CheckBox)(dgList.Items[i].FindControl("chkSelect"))).Checked = false;
            }
        }
    }
    #endregion

    #region BuildXmlForDetail
    private string BuildXmlForDetail()
    {
        #region INFO
        //THIS FUNCTION WILL GENERATE AND RETURN XML FOR DETAIL GRID PORTION
        #endregion

        string sIssueDate = "", sBalanceQty = "", sIssueQty = "", sRate = "";
        string sAmount = "", sStockPointID = "", sProductID="",sJobProductIssueID="";
        int i = 0;
        DataTable tbl = new DataTable();
        tbl.TableName = "ProductIssueDetails";
        DataRow dr = null;

        if (Request["Action"] == "E")
        {
            tbl.Columns.Add("JobProductIssueDtlID");
        }
        tbl.Columns.Add("IssueDate");
        tbl.Columns.Add("StockPointID");
        tbl.Columns.Add("ProductID");
        tbl.Columns.Add("Rate");
        tbl.Columns.Add("BalanceQty");
        tbl.Columns.Add("IssueQty");
        tbl.Columns.Add("Amount");


        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (((CheckBox)dgList.Items[i].FindControl("chkSelect")).Checked)
            {

                if (Request["Action"] == "E")
                {
                    if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtJobProductID")).Text.Trim() != "")
                    {
                        sJobProductIssueID = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtJobProductID")).Text.Trim();
                    }
                }

                if (((GrayMatterSoft.GMDatePicker)dgList.Items[i].FindControl("txtIssuekDate")).Date.ToShortDateString() != DBNull.Value.ToString())
                {
                    sIssueDate = ((GrayMatterSoft.GMDatePicker)dgList.Items[i].FindControl("txtIssuekDate")).Date.ToShortDateString();
                }

                if (((DropDownList)dgList.Items[i].FindControl("ddStockPoint")).Text.Trim() != DBNull.Value.ToString())
                {
                    sStockPointID = ((DropDownList)dgList.Items[i].FindControl("ddStockPoint")).SelectedValue.ToString();
                }

                if (((DropDownList)dgList.Items[i].FindControl("ddProduct")).Text.Trim() != DBNull.Value.ToString())
                {
                    sProductID = ((DropDownList)dgList.Items[i].FindControl("ddProduct")).SelectedValue.ToString();
                }


                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim() != "")
                {
                    sRate = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim();
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtBalanceQty")).Text.Trim() != "")
                {
                    sBalanceQty = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtBalanceQty")).Text.Trim();
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtIssueQty")).Text.Trim() != "")
                {
                    sIssueQty = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtIssueQty")).Text.Trim();
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text.Trim() != "")
                {
                    sAmount = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text.Trim();
                }

                dr = tbl.NewRow();
                if (Request["Action"] == "E")
                {
                    dr["JobProductIssueDtlID"] = sJobProductIssueID;
                }
                dr["IssueDate"] = sIssueDate;
                dr["StockPointID"] = sStockPointID;
                dr["ProductID"] = sProductID;
                dr["Rate"] = sRate;
                dr["BalanceQty"] = sBalanceQty;
                dr["IssueQty"] = sIssueQty;
                dr["amount"] = sAmount;
                tbl.Rows.Add(dr);
            }
        }

        DataSet oDS = new DataSet();
        oDS.Tables.Add(tbl);
        string sXML = oDS.GetXml();
        return oDS.GetXml().ToString();
    }
    #endregion

    #region btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region INFO
        // THIS FUNCTION WILL ACTUALLY INSERT DATA AND UPDATE DATA IN THE TABLE THROUGH STORE PROCEDURE
        #endregion
        EmitTotalRows();
        EmitScript();

        if (Request["Action"] == "A" || Request["Action"] == "E")
        {
            string sMsg;
            sMsg = ValidateInput();
            if (sMsg == "")
            {
                ArrayList objArr = new ArrayList();
                objArr.Add(this.ddJobNo.SelectedValue.ToString());
                objArr.Add(this.txtProductTotal.Text.Trim());
                objArr.Add(BuildXmlForDetail());

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);


                object tmpMsg = BLL.Transaction.JobProductIssueDetails.Operate(objArr, Request["Action"].ToString());
                Response.Redirect("JobProductIssueView.aspx?Action=V&ID=" + tmpMsg.ToString());
            }
            else
            {
                Utility.ShowMessage(this, sMsg);
            }
        }
    }
    #endregion

    #region ValidateInput
    private string ValidateInput()
    {
        #region INFO
        //THIS FUNCTION WILL VALIDATE DATA BEFORE INSERTING OR UPDATION DATA TO THE TABLE
        #endregion
        int i = 0;
        string sMsg = "";
        decimal dBalanceQty = 0, dIssueQty = 0;
        bool flag = true;
        bool flagchk = false;

        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (((CheckBox)dgList.Items[i].FindControl("chkSelect")).Checked)
            {
                flagchk = true;

                if (Request["Action"] == "E")
                {
                    if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtJobProductID")).Text.Trim() == "")
                    {
                        sMsg = "Error in row: " + (i + 1) + " There should be Job Product Issue ID";
                        flag = false;
                        return sMsg;
                    }
                }

                if (((GrayMatterSoft.GMDatePicker)dgList.Items[i].FindControl("txtIssuekDate")).Date.ToShortDateString() == DBNull.Value.ToString())
                {
                    sMsg = "Error in row: " + (i + 1) + " Please give Job Issue Date";
                    flag = false;
                    return sMsg;
                }

                if (((DropDownList)dgList.Items[i].FindControl("ddStockPoint")).SelectedValue == DBNull.Value.ToString())
                {
                    sMsg = "Error in row: " + (i + 1) + " Please select Stock Point";
                    flag = false;
                    return sMsg;
                }

                if (((DropDownList)dgList.Items[i].FindControl("ddProduct")).SelectedValue == DBNull.Value.ToString())
                {
                    sMsg = "Error in row: " + (i + 1) + " Please select Product";
                    flag = false;
                    return sMsg;
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim() == "")
                {
                    sMsg = "Error in row: " + (i + 1) + " Rate should be minimum 0";
                    flag = false;
                    return sMsg;
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtBalanceQty")).Text.Trim() == "")
                {
                    sMsg = "Error in row: " + (i + 1) + "Please Give Balance Qty.";
                    flag = false;
                    return sMsg;
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtIssueQty")).Text.Trim() == "")
                {
                    sMsg = "Error in row: " + (i + 1) + "Please Give Issue Qty.";
                    flag = false;
                    return sMsg;
                }

                dBalanceQty=Convert.ToDecimal(((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtBalanceQty")).Text.Trim());
                dIssueQty = Convert.ToDecimal(((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtIssueQty")).Text.Trim());

                if (dBalanceQty < dIssueQty)
                {
                    sMsg = "Error in row: " + (i + 1) + "Issue Qty. must be less than Balance Qty.";
                    flag = false;
                    return sMsg;
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text.Trim() == "")
                {
                    sMsg = "Error in row: " + (i + 1) + " Amount should be minimum 0";
                    flag = false;
                    return sMsg;
                }
            }
        }
        if (!flagchk)
            sMsg = "No rows are checked";

        return sMsg;
    }
    #endregion

    #region btnAddNewRow_Click
    protected void btnAddNewRow_Click(object sender, EventArgs e)
    {
        #region btnAddNewRow_Click
        //THIS FUNCTION WILL CALL POPULATE FUNCTION FOR INSERTING A NEW ROW IN A GRID
        //THIS  FUNCTION WILL CALL EmitTotalRows & EmitScript FOR JAVASCRIPT PURPOSE
        #endregion

        Populate(0, "A");
        EmitTotalRows();
        EmitScript();
    }
    #endregion

    #region dgList_ItemCommand
    protected void dgList_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        #region INFO
        //WHENEVER WE CLICK ON DELETE BUTTON THEN THIS dgList_ItemCommand WILL BE CALLED 
        //AND WE CAPTURE THE CLICK ON DELETE BUTTON HERE AND ACCORDINGLY WE REMOVE A PARTICULAR 
        //ROW FROM DATAGRID
        #endregion

        short i = 1;
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            if (e.CommandName == "Del")
            {
                if (dgList.Items.Count - 1 > 0)
                {
                    DataSet ds = (DataSet)ViewState["data"];
                    int rowid = int.Parse(e.Item.Cells[2].Text);
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        if (e.Item.ItemIndex + 1 == rowid)
                        {
                            row.Delete();
                            Populate(e.Item.ItemIndex, "D");
                            break;
                        }
                        i += 1;
                    }
                }
                else
                {
                    DataRow dr;
                    DataSet ds = ((DataSet)(ViewState["data"]));
                    ds.Tables[0].Rows.Clear();
                    dr = ds.Tables[0].NewRow();
                    ds.Tables[0].Rows.Add(dr);
                    BindGrid(0);
                }
            }
        }
        EmitTotalRows();
        EmitScript();
    }
    #endregion

    #region dgList_ItemDataBound
    protected void dgList_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        #region INFO
        //HERE WE SET THE SERIAL NO OF DATAGRID AND ATTACH JAVASCRIPT FUNCTION WITH FEW TEXTBOXES IN 
        //DATAGRID FOR CALCULATION PURPOSE.
        #endregion

        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            e.Item.Cells[2].Text = Convert.ToString(e.Item.DataSetIndex + 1);
            PopulateCombo(((System.Web.UI.WebControls.DropDownList)e.Item.FindControl("ddStockPoint")), "StockPointName", "StockPointID", "MstStockPointName_Select", "M","StockPoint");
            PopulateCombo(((System.Web.UI.WebControls.DropDownList)e.Item.FindControl("ddProduct")), "ProductName", "ProductID", "MstProduct_Select", "M","Product");
            ((eWorld.UI.NumericBox)e.Item.FindControl("txtIssueQty")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
            //((eWorld.UI.NumericBox)e.Item.FindControl("txtWorkingHour")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
        }
    }
    #endregion

    # region ddJobNo_SelectedIndexChanged
    protected void ddJobNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataReader oDr;
        ArrayList objArrVal = new ArrayList();

        objArrVal.Add(this.ddJobNo.SelectedValue.ToString());
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
        objArrVal.Add("");

        oDr = BLL.Transaction.JobProductIssueDetails.FetchData(objArrVal, "TrnJobDetails_Select");
        if (oDr.Read())
        {
            this.lblJobStartDate.Text = oDr["JobStartDate"].ToString();
            this.lblCustomerName.Text = oDr["CustomerName"].ToString();

        }
        if (!oDr.IsClosed)
        { oDr.Close(); }
    }
    # endregion

    # region ddProduct_SelectedIndexChanged
    protected void ddProduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        #region INFO
        //HERE WE CAPTURE SELECTED INDEX CANGE OF A DROPDOWN IN A DATAGRID
        #endregion

        int idgRow = ((DataGridItem)((DropDownList)sender).Parent.Parent).ItemIndex;
        string sProductID = ((DropDownList)sender).SelectedValue.ToString();

        if (sProductID.Trim() != "")
        {
            SqlDataReader oSqlDataReader = null;
            ArrayList objArr = new ArrayList();

            if (sProductID != Convert.ToString("-1"))
            {
                objArr.Add("");
                objArr.Add(sProductID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

                oSqlDataReader = BLL.Transaction.JobProductIssueDetails.FetchData(objArr, "MstProductRate_Select");

                if (oSqlDataReader.Read())
                {
                    if (oSqlDataReader["UnitSaleRate"] != DBNull.Value)
                    {
                        ((TextBox)dgList.Items[idgRow].FindControl("txtRate")).Text = oSqlDataReader["UnitSaleRate"].ToString();
                    }
                }
                else
                { ((TextBox)dgList.Items[idgRow].FindControl("txtRate")).Text = "0.00"; }

                oSqlDataReader.Close();
            }
            else
            {
                ((TextBox)dgList.Items[idgRow].FindControl("txtRate")).Text = "";
            }

            objArr.Clear();
            objArr.Add(sProductID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

            oSqlDataReader = BLL.Transaction.JobProductIssueDetails.FetchData(objArr, "TrnStockInDtl_Select");

            if (oSqlDataReader.Read())
            {
                if (oSqlDataReader["BalanceQty"] != DBNull.Value)
                {
                    ((TextBox)dgList.Items[idgRow].FindControl("txtBalanceQty")).Text = oSqlDataReader["BalanceQty"].ToString();
                }
            }
            else
            {
                ((TextBox)dgList.Items[idgRow].FindControl("txtBalanceQty")).Text = "0.000";
            }
        }


        EmitTotalRows();
        EmitScript();
    }
    # endregion

}
