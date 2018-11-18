

# region DEVELOPED BY
//this Transaction is developed by Indranil Roy
# endregion

using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Transactions_PurchaseInvoiceTrn :BasePage
{


    #region Global variable declaration
    private string ListOfGRN = "";
    decimal sSubTotal;
    #endregion

    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("PurchaseInvoiceTrn.aspx");
        }

        CheckQString();

        if (!this.IsPostBack)
        {
            PopulateCombo(this.ddSupplier, "SupplierName", "SupplierID", "MstSupplier_Select","M");
            PopulateCombo(this.ddPurchaseOrder, "PurchaseOrderNo", "PurchaseOrderNo", "TrnPurchaseOrder_Select","T");

            this.txtVatRate.Attributes.Add("onchange", "javascript:CalculateTotalAmount();");
            this.txtVatAmt.Attributes.Add("onchange", "javascript:CalculateTotalAmount();");
            this.txtSubTotal.Attributes.Add("onchange", "javascript:CalculateTotalAmount();");
            this.txtInvTotal.Attributes.Add("onchange", "javascript:CalculateTotalAmount();");

            if (Request["Action"] == "A")
            {
                lblTitle.Text = "Add New Purchase Invoice Details";
            }
            else
            {
                lblTitle.Text = "Modify Purchase Invoice Details";
                LoadData(Request["ID"]);
            }

        }
    }
    # endregion

    #region LoadData
    public void LoadData(string PurchaseInvNo)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add("");
        objArr.Add(PurchaseInvNo);
        objArr.Add("E");
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

        oSqlDataReader = BLL.Transaction.PurchaseInvoice.FetchData(objArr, "TrnPurchaseInvoice_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["PurchaseInvNo"] != DBNull.Value)
                {
                    this.txtPurchaseInvNo.Text = oSqlDataReader["PurchaseInvNo"].ToString();
                }

                if (oSqlDataReader["PurchaseOrderNo"] != DBNull.Value)
                {
                    this.ddPurchaseOrder.SelectedIndex = -1;
                    this.ddPurchaseOrder.Items.FindByValue(oSqlDataReader["PurchaseOrderNo"].ToString()).Selected = true;
                }

                if (oSqlDataReader["PurchaseInvDate"] != DBNull.Value)
                {
                    this.txtPurchaseInvDate.Date = Convert.ToDateTime(oSqlDataReader["PurchaseInvDate"].ToString());
                }

                if (oSqlDataReader["SupplierID"] != DBNull.Value)
                {
                    this.ddSupplier.SelectedIndex = -1;
                    this.ddSupplier.Items.FindByValue(oSqlDataReader["SupplierID"].ToString()).Selected = true;
                }

                if (oSqlDataReader["SupInvDate"] != DBNull.Value)
                {
                    this.txtPurchaseInvDate.Date = Convert.ToDateTime(oSqlDataReader["SupInvDate"].ToString());
                }

                if (oSqlDataReader["Remarks"] != DBNull.Value)
                {
                    this.txtRemarks.Text = oSqlDataReader["Remarks"].ToString();
                }

                if (oSqlDataReader["VatRate"] != DBNull.Value)
                {
                    this.txtVatRate.Text = oSqlDataReader["VatRate"].ToString();
                }

                if (oSqlDataReader["VatAmt"] != DBNull.Value)
                {
                    this.txtVatAmt.Text = oSqlDataReader["VatAmt"].ToString();
                }

                if (oSqlDataReader["ProductTotal"] != DBNull.Value)
                {
                    this.txtSubTotal.Text = oSqlDataReader["ProductTotal"].ToString();
                }

                if (oSqlDataReader["PurchaseInvAmt"] != DBNull.Value)
                {
                    this.txtInvTotal.Text = oSqlDataReader["PurchaseInvAmt"].ToString();
                }

                if (oSqlDataReader["SupInvNo"] != DBNull.Value)
                {
                    this.txtSupInvNo.Text = oSqlDataReader["SupInvNo"].ToString();
                }

            }

            oSqlDataReader.NextResult();
            this.dgList.Visible = true;
            this.btnPopulateProduct.Enabled = false;
            this.dgList.DataSource = oSqlDataReader;
            this.DataBind();
            PopulateListBox(this.lstchkGRN, "GRNNo", "GRNNo", "TrnListGRN", this.ddPurchaseOrder.SelectedValue.Trim());
            this.ClientScript.RegisterHiddenField("hdnTotalRows", this.dgList.Items.Count.ToString());
        }
        oSqlDataReader.Close();
    }
    #endregion
    
    # region PopulateCombo
    private void PopulateCombo(DropDownList ddControl, string FieldName, string FieldID, string spName,string sStatus)
    {
        SqlDataReader oDr;
        ArrayList objArrVal=new ArrayList();
        if (sStatus == "T")
        {
            objArrVal.Add("");
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
        }
        else
        {
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        }
        
        oDr = BLL.Transaction.PurchaseInvoice.GetComboData(spName, objArrVal);
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

    # region BindGrid
    private void BindGrid()
    {
        DataSet ds = new DataSet();
        ds.Tables.Add(CreateDataTable());
        this.dgList.DataSource = ds.Tables[0];
        this.dgList.DataBind();
        this.txtSubTotal.Text = sSubTotal.ToString();
        this.txtInvTotal.Text = sSubTotal.ToString();
    }
    #endregion
    
    # region CreateDataTable
    private DataTable CreateDataTable()
    {
        DataRow row;
        DataTable table=new DataTable();
        SqlDataReader oDr;

        table.Columns.Add("ProductID");
        table.Columns.Add("Product");
        table.Columns.Add("Unit");
        table.Columns.Add("PORate");
        table.Columns.Add("GRNQty");
        table.Columns.Add("ProductAmt") ;
      
        ArrayList objArrList = new ArrayList();
        objArrList.Add(ListOfGRN);
        objArrList.Add("");
        objArrList.Add("");
        objArrList.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrList.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArrList.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

        oDr = BLL.Transaction.PurchaseInvoice.FetchData(objArrList, "TrnPurchaseInvoice_Select");

        int iCnt = 1;
        sSubTotal = 0;
        while (oDr.Read())
        {
            row = table.NewRow();
            row["ProductID"] = oDr["ProductID"];
            row["Product"] = oDr["Product"];
            row["Unit"] = oDr["Unit"];
            row["PORate"] = oDr["PORate"];
            row["GRNQty"] = oDr["GRNQty"];
            row["ProductAmt"] = decimal.Round(Convert.ToDecimal(oDr["ProductAmt"]),2);
            sSubTotal = sSubTotal + decimal.Round(Convert.ToDecimal(oDr["ProductAmt"]), 2);
            iCnt += 1;
            table.Rows.Add(row);
        }
        return table;

    }
    # endregion

    # region PopulateListBox
    private void PopulateListBox(CheckBoxList lstBox, string FieldName, string FieldID, string spName,string sPurchaseOrderNo)
    {
        SqlDataReader oDr;
        ArrayList objArrVal = new ArrayList();
        objArrVal.Add(sPurchaseOrderNo);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

        oDr = BLL.Transaction.PurchaseInvoice.ListBoxData(spName, objArrVal);
        lstBox.Items.Clear();
        while (oDr.Read())
        {
            lstBox.Items.Add(new ListItem((string)(oDr[FieldName]) + " -- -- " + (string)(oDr["GRNDate"]), (string)(oDr[FieldID])));

            if (Request["Action"] == "E")
            {
                lstBox.Items.FindByValue((string)(oDr[FieldID])).Selected = true;
            }
        }
        if (!oDr.IsClosed)
        { oDr.Close(); }
    }
    # endregion

    # region ddPurchaseOrder_SelectedIndexChanged
    protected void ddPurchaseOrder_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopulateListBox(this.lstchkGRN, "GRNNo", "GRNNo", "TrnListGRN", this.ddPurchaseOrder.SelectedValue.Trim());
    }
    # endregion

    # region dgList_ItemDataBound
    protected void dgList_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            e.Item.Cells[1].Text = Convert.ToString(e.Item.DataSetIndex + 1);
            ((eWorld.UI.NumericBox)e.Item.FindControl("txtInvRate")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
            ((eWorld.UI.NumericBox)e.Item.FindControl("txtInvQty")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
            ((eWorld.UI.NumericBox)e.Item.FindControl("txtAmount")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");

        }
    }
    # endregion

    # region btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {

        for (int i = 0; i <= this.lstchkGRN.Items.Count - 1; i++)
        {
            if (this.lstchkGRN.Items[i].Selected == true)
                ListOfGRN = ListOfGRN + this.lstchkGRN.Items[i].Value + ",";
        }

        if (Request["Action"] == "A" || Request["Action"] == "E")
        {
            string sMsg="";
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
                    objArr.Add(this.txtPurchaseInvNo.Text.Trim());
                }

                objArr.Add(this.ddPurchaseOrder.SelectedValue.Trim());
                objArr.Add(this.txtPurchaseInvDate.Date.ToShortDateString().Trim());
                objArr.Add(this.ddSupplier.SelectedValue.Trim());
                objArr.Add(this.txtSupInvDate.Date.ToShortDateString().Trim());
                objArr.Add(this.txtRemarks.Text.Trim());
                objArr.Add(this.txtSupInvNo.Text.Trim());
                objArr.Add(ListOfGRN.ToString().Trim());
                objArr.Add(this.txtVatRate.Text.Trim());
                objArr.Add(this.txtVatAmt.Text.Trim());
                objArr.Add(this.txtSubTotal.Text.Trim());
                objArr.Add(this.txtInvTotal.Text.Trim());

                objArr.Add(BuildXmlForDetail());

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

               object tmpMsg = BLL.Transaction.PurchaseInvoice.Operate(objArr, Request["Action"].ToString());
               Response.Redirect("PurchaseInvoiceView.aspx?Action=V&ID=" + tmpMsg.ToString());
            }
            else
            {
                Utility.ShowMessage(this, sMsg);
            }
        }
    }
    # endregion

    #region BuildXmlForDetail
    private string BuildXmlForDetail()
    {
        #region INFO
        //THIS FUNCTION WILL GENERATE AND RETURN XML FOR DETAIL GRID PORTION
        #endregion

        string sProduct = "", sUnit = "", sPORate = "", sInvQty = "", sInvRate = "", sAmount = "",sGRNQty="";
        int i = 0;
        DataTable tbl = new DataTable();
        tbl.TableName = "PurchaseInvDetail";
        DataRow dr = null;
        tbl.Columns.Add("productid");
        tbl.Columns.Add("unit");
        tbl.Columns.Add("POrate");
        tbl.Columns.Add("InvRate");
        tbl.Columns.Add("GRNqty");
        tbl.Columns.Add("InvQty");
        tbl.Columns.Add("Amount");


        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {

            if (dgList.Items[i].Cells[0].Text.Trim() != "")
            {
                sProduct = dgList.Items[i].Cells[0].Text.Trim();
            }

            if (dgList.Items[i].Cells[3].Text.Trim() != "")
            {
                sUnit = dgList.Items[i].Cells[3].Text.Trim();
            }

            if (dgList.Items[i].Cells[4].Text.Trim() != "")
            {
                sPORate = dgList.Items[i].Cells[4].Text.Trim();
            }

            if (dgList.Items[i].Cells[6].Text.Trim() != "")
            {
                sGRNQty = dgList.Items[i].Cells[6].Text.Trim();
            }


            if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtInvRate")).Text.Trim() != "")
            {
                sInvRate = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtInvRate")).Text.Trim();
            }

            if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtInvQty")).Text.Trim() != "")
            {
                sInvQty = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtInvQty")).Text.Trim();
            }

            if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text.Trim() != "")
            {
                sAmount = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text.Trim();
            }

            dr = tbl.NewRow();
            dr["productid"] = sProduct;
            dr["unit"] = sUnit;
            dr["POrate"] = sPORate;
            dr["InvRate"] = sInvRate;
            dr["GRNqty"]=sGRNQty;
            dr["InvQty"]=sInvQty;
            dr["Amount"] = sAmount;
            tbl.Rows.Add(dr);
        }

        DataSet oDS = new DataSet();
        oDS.Tables.Add(tbl);
        string sXML = oDS.GetXml().ToString();
        return oDS.GetXml().ToString();
    }
    #endregion
    
    # region btnPopulateProduct_Click

    protected void  btnPopulateProduct_Click(object sender, EventArgs e)
    {
            for (int i = 0; i <= this.lstchkGRN.Items.Count - 1; i++)
            {
                if (this.lstchkGRN.Items[i].Selected == true)
                    ListOfGRN = ListOfGRN + this.lstchkGRN.Items[i].Value + ",";
            }
            this.dgList.Visible = true;
            BindGrid();
            this.ClientScript.RegisterHiddenField("hdnTotalRows", this.dgList.Items.Count.ToString());

    }

