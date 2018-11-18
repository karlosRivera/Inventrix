


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


public partial class Transactions_JobDetailsTrn : BasePage
{


    #region Global Variable
    
    #endregion

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("JobDetailsTrn.aspx");
        }
        CheckQString();

        if (!IsPostBack)
        {

            PopulateCombo(this.ddCustomer, "CustomerName", "CustomerID", "MstCustomer_Select");

            if (Request["Action"] == "A")
            {
                lblTitle.Text = "Add New Job Details";
                BindGrid(0);
            }
            else
            {
                lblTitle.Text = "Modify Job Details";
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

        oSqlDataReader = BLL.Transaction.JobDetails.FetchData(objArr, "TrnJobDetails_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {


                if (oSqlDataReader["JobNo"] != DBNull.Value)
                {
                    this.txtJobNo.Text = oSqlDataReader["JobNo"].ToString();
                }

                if (oSqlDataReader["JobStartDate"] != DBNull.Value)
                {
                    this.txtJobStartDate.Date = Convert.ToDateTime(oSqlDataReader["JobStartDate"].ToString());
                }

                if (oSqlDataReader["CustomerName"] != DBNull.Value)
                {
                    this.txtCustomerName.Text = oSqlDataReader["CustomerName"].ToString();
                }


                if (oSqlDataReader["CustomerID"] != DBNull.Value)
                {
                    this.ddCustomer.SelectedIndex = -1;
                    this.ddCustomer.Items.FindByValue(oSqlDataReader["CustomerID"].ToString()).Selected = true;
                }

                if (oSqlDataReader["Remarks"] != DBNull.Value)
                {
                    this.txtRemarks.Text = oSqlDataReader["Remarks"].ToString();
                }

                if (oSqlDataReader["JobAddress"] != DBNull.Value)
                {
                    this.txtJobAddress.Text = oSqlDataReader["JobAddress"].ToString();
                }

                if (oSqlDataReader["JobCity"] != DBNull.Value)
                {
                    this.txtJobCity.Text = oSqlDataReader["JobCity"].ToString();
                }

                if (oSqlDataReader["JobPin"] != DBNull.Value)
                {
                    this.txtJobPin.Text = oSqlDataReader["JobPin"].ToString();
                }

                if (oSqlDataReader["LabWorkTotal"] != DBNull.Value)
                {
                    this.txtJobSubTotal.Text = oSqlDataReader["LabWorkTotal"].ToString();
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

                if (oSqlDataReader["WorkDate"] != DBNull.Value)
                {
                    ((GrayMatterSoft.GMDatePicker)dgList.Items[i].FindControl("txtWorkDate")).Date = Convert.ToDateTime(oSqlDataReader["WorkDate"].ToString());
                }

                if (oSqlDataReader["LabourCategoryID"] != DBNull.Value)
                {
                    ((DropDownList)dgList.Items[i].FindControl("ddLabourCategory")).SelectedIndex = -1;
                    ((DropDownList)dgList.Items[i].FindControl("ddLabourCategory")).Items.FindByValue(oSqlDataReader["LabourCategoryID"].ToString()).Selected = true;
                }

                if (oSqlDataReader["LabourRate"] != DBNull.Value)
                {
                    ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text = oSqlDataReader["LabourRate"].ToString();
                }

                if (oSqlDataReader["NoOfLabour"] != DBNull.Value)
                {
                    ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtNoOfLabour")).Text = oSqlDataReader["NoOfLabour"].ToString();
                }

                if (oSqlDataReader["WorkHour"] != DBNull.Value)
                {
                    ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtWorkingHour")).Text = oSqlDataReader["WorkHour"].ToString();
                }

                if (oSqlDataReader["LabourAmt"] != DBNull.Value)
                {
                    ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text = oSqlDataReader["LabourAmt"].ToString();
                }
                i++;
            }
        }
        oSqlDataReader.Close();



    }
    #endregion

    # region PopulateCombo
    private void PopulateCombo(DropDownList ddControl, string FieldName, string FieldID, string spName)
    {
        SqlDataReader oDr;
        ArrayList objArrVal = new ArrayList();

        objArrVal.Add("");
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

        oDr = BLL.Transaction.JobDetails.GetComboData(spName, objArrVal);
        ddControl.Items.Clear();
        ddControl.Items.Add(new ListItem("-- Select --", "-1"));
        while (oDr.Read())
        {
            ddControl.Items.Add(new ListItem((string)(oDr[FieldName]), (string)(oDr[FieldID])));
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
        tbl.Columns.Add("WorkDate");
        tbl.Columns.Add("Rate");
        tbl.Columns.Add("NoOfLabour");
        tbl.Columns.Add("WorkingHour");
        tbl.Columns.Add("Amount");

        for (i = 0; i < iRows; i++)
        {
            nRow = tbl.NewRow();
            nRow["WorkDate"] = "";
            nRow["Rate"] = "0.0";
            nRow["NoOfLabour"] = "0";
            nRow["WorkingHour"] = "0.00";
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
        string[] strValue = new string[5];
        DataRow dr;
        ArrayList arrLstCmb = new ArrayList();
        ArrayList arrLstChk = new ArrayList();
        DataSet ds = ((DataSet)(ViewState["data"]));
        ds.Tables[0].Rows.Clear();
        string sLabourCategoryVal = "";

        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (sAction == "A")
            {
                sLabourCategoryVal = ((DropDownList)(dgList.Items[i].FindControl("ddLabourCategory"))).SelectedItem.Value.ToString();
                arrLstCmb.Add(sLabourCategoryVal);
                arrLstChk.Add((((CheckBox)(dgList.Items[i].FindControl("chkSelect"))).Checked == true ? "1" : "0"));

                strValue[0] = ((GrayMatterSoft.GMDatePicker)(dgList.Items[i].FindControl("txtWorkDate"))).Date.ToShortDateString();
                strValue[1] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtRate"))).Text;
                strValue[2] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtNoOfLabour"))).Text;
                strValue[3] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtWorkingHour"))).Text;
                strValue[4] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtAmount"))).Text;

                dr = ds.Tables[0].NewRow();
                for (j = 0; j <= 4; j++)
                {
                    dr[j] = strValue[j].ToString();
                }
                ds.Tables[0].Rows.Add(dr);
            }
            else if (sAction == "D")
            {
                if (iRow != i)
                {
                    sLabourCategoryVal = ((DropDownList)(dgList.Items[i].FindControl("ddLabourCategory"))).SelectedItem.Value.ToString();
                    arrLstCmb.Add(sLabourCategoryVal);
                    arrLstChk.Add((((CheckBox)(dgList.Items[i].FindControl("chkSelect"))).Checked == true ? "1" : "0"));

                    strValue[0] = ((GrayMatterSoft.GMDatePicker)(dgList.Items[i].FindControl("txtWorkDate"))).Date.ToShortDateString();
                    strValue[1] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtRate"))).Text;
                    strValue[2] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtNoOfLabour"))).Text;
                    strValue[3] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtWorkingHour"))).Text;
                    strValue[4] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtAmount"))).Text;


                    dr = ds.Tables[0].NewRow();
                    for (j = 0; j <= 4; j++)
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
            dr["WorkDate"] = "";
            dr["Rate"] = "0";
            dr["NoOfLabour"] = "0";
            dr["Amount"] = "0";
            ds.Tables[0].Rows.Add(dr);
        }

        ViewState["data"] = ds;
        BindGrid(0);
        for (i = 0; i <= arrLstCmb.Count - 1; i++)
        {
            ((DropDownList)(dgList.Items[i].FindControl("ddLabourCategory"))).SelectedIndex = -1;
            if (arrLstCmb[i].ToString().Trim() != string.Empty)
            {
                ((DropDownList)(dgList.Items[i].FindControl("ddLabourCategory"))).Items.FindByValue(arrLstCmb[i].ToString()).Selected = true;
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

        string sWorkDate = "", sLabID = "", sRate = "", sLabNo = "",sWorkingHour="", sAmount = "";
        int i = 0;
        DataTable tbl = new DataTable();
        tbl.TableName = "JobDetails";
        DataRow dr = null;

        tbl.Columns.Add("LabCategoryID");
        tbl.Columns.Add("WorkDate");
        tbl.Columns.Add("Rate");
        tbl.Columns.Add("NoOfLabour");
        tbl.Columns.Add("WorkHour");
        tbl.Columns.Add("Amount");

 
        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (((CheckBox)dgList.Items[i].FindControl("chkSelect")).Checked)
            {

                if (((DropDownList)dgList.Items[i].FindControl("ddLabourCategory")).Text.Trim() != DBNull.Value.ToString())
                {
                    sLabID = ((DropDownList)dgList.Items[i].FindControl("ddLabourCategory")).SelectedValue.ToString();
                }

                if (((GrayMatterSoft.GMDatePicker)dgList.Items[i].FindControl("txtWorkDate")).Date.ToShortDateString() != DBNull.Value.ToString())
                {
                    sWorkDate = ((GrayMatterSoft.GMDatePicker)dgList.Items[i].FindControl("txtWorkDate")).Date.ToShortDateString();
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim() != "")
                {
                    sRate = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim();
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtNoOfLabour")).Text.Trim() != "")
                {
                    sLabNo = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtNoOfLabour")).Text.Trim();
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtWorkingHour")).Text.Trim() != "")
                {
                    sWorkingHour = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtWorkingHour")).Text.Trim();
                }


                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text.Trim() != "")
                {
                    sAmount = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text.Trim();
                }

                dr = tbl.NewRow();
                dr["LabCategoryID"] = sLabID;
                dr["WorkDate"] = sWorkDate;
                dr["Rate"] = sRate;
                dr["NoOfLabour"] = sLabNo;
                dr["WorkHour"] = sWorkingHour;
                dr["amount"] = sAmount;
                tbl.Rows.Add(dr);
            }
        }

        DataSet oDS = new DataSet();
        oDS.Tables.Add(tbl);
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
                if (Request["Action"] == "A")
                {
                    objArr.Add("");
                }
                else
                {
                    objArr.Add(this.txtJobNo.Text);
                }

                objArr.Add(this.txtJobStartDate.Date.ToShortDateString().Trim());
                objArr.Add(this.ddCustomer.SelectedValue.Trim());
                objArr.Add(this.txtCustomerName.Text.Trim());
                objArr.Add(this.txtRemarks.Text.Trim());
                objArr.Add(this.txtJobAddress.Text.Trim());
                objArr.Add(this.txtJobCity.Text.Trim());
                objArr.Add(this.txtJobPin.Text.Trim());
                objArr.Add(this.txtJobSubTotal.Text.Trim());

                objArr.Add(BuildXmlForDetail());

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

                object tmpMsg = BLL.Transaction.JobDetails.Operate(objArr, Request["Action"].ToString());
                Response.Redirect("JobDetailsView.aspx?Action=V&ID=" + tmpMsg.ToString());
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

        if (this.txtJobStartDate.Date.ToShortDateString().ToString().Trim() == "")
        {
            sMsg = "Please Job Start Date";
            return sMsg;
        }

        if (Convert.ToInt32(this.ddCustomer.SelectedValue) == -1)
        {
            sMsg = "Please Select Customer";
            return sMsg;
        }

        if (this.txtJobAddress.Text.Trim() == "")
        {
            sMsg = "Please Give Job Address";
            return sMsg;
        }

        if (this.txtJobCity.ToString() == "")
        {
            sMsg = "Please Give Job City";
            return sMsg;
        }

        if (this.txtJobPin.Text.Trim() == "")
        {
            sMsg = "Please Job Start Date";
            return sMsg;
        }


        bool flag = true;
        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (((CheckBox)dgList.Items[i].FindControl("chkSelect")).Checked)
            {


                if (((DropDownList)dgList.Items[i].FindControl("ddLabourCategory")).SelectedValue == DBNull.Value.ToString())
                {
                    sMsg = "Error in row: " + (i + 1) + " Please select Labour Category";
                    flag = false;
                    return sMsg;
                }

                if (((GrayMatterSoft.GMDatePicker)dgList.Items[i].FindControl("txtWorkDate")).Date.ToShortDateString() == DBNull.Value.ToString())
                {
                    sMsg = "Error in row: " + (i + 1) + " Please give Job Start Date";
                    flag = false;
                    return sMsg;
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim() == "")
                {
                    sMsg = "Error in row: " + (i + 1) + " Rate should be minimum 0";
                    flag = false;
                    return sMsg;
                }


                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtNoOfLabour")).Text.Trim() == "")
                {
                    sMsg = "Error in row: " + (i + 1) + "Please Give Number Of Labour";
                    flag = false;
                    return sMsg;
                }


                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtWorkingHour")).Text.Trim() == "")
                {
                    sMsg = "Error in row: " + (i + 1) + "Please Give Working Hour";
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
                    int rowid = int.Parse(e.Item.Cells[1].Text);
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
            e.Item.Cells[1].Text = Convert.ToString(e.Item.DataSetIndex + 1);
            PopulateCombo(((System.Web.UI.WebControls.DropDownList)e.Item.FindControl("ddLabourCategory")), "LabourCategoryName", "LabourCategoryID", "MstLabourCategory_Select");
            ((eWorld.UI.NumericBox)e.Item.FindControl("txtNoOfLabour")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
            ((eWorld.UI.NumericBox)e.Item.FindControl("txtWorkingHour")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
        }
    }
    #endregion

    # region ddLabourCategory_SelectedIndexChanged
    protected void ddLabourCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        #region INFO
        //HERE WE CAPTURE SELECTED INDEX CANGE OF A DROPDOWN IN A DATAGRID
        #endregion

        int idgRow = ((DataGridItem)((DropDownList)sender).Parent.Parent).ItemIndex;
        string sLabourCategoryID = ((DropDownList)sender).SelectedValue.ToString();
        if (sLabourCategoryID.Trim() != "")
        {
            SqlDataReader oSqlDataReader = null;
            ArrayList objArr = new ArrayList();

            if (sLabourCategoryID != Convert.ToString("-1"))
            {
                objArr.Add(sLabourCategoryID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

                oSqlDataReader = BLL.Transaction.JobDetails.FetchData(objArr, "MstLabourCategory_Select");

                while (oSqlDataReader.Read())
                {
                    if (oSqlDataReader["HourlyRate"] != DBNull.Value)
                    {
                        ((TextBox)dgList.Items[idgRow].FindControl("txtRate")).Text = oSqlDataReader["HourlyRate"].ToString();
                    }
                }
                oSqlDataReader.Close();
            }
            else
            {
                ((TextBox)dgList.Items[idgRow].FindControl("txtRate")).Text = "";
            }
        }
        EmitTotalRows();
        EmitScript();
    }
    # endregion

}
