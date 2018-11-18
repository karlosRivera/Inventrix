

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

public partial class Transactions_ServiceInvoiceTrn : BasePage
{

    #region Global Variable
    string sAddNewRow = "";
    string sDelRow = string.Empty;
    int iCntRow = 0;
    #endregion

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("ServiceInvoiceTrn.aspx");
        }
        CheckQString();
        sAddNewRow = "";
        sDelRow = "";
        if (!IsPostBack)
        {

            PopulateCombo(this.ddJobNo, "JobNo", "JobNo", "TrnJobDetails_Select", "T");

            this.txtVatRate.Attributes.Add("onchange", "CalculateTotalAmount();");
           if (Request["Action"] == "A")
            {
                lblTitle.Text = "Add New Service Invoice Details";
            }
            else
            {
                lblTitle.Text = "Modify Service Invoice Details";
                LoadData(Request["ID"]);
            }
            //EmitTotalRows();
        }
    }
    #endregion

    # region PopulateCombo
    private void PopulateCombo(DropDownList ddControl, string FieldName, string FieldID, string spName, string sTrack)
    {
        SqlDataReader oDr;
        ArrayList objArrVal = new ArrayList();

        if (sTrack == "M")
        {
                objArrVal.Add("");
                objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        }
        else
        {
            objArrVal.Add("");
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
            objArrVal.Add("");
        }

        oDr = BLL.Transaction.ServiceInvoice.GetComboData(spName, objArrVal);
        ddControl.Items.Clear();
        ddControl.Items.Add(new ListItem("-- Select --", "-1"));
        int iCnt = 0;
        while (oDr.Read())
        {
            ddControl.Items.Add(new ListItem((string)(oDr[FieldName]), (string)(oDr[FieldID])));
            iCnt += 1;
        }
        if (!oDr.IsClosed)
        { oDr.Close(); }
    }
    # endregion

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
                    objArr.Add(this.txtInvNo.Text.Trim().ToString());
                }

                objArr.Add(this.txtInvDate.Date.ToShortDateString());
                objArr.Add(this.ddJobNo.SelectedValue.Trim());
                objArr.Add(ViewState["CustomerID"].ToString());
                objArr.Add(this.txtCustomer.Text.Trim().ToString());
                objArr.Add(this.txtBillingAddress.Text.Trim().ToString());
                objArr.Add(this.txtCity.Text.Trim().ToString());
                objArr.Add(this.txtPin.Text.Trim().ToString());
                objArr.Add(this.txtRemarks.Text.Trim());

                objArr.Add(this.txtVatRate.Text.Trim());
                objArr.Add(this.txtVatAmt.Text.Trim());
                objArr.Add(this.txtSubTotal.Text.Trim());
                objArr.Add(this.txtSITotal.Text.Trim());

                objArr.Add(BuildXmlForDetail());


                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

                object tmpMsg = BLL.Transaction.ServiceInvoice.Operate(objArr, Request["Action"].ToString());
                if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
                {
                    Utility.ShowMessage(this, tmpMsg.ToString());
                }
                else
                {
                    Response.Redirect("ServiceInvoiceView.aspx?Action=V&ID=" + tmpMsg.ToString());
                }
            }
            else
            {
                Utility.ShowMessage(this, sMsg);
            }
        }
    }
    #endregion

    #region dgList_ItemDataBound
    protected void dgList_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        #region INFO
        //HERE WE SET THE SERIAL NO OF DATAGRID AND ATTACH JAVASCRIPT FUNCTION WITH FEW TEXTBOXES IN 
        //DATAGRID FOR CALCULATION PURPOSE.
        #endregion

        ArrayList ObjArrVal;
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            DropDownList ddSItem= new DropDownList();
            Label lblSitem = new Label();
            lblSitem = (System.Web.UI.WebControls.Label)(e.Item.FindControl("lblServiceItem"));
            ddSItem = (System.Web.UI.WebControls.DropDownList)(e.Item.FindControl("ddServiceItem"));

            if (e.Item.ItemIndex < (int)(ViewState["iCntRow"]))
            {
                lblSitem.Visible = true;
                ddSItem.Visible = false;
                ((CheckBox)e.Item.FindControl("chkSelect")).Checked = true;
                ((ImageButton)e.Item.FindControl("btnDel")).Visible = false;
            }
            else
            {
                ddSItem.Visible = true;
                lblSitem.Visible = false;
                PopulateCombo(ddSItem, "ServiceItemName", "ServiceItemID", "MstServiceItem_Select", "M");
                if (Request["Action"] == "E" && sAddNewRow!="ANR" &&  sDelRow != "Del")
                {
                    ObjArrVal = (ArrayList)(ViewState["ServiceItemID"]);
                    ddSItem.SelectedIndex = -1;
                    ddSItem.Items.FindByValue(ObjArrVal[e.Item.ItemIndex].ToString()).Selected = true;
                }
            }
            ((eWorld.UI.NumericBox)e.Item.FindControl("txtRate")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
            ((eWorld.UI.NumericBox)e.Item.FindControl("txtQty")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
        }
    }
    #endregion

    # region ddJobNo_SelectedIndexChanged
    protected void ddJobNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataReader oDr;
        ArrayList objArrVal = new ArrayList();
        this.txtCustomer.Text = "";
        objArrVal.Add(this.ddJobNo.SelectedValue.ToString());
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
        objArrVal.Add("");

        oDr = BLL.Transaction.ServiceInvoice.FetchData(objArrVal, "TrnJobDetails_Select");
        if (oDr.Read())
        {
            this.txtCustomer.Text = oDr["CustomerName"].ToString();
            ViewState["CustomerID"] = oDr["CustomerID"].ToString();
        }
        if (!oDr.IsClosed)
        { oDr.Close(); }

        BindGrid();

        EmitTotalRows();
        EmitScript();

    }
    # endregion

    # region BindGrid
    private void BindGrid()
    {
        if (sAddNewRow == "ANR")
        {
            Populate(0,"ANR");
        }
        else
        {
            this.dgList.DataSource = CreateTable();
            this.dgList.DataBind();
        }
    }
    # endregion

    # region btnAddNewRow_Click
    protected void btnAddNewRow_Click(object sender, EventArgs e)
    {
        #region btnAddNewRow_Click
        //THIS FUNCTION WILL CALL POPULATE FUNCTION FOR INSERTING A NEW ROW IN A GRID
        //THIS  FUNCTION WILL CALL EmitTotalRows & EmitScript FOR JAVASCRIPT PURPOSE
        #endregion

        sAddNewRow = "ANR";
        Populate(0,"ANR");
        EmitTotalRows();
        EmitScript();
    }
    # endregion

    # region CreateTable
    private DataTable CreateTable()
    {
        DataTable tbl = new DataTable();
        DataRow nRow = null;
        tbl = CreateColumns();
        SqlDataReader oDr;
        ArrayList objServiceItemID = new ArrayList();
        ArrayList objArrVal = new ArrayList();
        objArrVal.Add(this.ddJobNo.SelectedValue.ToString());

        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

        oDr = BLL.Transaction.ServiceInvoice.FetchData(objArrVal, "TrnInvoiceServiceDtl_Select");
       
        while (oDr.Read())
        {
            nRow = tbl.NewRow();
            nRow["ServiceItemName"] = oDr["ServiceItemName"];
            objServiceItemID.Add(oDr["ServiceItemID"]);
            nRow["Particulars"] = oDr["Particulars"];
            nRow["Rate"] = oDr["Rate"];
            nRow["InvQty"] = oDr["InvQty"];
            nRow["ServiceAmt"] = oDr["ServiceAmt"];
            tbl.Rows.Add(nRow);
            iCntRow += 1;
        }
    
        ViewState["iCntRow"] = iCntRow;
        ViewState["ServiceItemID"] = objServiceItemID;
        ViewState["data"] = tbl;
        return tbl;
    }

    # endregion

    #region Populate
    private void Populate(int iRow,string sAction)
    {
        #region Info
        //THIS FUNCTION WILL HELP US TO INSERT A EMPTY NEW ROW AND DELETE EXISTING ROW
        #endregion

        int i;
        int j;
        string[] strValue = new string[5];
        DataRow dr;
        DataTable dt=new DataTable();
        ArrayList arrLstCmbServiceItem = new ArrayList();
        ArrayList arrLstChk = new ArrayList();
        string sServiceItemVal = "";
        iCntRow = 0;

        dt = CreateColumns();

        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (sAction == "ANR")
            {
                sServiceItemVal = ((DropDownList)(dgList.Items[i].FindControl("ddServiceItem"))).SelectedItem.Value.ToString();
                arrLstCmbServiceItem.Add(sServiceItemVal);

                arrLstChk.Add((((CheckBox)(dgList.Items[i].FindControl("chkSelect"))).Checked == true ? "1" : "0"));

                strValue[0] = ((Label)(dgList.Items[i].FindControl("lblServiceItem"))).Text.ToString();
                strValue[1] = ((TextBox)(dgList.Items[i].FindControl("txtParticulars"))).Text.ToString();
                strValue[2] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtRate"))).Text;
                strValue[3] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtQty"))).Text;
                strValue[4] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtAmount"))).Text;

                dr = dt.NewRow();
                for (j = 0; j <= 4; j++)
                {
                    dr[j] = strValue[j].ToString();
                }
                dt.Rows.Add(dr);
            }
            else if (sAction == "D")
            {
                if (iRow != i)
                {
                    sServiceItemVal = ((DropDownList)(dgList.Items[i].FindControl("ddServiceItem"))).SelectedItem.Value.ToString();
                    arrLstCmbServiceItem.Add(sServiceItemVal);

                    arrLstChk.Add((((CheckBox)(dgList.Items[i].FindControl("chkSelect"))).Checked == true ? "1" : "0"));

                    strValue[0] = ((Label)(dgList.Items[i].FindControl("lblServiceItem"))).Text.ToString();
                    strValue[1] = ((TextBox)(dgList.Items[i].FindControl("txtParticulars"))).Text.ToString();
                    strValue[2] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtRate"))).Text;
                    strValue[3] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtQty"))).Text;
                    strValue[4] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtAmount"))).Text;

                    dr = dt.NewRow();
                    for (j = 0; j <= 4; j++)
                    {
                        dr[j] = strValue[j].ToString();
                    }
                    dt.Rows.Add(dr);
                }
            }
        }


        if (sAction == "ANR")
        {
            dr = dt.NewRow();
            dr["Particulars"] = "";
            dr["Rate"] = "0.00";
            dr["InvQty"] = "0.000";
            dr["ServiceAmt"] = "0.00";
            dt.Rows.Add(dr);
        }

        ViewState["data"] = dt;
        this.dgList.DataSource = dt;
        this.dgList.DataBind();

        for (i = 0; i <= arrLstCmbServiceItem.Count - 1; i++)
        {
            ((DropDownList)(dgList.Items[i].FindControl("ddServiceItem"))).SelectedIndex = -1;
            if (arrLstCmbServiceItem[i].ToString().Trim() != string.Empty)
            {
                ((DropDownList)(dgList.Items[i].FindControl("ddServiceItem"))).Items.FindByValue(arrLstCmbServiceItem[i].ToString()).Selected = true;
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

    # region CreateColumns
    private DataTable CreateColumns()
    {
        DataTable tbl = new DataTable();
        tbl.Columns.Add("ServiceItemName");
        tbl.Columns.Add("Particulars");
        tbl.Columns.Add("Rate");
        tbl.Columns.Add("InvQty");
        tbl.Columns.Add("ServiceAmt");
        return tbl;
           
    }
    # endregion

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

    #region BuildXmlForDetail
    private string BuildXmlForDetail()
    {
        #region INFO
        //THIS FUNCTION WILL GENERATE AND RETURN XML FOR DETAIL GRID PORTION
        #endregion

        string sServiceItemID = "", sParticulars = "", sRate = "", sQty = "", sAmount = "";
        int i = 0;
        ArrayList objServiceItemID = new ArrayList();
        Label objServiceItemlbl = new Label();
        DropDownList objServiceItemdd = new DropDownList();
        DataTable tbl = new DataTable();
        tbl.TableName = "ServiceInvoiceDetails";
        DataRow dr = null;
        tbl.Columns.Add("ServiceItemID");
        tbl.Columns.Add("Particulars");
        tbl.Columns.Add("Rate");
        tbl.Columns.Add("InvQty");
        tbl.Columns.Add("ServiceAmt");


        objServiceItemID = (ArrayList)(ViewState["ServiceItemID"]);

        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
                objServiceItemlbl = (Label)(dgList.Items[i].FindControl("lblServiceItem"));
                objServiceItemdd = (DropDownList)(dgList.Items[i].FindControl("ddServiceItem"));

                if (((CheckBox)dgList.Items[i].FindControl("chkSelect")).Checked)
                {
                    if (objServiceItemlbl.Visible == true)
                    {
                        if (((Label)dgList.Items[i].FindControl("lblServiceItem")).Text.Trim().ToString() != DBNull.Value.ToString())
                        {
                            sServiceItemID = objServiceItemID[i].ToString();
                        }
                    }

                    if (objServiceItemdd.Visible == true)
                    {
                        if (((DropDownList)dgList.Items[i].FindControl("ddServiceItem")).SelectedValue.Trim() != "")
                        {
                            sServiceItemID = ((DropDownList)dgList.Items[i].FindControl("ddServiceItem")).SelectedValue.Trim();
                        }
                    }

                    sParticulars = ((TextBox)dgList.Items[i].FindControl("txtParticulars")).Text.Trim();

                    if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim() != "")
                    {
                        sRate = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim();
                    }

                    if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtQty")).Text.Trim() != "")
                    {
                        sQty = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtQty")).Text.Trim();
                    }

                    if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text.Trim() != "")
                    {
                        sAmount = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text.Trim();
                    }

                    dr = tbl.NewRow();
                    dr["ServiceItemID"] = sServiceItemID;
                    dr["Particulars"] = sParticulars;
                    dr["Rate"] = sRate;
                    dr["InvQty"] = sQty;
                    dr["ServiceAmt"] = sAmount;
                    tbl.Rows.Add(dr);
                }

        }
        DataSet oDS = new DataSet();
        oDS.Tables.Add(tbl);
        string sXML = oDS.GetXml().ToString();
        return oDS.GetXml().ToString();
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

        if (this.txtInvDate.Date.ToShortDateString().ToString().Trim() == "")
        {
            sMsg = "Please give Invoice Date";
            return sMsg;
        }

        if (this.ddJobNo.SelectedValue.ToString().Trim() == "-1")
        {
            sMsg = "Please Select Job No.";
            return sMsg;
        }

        if (this.txtCustomer.Text.ToString().Trim() == "")
        {
            sMsg = "Please give Customer Name";
            return sMsg;
        }

        if (this.txtCity.Text.ToString().Trim() == "")
        {
            sMsg = "Please give City Name";
            return sMsg;
        }

        if (this.txtPin.Text.ToString().Trim() == "")
        {
            sMsg = "Please give Pin Name";
            return sMsg;
        }


        Label objServiceItemlbl = new Label();
        DropDownList objServiceItemdd = new DropDownList();

        bool flag = true;
        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {

                objServiceItemlbl = (Label)(dgList.Items[i].FindControl("lblServiceItem"));
                objServiceItemdd = (DropDownList)(dgList.Items[i].FindControl("ddServiceItem"));

                if (((CheckBox)dgList.Items[i].FindControl("chkSelect")).Checked)
                {
                    if (objServiceItemlbl.Visible == true)
                    {
                        if (((Label)dgList.Items[i].FindControl("lblServiceItem")).Text.Trim().ToString() == "")
                        {
                            sMsg = "Error in row: " + (i + 1) + "There should be Service Item";
                            flag = false;
                            return sMsg;
                        }
                    }

                    if (objServiceItemdd.Visible == true)
                    {
                        if (((DropDownList)dgList.Items[i].FindControl("ddServiceItem")).SelectedValue.Trim() == "-1")
                        {
                            sMsg = "Error in row: " + (i + 1) + "There should be Service Item";
                            flag = false;
                            return sMsg;
                        }
                    }

                    if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim() == "")
                    {
                        sMsg = "Error in row: " + (i + 1) + " Rate should be minimum 0";
                        flag = false;
                        return sMsg;
                    }

                    if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtQty")).Text.Trim() == "")
                    {
                        sMsg = "Error in row: " + (i + 1) + " Qty should be minimum 0";
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

    #region LoadData
    public void LoadData(string InvoiceNo)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();

        Label objServiceItemlbl = new Label();
        DropDownList objServiceItemdd = new DropDownList();
        ArrayList objServiceItemID = new ArrayList();


        objArr.Add(InvoiceNo);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
        objArr.Add("E");

        oSqlDataReader = BLL.Transaction.JobDetails.FetchData(objArr, "TrnServiceInvoice_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["InvoiceNo"] != DBNull.Value)
                {
                    this.txtInvNo.Text = oSqlDataReader["InvoiceNo"].ToString();
                }

                if (oSqlDataReader["InvoiceDate"] != DBNull.Value)
                {
                    this.txtInvDate.Date = Convert.ToDateTime(oSqlDataReader["InvoiceDate"].ToString());
                }

                if (oSqlDataReader["JobNo"] != DBNull.Value)
                {
                    this.ddJobNo.SelectedIndex = -1;
                    this.ddJobNo.Items.FindByValue(oSqlDataReader["JobNo"].ToString()).Selected = true;
                }

                CalculateLWCMCC();

                if (oSqlDataReader["BillingAddress"] != DBNull.Value)
                {
                    this.txtBillingAddress.Text = oSqlDataReader["BillingAddress"].ToString();
                }

                if (oSqlDataReader["BillingCity"] != DBNull.Value)
                {
                    this.txtCity.Text = oSqlDataReader["BillingCity"].ToString();
                }

                if (oSqlDataReader["BillingPin"] != DBNull.Value)
                {
                    this.txtPin.Text = oSqlDataReader["BillingPin"].ToString();
                }

                if (oSqlDataReader["CustomerName"] != DBNull.Value)
                {
                    this.txtCustomer.Text = oSqlDataReader["CustomerName"].ToString();
                }

                if (oSqlDataReader["Remarks"] != DBNull.Value)
                {
                    this.txtRemarks.Text = oSqlDataReader["Remarks"].ToString();
                }

                if (oSqlDataReader["VATRate"] != DBNull.Value)
                {
                    this.txtVatRate.Text = oSqlDataReader["VATRate"].ToString();
                }

                if (oSqlDataReader["VATAmt"] != DBNull.Value)
                {
                    this.txtVatAmt.Text = oSqlDataReader["VATAmt"].ToString();
                }

                if (oSqlDataReader["ProductTotalAmt"] != DBNull.Value)
                {
                    this.txtSubTotal.Text = oSqlDataReader["ProductTotalAmt"].ToString();
                }

                if (oSqlDataReader["InvoiceAmt"] != DBNull.Value)
                {
                    this.txtSITotal.Text = oSqlDataReader["InvoiceAmt"].ToString();
                }
                ViewState["CustomerID"] = oSqlDataReader["CustomerID"].ToString();
                    
            }

            oSqlDataReader.NextResult();

            while (oSqlDataReader.Read())
            {
                objServiceItemID.Add(oSqlDataReader["ServiceItemID"]);
            }
            
            ViewState["ServiceItemID"] = objServiceItemID;

            oSqlDataReader.NextResult();
            ViewState["data"] = CreateDataTable(oSqlDataReader);

            oSqlDataReader.NextResult();
            this.dgList.DataSource = oSqlDataReader;
            this.dgList.DataBind();

            EmitTotalRows();
            EmitScript();

        }
        oSqlDataReader.Close();



    }
    #endregion

    # region dgList_ItemCommand
    protected void dgList_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        #region INFO
        //WHENEVER WE CLICK ON DELETE BUTTON THEN THIS dgList_ItemCommand WILL BE CALLED
        //AND WE CAPTURE THE CLICK ON DELETE BUTTON HERE AND ACCORDINGLY WE REMOVE A PARTICULAR
        //ROW FROM DATAGRID
        #endregion

        short i = 1;
        int rowid=0;

        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            if (e.CommandName == "Del")
            {
                if (dgList.Items.Count - 1 > 0)
                {
                    
                    DataTable dt = (DataTable)ViewState["data"];
                    foreach (DataRow row in dt.Rows)
                    {
                        if (e.Item.ItemIndex == rowid)
                        {
                            row.Delete();
                            sDelRow = "Del";
                            Populate(e.Item.ItemIndex,"D");
                            break;
                        }
                        i += 1;
                        rowid += 1;
                    }
                }
            }
        }
        EmitTotalRows();
        EmitScript();
    }
    # endregion

    # region CreateDataTable
    private DataTable CreateDataTable(SqlDataReader oDr)
    {
        DataTable dt = new DataTable();
        DataRow dr;
        dt = CreateColumns();
        while (oDr.Read())
        {
            dr = dt.NewRow();
            dr["ServiceItemName"] = oDr["ServiceItemName"];
            dr["Particulars"] = oDr["Particulars"];
            dr["Rate"] = oDr["Rate"];
            dr["InvQty"] = oDr["InvQty"];
            dr["ServiceAmt"] = oDr["ServiceAmt"];
            dt.Rows.Add(dr);
        }
        return dt;
    }
    # endregion

    # region CalculateLWCMCC
    private void CalculateLWCMCC()
    {
        ArrayList objArrVal = new ArrayList();
        objArrVal.Add(this.ddJobNo.SelectedValue.ToString());
        SqlDataReader oDr;
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

        oDr = BLL.Transaction.ServiceInvoice.FetchData(objArrVal, "TrnInvoiceServiceDtl_Select");
        while (oDr.Read())
        {
           iCntRow += 1;
        }

        ViewState["iCntRow"] = iCntRow;
    }
# endregion

}