# endregion

    #region ValidateInput
    private string ValidateInput()
    {
        #region INFO
        //THIS FUNCTION WILL VALIDATE DATA BEFORE INSERTING OR UPDATION DATA TO THE TABLE
        #endregion
        int i = 0;
        string sMsg = "";

        if (Convert.ToInt64(this.ddPurchaseOrder.SelectedValue) == -1)
        {
            sMsg = "Please Select Purchase Order";
            return sMsg;
        }

        if (this.txtPurchaseInvDate.Date.ToShortDateString().ToString().Trim() == "")
        {
            sMsg = "Please give Purchase Invoice Date";
            return sMsg;
        }

        if (Convert.ToInt32(this.ddSupplier.SelectedValue) == -1)
        {
            sMsg = "Please Select Supplier";
            return sMsg;
        }

        if (this.txtSupInvDate.Date.ToShortDateString().ToString().Trim() == "")
        {
            sMsg = "Please give Supplier Invoice Date";
            return sMsg;
        }


        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {

            if (dgList.Items[i].Cells[0].Text.Trim() == "")
            {
                sMsg="Error in "+ i + " th"+ " Row: " + "Please Give the Product ID";
                break;
            }

            if (dgList.Items[i].Cells[2].Text.Trim() == "")
            {
                sMsg = "Error in " + i + " th" + " Row: " + "Please Give the Product Name";
                break;
            }

            if (dgList.Items[i].Cells[3].Text.Trim() == "")
            {
                sMsg = "Error in " + i + " th" + " Row: " + "Please Give the Unit of Measurement";
                break;
            }

            if (dgList.Items[i].Cells[4].Text.Trim() == "")
            {
                sMsg = "Error in " + i + " th" + " Row: " + "Please Give the Purchase Order Rate";
                break;
            }

            if (dgList.Items[i].Cells[6].Text.Trim() == "")
            {
                sMsg = "Error in " + i + " th" + " Row: " + "Please Give the GRN Quantity";
                break;
            }
            if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtInvRate")).Text.Trim() == "")
            {
                sMsg = "Error in " + i + " th" + " Row: " + "Please Give the Invoice Rate";
                break;
            }

            if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtInvRate")).Text.Trim() != dgList.Items[i].Cells[4].Text.Trim())
            {
                //sMsg = "Invoice Rate and Purchase Order Rate shiould be same";
                sMsg = "Error in " + i + " th" + " Row: " + "Invoice Rate and Purchase Order Rate shiould be same";
                break;
            }

            if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtInvQty")).Text.Trim() == "")
            {
                sMsg = "Error in " + i + " th" + " Row: " + "Please Give the Invoice Quantity";
                break;
            }

            if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text.Trim() == "")
            {
                sMsg = "Error in " + i + " th" + " Row: " + "Please Give the Invoice Amount";
                break;
            }
        }
        return sMsg;
    }
    #endregion

}
