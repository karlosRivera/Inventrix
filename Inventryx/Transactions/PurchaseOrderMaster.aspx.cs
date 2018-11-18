/*
//Developed By : Tridip Bhattacharjee
*/

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

public partial class PurchaseOrderMaster : BasePage
{
    #region Global Variable
    double ProductTotalAmt = 0, VATRate = 0, VATAmt = 0, PurchaseOrderAmt = 0;
    #endregion

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("PurchaseOrderMaster.aspx");
        }
        CheckQString();

        if (!IsPostBack)
        {
            txtSubVatRate.Attributes.Add("onchange", "javascript:CalculateTotalAmount()");
            txtSubVatAmt.Attributes.Add("onchange", "javascript:CalculateTotalAmount()");
            txtSubTotal.Attributes.Add("onchange", "javascript:CalculateTotalAmount()");
            txtPOTotal.Attributes.Add("onchange", "javascript:CalculateTotalAmount()");


            ArrayList objArrVal = new ArrayList();

            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

            PopulateCombo(BLL.Transaction.PurchaseOrder.GetComboData("MstSupplier_Select", objArrVal), ddlSupplier, "SupplierName", "", "SupplierID", "");
            PopulateCombo(BLL.Transaction.PurchaseOrder.GetComboData("MstProductGroupFrm_Select", objArrVal), ddlProductGroup, "ProductGroupName", "", "ProductGroupID", "");
            PopulateCombo(BLL.Transaction.PurchaseOrder.GetComboData("MstDepartmentFrm_Select", objArrVal), ddlDepartment, "DepartmentName", "", "DepartmentID", "");

            if (Request["Action"] == "A")
            {
                lblTitle.Text = "Add New Purchase Order Details";
                BindGrid(0);
            }
            else
            {
                lblTitle.Text = "Modify Purchase Order Details";
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

        int i = 0,iRow=0;
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

    #region EmitTotalRows
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
    public void LoadData(string PurchaseOrderNo)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion
        int iRows = 0;
        string sVal = "";
        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(PurchaseOrderNo);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

        oSqlDataReader = BLL.Master.StockPoint.FetchData(objArr, "TrnPurchaseOrder_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["PurchaseOrderNo"] != DBNull.Value)
                {
                    txtPoNo.Text = oSqlDataReader["PurchaseOrderNo"].ToString();
                }

                if (oSqlDataReader["PurchaseOrderDate"] != DBNull.Value)
                {
                    txtPoDate.Date=Convert.ToDateTime(oSqlDataReader["PurchaseOrderDate"].ToString());
                }

                if (oSqlDataReader["DateofDelivery"] != DBNull.Value)
                {
                    txtdateofdelivery.Date = Convert.ToDateTime(oSqlDataReader["DateofDelivery"].ToString());
                }

                if (oSqlDataReader["SupplierID"] != DBNull.Value)
                {
                    sVal = oSqlDataReader["SupplierID"].ToString();
                    ddlSupplier.SelectedIndex = -1;
                    ddlSupplier.Items.FindByValue(sVal).Selected = true;
                }

                if (oSqlDataReader["ProductGroupID"] != DBNull.Value)
                {
                    ddlProductGroup.SelectedIndex = -1;
                    ddlProductGroup.Items.FindByValue(oSqlDataReader["ProductGroupID"].ToString()).Selected = true;
                }

                if (oSqlDataReader["DepartmentID"] != DBNull.Value)
                {
                    ddlDepartment.SelectedIndex = -1;
                    ddlDepartment.Items.FindByValue(oSqlDataReader["DepartmentID"].ToString()).Selected = true;
                }

                if (oSqlDataReader["Paymentterms"] != DBNull.Value)
                {
                    txtPaymentTerm.Text = oSqlDataReader["Paymentterms"].ToString();
                }

                if (oSqlDataReader["Remarks"] != DBNull.Value)
                {
                    txtRemarks.Text = oSqlDataReader["Remarks"].ToString();
                }

                if (oSqlDataReader["ProductTotalAmt"] != DBNull.Value)
                {
                    ProductTotalAmt = Convert.ToDouble(oSqlDataReader["ProductTotalAmt"]);
                }

                if (oSqlDataReader["PurchaseOrderAmt"] != DBNull.Value)
                {
                    PurchaseOrderAmt = Convert.ToDouble(oSqlDataReader["PurchaseOrderAmt"]);
                }

                if (oSqlDataReader["VATRate"] != DBNull.Value)
                {
                    VATRate = Convert.ToDouble(oSqlDataReader["VATRate"]);
                }

                if (oSqlDataReader["VATAmt"] != DBNull.Value)
                {
                    VATAmt = Convert.ToDouble(oSqlDataReader["VATAmt"]);
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
                ((CheckBox)dgList.Items[i].FindControl("chkSelect")).Checked=true;

                if (oSqlDataReader["ProductID"] != DBNull.Value)
                {
                    ((DropDownList)dgList.Items[i].FindControl("ddlProduct")).SelectedIndex = -1;
                    ((DropDownList)dgList.Items[i].FindControl("ddlProduct")).Items.FindByValue(oSqlDataReader["ProductID"].ToString()).Selected=true;
                }
                
                if (oSqlDataReader["ProductUOM"] != DBNull.Value)
                {
                    ((TextBox)dgList.Items[i].FindControl("txtUnit")).Text = oSqlDataReader["ProductUOM"].ToString();
                }

                if (oSqlDataReader["ProductRate"] != DBNull.Value)
                {
                    ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text = oSqlDataReader["ProductRate"].ToString();
                }

                if (oSqlDataReader["ProductQty"] != DBNull.Value)
                {
                    ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtQty")).Text = oSqlDataReader["ProductQty"].ToString();
                }

                if (oSqlDataReader["ProductAmt"] != DBNull.Value)
                {
                    ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text = oSqlDataReader["ProductAmt"].ToString();
                }
                i++;
            }
        }
        oSqlDataReader.Close();

        txtSubVatRate.Text = VATRate.ToString();
        txtSubVatAmt.Text = VATAmt.ToString();
        txtSubTotal.Text = ProductTotalAmt.ToString();
        txtPOTotal.Text = PurchaseOrderAmt.ToString();
    }
    #endregion

    #region PopulateCombo
    private static void PopulateCombo(SqlDataReader oDr, System.Web.UI.WebControls.DropDownList ddlCom, string DataTextField1, string DataTextField2, string DataValueField, string Initialtext)
    {
        #region Info
        //THIS FUNCTION WILL POPULATE DROPDOWN WITH DATA FROM DATABASE TABLE
        #endregion

        string sTempText = "", sTempValue = "";
        ddlCom.Items.Clear();
        ddlCom.SelectedIndex = -1;

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

    #region BindGrid
    private void BindGrid(int rows)
    {
        #region Info
        //THIS FUNCTION WILL BIND THE GRID FROM THE DATASET
        #endregion

        DataSet ds =null;
        if(ViewState["data"]==null)
        {
            CreateDataSet(rows);
        }
        ds = ((DataSet) ViewState["data"]);
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
        tbl.Columns.Add("Unit");
        tbl.Columns.Add("Rate");
        tbl.Columns.Add("Qty");
        tbl.Columns.Add("Amount");

        for (i = 0; i < iRows; i++)
        {
            nRow = tbl.NewRow();
            nRow["Rate"] = "0";
            nRow["Qty"] = "0";
            nRow["Amount"] = "0";
            tbl.Rows.Add(nRow);
        }
        return tbl;
    }
    #endregion

    #region Populate
    private void Populate(int iRow,string sAction)
    {
        #region Info
        //THIS FUNCTION WILL HELP US TO INSERT A EMPTY NEW ROW AND DELETE EXISTING ROW
        #endregion

        int i;
        int j;
        string[] strValue = new string[4];
        DataRow dr;
        ArrayList arrLstCmb = new ArrayList();
        ArrayList arrLstChk = new ArrayList();
        DataSet ds = ((DataSet)(ViewState["data"]));
        ds.Tables[0].Rows.Clear();
        string sProductVal = "";

        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (sAction == "A")
            {
                sProductVal = ((DropDownList)(dgList.Items[i].FindControl("ddlProduct"))).SelectedItem.Value.ToString();
                arrLstCmb.Add(sProductVal);
                arrLstChk.Add((((CheckBox)(dgList.Items[i].FindControl("chkSelect"))).Checked == true ? "1" : "0"));

                strValue[0] = ((TextBox)(dgList.Items[i].FindControl("txtUnit"))).Text;
                strValue[1] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtRate"))).Text;
                strValue[2] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtQty"))).Text;
                strValue[3] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtAmount"))).Text;

                dr = ds.Tables[0].NewRow();
                for (j = 0; j <= 3; j++)
                {
                    dr[j] = strValue[j].ToString();
                }
                ds.Tables[0].Rows.Add(dr);
            }
            else if (sAction == "D")
            {
                if (iRow != i)
                {
                    sProductVal = ((DropDownList)(dgList.Items[i].FindControl("ddlProduct"))).SelectedItem.Value.ToString();
                    arrLstCmb.Add(sProductVal);
                    arrLstChk.Add((((CheckBox)(dgList.Items[i].FindControl("chkSelect"))).Checked == true ? "1" : "0"));

                    strValue[0] = ((TextBox)(dgList.Items[i].FindControl("txtUnit"))).Text;
                    strValue[1] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtRate"))).Text;
                    strValue[2] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtQty"))).Text;
                    strValue[3] = ((eWorld.UI.NumericBox)(dgList.Items[i].FindControl("txtAmount"))).Text;

                    dr = ds.Tables[0].NewRow();
                    for (j = 0; j <= 3; j++)
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
            dr["Rate"] = "0";
            dr["Qty"] = "0";
            dr["Amount"] = "0";
            ds.Tables[0].Rows.Add(dr);
        }

        ViewState["data"] = ds;
        BindGrid(0);

        for (i = 0; i <= arrLstCmb.Count - 1; i++)
        {
            ((DropDownList)(dgList.Items[i].FindControl("ddlProduct"))).SelectedIndex = -1;
            if (arrLstCmb[i].ToString().Trim() != string.Empty)
            {
                ((DropDownList)(dgList.Items[i].FindControl("ddlProduct"))).Items.FindByValue(arrLstCmb[i].ToString()).Selected = true;
            }
        }

        for (i = 0; i <= arrLstChk.Count - 1; i++)
        {
            if (arrLstChk[i].ToString() == "1")
            {
                ((CheckBox)(dgList.Items[i].FindControl("chkSelect"))).Checked=true;
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

        string sProduct = "", sUnit = "", sRate = "", sQty = "", sAmount = "";
        int i = 0;
        DataTable tbl = new DataTable();
        tbl.TableName = "PurchaseOrderDetail";
        DataRow dr = null;
        tbl.Columns.Add("productid");
        tbl.Columns.Add("unit");
        tbl.Columns.Add("rate");
        tbl.Columns.Add("qty");
        tbl.Columns.Add("amount");


        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (((CheckBox)dgList.Items[i].FindControl("chkSelect")).Checked)
            {
                if (((DropDownList)dgList.Items[i].FindControl("ddlProduct")).SelectedValue != DBNull.Value.ToString())
                {
                    sProduct = ((DropDownList)dgList.Items[i].FindControl("ddlProduct")).SelectedValue.ToString();
                }

                if (((TextBox)dgList.Items[i].FindControl("txtUnit")).Text.Trim() != "")
                {
                    sUnit = ((TextBox)dgList.Items[i].FindControl("txtUnit")).Text.Trim();
                }

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

                if (sProduct.Trim() != "" && sUnit.Trim() != "" && sRate.Trim() != "" && sQty.Trim() != "" && sAmount.Trim() != "")
                {
                    dr = tbl.NewRow();
                    dr["productid"] = sProduct;
                    dr["unit"] = sUnit;
                    dr["rate"] = sRate;
                    dr["qty"] = sQty;
                    dr["amount"] = sAmount;
                    tbl.Rows.Add(dr);
                }
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
                    objArr.Add(txtPoNo.Text);
                }
                  
                objArr.Add(txtPoDate.Date.ToShortDateString().Trim());
                objArr.Add(txtdateofdelivery.Date.ToShortDateString().Trim());
                objArr.Add(ddlSupplier.SelectedValue);
                objArr.Add(ddlDepartment.SelectedValue);
                objArr.Add(ddlProductGroup.SelectedValue);
                objArr.Add(txtPaymentTerm.Text.Trim());
                objArr.Add(txtRemarks.Text.Trim());

                objArr.Add(txtSubVatRate.Text.Trim());
                objArr.Add(txtSubVatAmt.Text.Trim());
                objArr.Add(txtSubTotal.Text.Trim());
                objArr.Add(txtPOTotal.Text.Trim());

                objArr.Add(BuildXmlForDetail());

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
                
                object tmpMsg = BLL.Transaction.PurchaseOrder.Operate(objArr, Request["Action"].ToString());
                //Utility.ShowMessage(this, (string)tmpMsg);
                if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
                {
                    Utility.ShowMessage(this, tmpMsg.ToString());
                }
                else
                {
                    Response.Redirect("PurchaseOrderView.aspx?Action=V&ID=" + tmpMsg.ToString());
                }
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
        if (ddlSupplier.SelectedValue==DBNull.Value.ToString())
        {
            sMsg = "Please select supplier";
            return sMsg;
        }

        if (txtPoDate.Date.ToShortDateString().Trim() == "")
        {
            sMsg = "Please select purchase order date";
            return sMsg;
        }

        if (ddlProductGroup.SelectedValue == DBNull.Value.ToString())
        {
            sMsg = "Please select product group";
            return sMsg;
        }

        if (txtdateofdelivery.Date.ToShortDateString().Trim() == "")
        {
            sMsg = "Please select date of delivery";
            return sMsg;
        }

        if (ddlDepartment.SelectedValue == DBNull.Value.ToString())
        {
            sMsg = "Please select department";
            return sMsg;
        }

        bool flag = true, chkFlag = false;
        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (((CheckBox)dgList.Items[i].FindControl("chkSelect")).Checked)
            {
                chkFlag = true;
                if (((DropDownList)dgList.Items[i].FindControl("ddlProduct")).SelectedValue == DBNull.Value.ToString())
                {
                    sMsg = "Error in row: " + (i + 1) + " Please select product";
                    flag = false;
                    return sMsg;
                }

                if (((TextBox)dgList.Items[i].FindControl("txtUnit")).Text.Trim() == "")
                {
                    sMsg = "Error in row: " + (i + 1) + " Unit should be minimum 0";
                    flag = false;
                    return sMsg;
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

        if (!chkFlag)
        {
            sMsg = "No Rows are checked...";
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
                    DataSet ds = (DataSet) ViewState["data"];
                    int rowid = int.Parse(e.Item.Cells[1].Text);
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        if (e.Item.ItemIndex + 1 == rowid)
                        {
                            row.Delete();
                            Populate(e.Item.ItemIndex,"D");
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
            ArrayList objArrVal = new ArrayList();
            objArrVal.Add("");
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

            PopulateCombo(BLL.Transaction.PurchaseOrder.GetComboData("MstProduct_Select", objArrVal), ((System.Web.UI.WebControls.DropDownList)e.Item.FindControl("ddlProduct")), "ProductName", "", "ProductID", "");

            ((eWorld.UI.NumericBox)e.Item.FindControl("txtRate")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
            ((eWorld.UI.NumericBox)e.Item.FindControl("txtQty")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
            ((eWorld.UI.NumericBox)e.Item.FindControl("txtAmount")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
        }
    }
    #endregion

    #region GridCboSelectedIndexChanged
    protected void GridCboSelectedIndexChanged(object sender, EventArgs e)
    {
        #region INFO
        //HERE WE CAPTURE SELECTED INDEX CANGE OF A DROPDOWN IN A DATAGRID
        #endregion 

        int idgRow = ((DataGridItem)((DropDownList)sender).Parent.Parent).ItemIndex;
        string sProductID=((DropDownList)sender).SelectedValue.ToString();
        if(sProductID.Trim()!="")
        {
            SqlDataReader oSqlDataReader = null;
            ArrayList objArr = new ArrayList();
            objArr.Add(sProductID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

            oSqlDataReader = BLL.Transaction.PurchaseOrder.FetchData(objArr, "MstGetProductUOM_Select");

            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["productUOM"] != DBNull.Value)
                {
                    ((TextBox)dgList.Items[idgRow].FindControl("txtUnit")).Text = oSqlDataReader["productUOM"].ToString();
                }
            }

            oSqlDataReader.Close();

        }

        ((TextBox)dgList.Items[idgRow].FindControl("txtRate")).Text = ViewState["SupplierRate"].ToString();

        EmitTotalRows();
        EmitScript();
    }
    #endregion

    # region ddlSupplier_SelectedIndexChanged
    protected void ddlSupplier_SelectedIndexChanged(object sender, EventArgs e)
    {
        ArrayList objArr = new ArrayList();
        SqlDataReader oSqlDataReader;
        objArr.Clear();
        objArr.Add(this.ddlSupplier.SelectedValue.ToString());
        objArr.Add("");

        oSqlDataReader = BLL.Transaction.PurchaseOrder.FetchData(objArr, "MstSupplierRate_Select");

        if (oSqlDataReader.Read())
        {
            if (oSqlDataReader["SupplierRate"] != DBNull.Value)
            {
                ViewState["SupplierRate"] = oSqlDataReader["SupplierRate"].ToString();
            }
        }

    }
    # endregion

    protected void dgList_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}   
