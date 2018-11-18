//Developed By Tridip
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


public partial class Transactions_GoodsReceiptNoMaster : BasePage
{
    # region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("GoodsReceiptNoMaster.aspx");
        }

        CheckQString();

        if (!IsPostBack)
        {

            if (Request["Action"] == "A")
            {
                PopulateCombo(this.ddlPurchaseOrderNo, "PurchaseOrderNo", "PurchaseOrderNo", "TrnPurchaseOrderNo_Select", "T","");
                PopulateCombo(this.ddlStockPoint, "StockPointName", "StockPointID", "MstStockPointName_Select", "M","");

                lblTitle.Text = "Add New Goods Receipt Note";
                ddlPurchaseOrderNo.Enabled = true;
            }
            else if (Request["Action"] == "E")
            {
                lblTitle.Text = "Modify Goods Receipt Note";
                ddlPurchaseOrderNo.Enabled =false;
                txtGrnNo.Text = Request["ID"];
                LoadData(Request["ID"]);
            }
        }
    }
    # endregion

    #region LoadData
    protected void LoadData(string sGRNNo)
    {
        #region INFO
        // THIS FUNCTION WILL POPULATE THIS FORM WITH DATA WHEN THIS PAGE WILL BE OPENED IN A EDIT MODE
        #endregion

        ArrayList oArr = new ArrayList();
        oArr.Add(sGRNNo);
        SqlDataReader oDr = BLL.Transaction.GoodsReceiptNote.FetchData(oArr, "TrnGRNNo_Select");
        if (oDr.HasRows)
        {
            while (oDr.Read())
            {

                PopulateCombo(this.ddlPurchaseOrderNo, "PurchaseOrderNo", "PurchaseOrderNo", "TrnPurchaseOrderNo_Select", "T", oDr["PurchaseOrderNo"].ToString());
                PopulateCombo(this.ddlStockPoint, "StockPointName", "StockPointID", "MstStockPointName_Select", "M","");

                if (oDr["GRNDate"] != DBNull.Value)
                {
                    txtGRNDate.Date = Convert.ToDateTime(DateTime.Parse(oDr["GRNDate"].ToString()).ToString("dd/MM/yyyy"));
                }

                if (oDr["PurchaseOrderNo"] != DBNull.Value)
                {
                    ddlPurchaseOrderNo.Items.FindByValue(oDr["PurchaseOrderNo"].ToString()).Selected=true;
                }

                if (oDr["PurchaseOrderDate"] != DBNull.Value)
                {
                    txtPoDate.Date = Convert.ToDateTime(DateTime.Parse(oDr["PurchaseOrderDate"].ToString()).ToString("dd/MM/yyyy"));
                }

                if (oDr["StockPointID"] != DBNull.Value)
                {
                    ddlStockPoint.Items.FindByValue(oDr["StockPointID"].ToString()).Selected = true;
                }

                if (oDr["RefDeliveryNoteNo"] != DBNull.Value)
                {
                    txtSupDNNO.Text = oDr["RefDeliveryNoteNo"].ToString();
                }

                if (oDr["RefDeliveryNoteDate"] != DBNull.Value)
                {
                    txtSupDNDate.Date = Convert.ToDateTime(oDr["RefDeliveryNoteDate"].ToString());
                }

                if (oDr["DeliveredBy"] != DBNull.Value)
                {
                    txtDeliveredBy.Text = oDr["DeliveredBy"].ToString();
                }

                if (oDr["VehicleNo"] != DBNull.Value)
                {
                    txtVehicleNo.Text = oDr["VehicleNo"].ToString();
                }

                if (oDr["Remarks"] != DBNull.Value)
                {
                    txtRemarks.Text = oDr["Remarks"].ToString();
                }

                if (oDr["SupplierName"] != DBNull.Value)
                {
                    txtSupplier.Text = oDr["SupplierName"].ToString();
                }
            }
        }

        oDr.NextResult();

        dgList.DataSource = oDr;
        dgList.DataBind();

        oDr.Close();
    }
    #endregion

    #region ddlPurchaseOrderNo_SelectedIndexChanged
    protected void ddlPurchaseOrderNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        #region INFO
        // THIS FUNCTION WILL POPULATE PRODUCT DETAIL IN A GRID ACCORDINGLY PURCHASE ORDER NO WISE
        #endregion

        if (Request["Action"] == "A")
        {
            if (ddlPurchaseOrderNo.SelectedIndex > 0)
            {
                ArrayList oArr = new ArrayList();
                oArr.Add(ddlPurchaseOrderNo.SelectedValue);
                SqlDataReader oDr = BLL.Transaction.GoodsReceiptNote.FetchData(oArr, "TrnPurchaseOrderDetail_Select");
                if (oDr.HasRows)
                {
                    while (oDr.Read())
                    {
                         if (oDr["SupplierName"] != DBNull.Value)
                        {
                            txtSupplier.Text = oDr["SupplierName"].ToString();
                        }

                        if (oDr["PurchaseOrderDate"] != DBNull.Value)
                        {
                            txtPoDate.Date = Convert.ToDateTime(oDr["PurchaseOrderDate"].ToString());
                        }
                    }

                    oDr.NextResult();

                    dgList.DataSource = oDr;
                    dgList.DataBind();
                }
                oDr.Close();
            }
        }
    }
    #endregion

    #region btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region INFO
        // THIS FUNCTION WILL ACTUALLY INSERT DATA AND UPDATE DATA IN THE TABLE THROUGH STORE PROCEDURE
        #endregion

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
                    objArr.Add(txtGrnNo.Text);
                }

                objArr.Add(txtGRNDate.Date.ToShortDateString().Trim());
                objArr.Add(ddlPurchaseOrderNo.SelectedValue);
                objArr.Add(ddlStockPoint.SelectedValue);
                objArr.Add(txtSupDNNO.Text.Trim());
                objArr.Add(txtSupDNDate.Date.ToShortDateString().Trim());
                objArr.Add(txtDeliveredBy.Text.Trim());
                objArr.Add(txtVehicleNo.Text.Trim());
                objArr.Add(txtRemarks.Text.Trim());

                objArr.Add(BuildXmlForDetail());

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

                object tmpMsg = BLL.Transaction.GoodsReceiptNote.Operate(objArr, Request["Action"].ToString());
                if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
                {
                    Utility.ShowMessage(this, tmpMsg.ToString());
                }
                else
                {
                    Response.Redirect("GoodsReceiptNoteView.aspx?Action=V&ID=" + tmpMsg.ToString());
                }
            }
            else
            {
                Utility.ShowMessage(this, sMsg);
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

        string sProduct = "";
        decimal decQty = 0, decRcpQty = 0,decRate=0;
        int i = 0;
        DataTable tbl = new DataTable();
        tbl.TableName = "GRNDetail";
        DataRow dr = null;
        tbl.Columns.Add("ProductID");
        tbl.Columns.Add("BalancePOQty");
        tbl.Columns.Add("ReceiptQty");
        tbl.Columns.Add("Rate");

        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (((CheckBox)dgList.Items[i].FindControl("chkSelect")).Checked)
            {
                if (((Label)dgList.Items[i].FindControl("lblProdID")).Text != "")
                {
                    sProduct = ((Label)dgList.Items[i].FindControl("lblProdID")).Text.Trim();
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtQty")).Text.Trim() != "")
                {
                    decQty =Convert.ToDecimal(((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtQty")).Text.Trim());
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRcptQty")).Text.Trim() != "")
                {
                    decRcpQty = Convert.ToDecimal(((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRcptQty")).Text.Trim());
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim() != "")
                {
                    decRate = Convert.ToDecimal(((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim());
                }

                if (sProduct.Trim() != "" && decQty > 0 && decRcpQty > 0 && decRate > 0)
                {
                    dr = tbl.NewRow();
                    dr["ProductID"] = sProduct;
                    dr["BalancePOQty"] = decQty;
                    dr["ReceiptQty"] = decRcpQty;
                    dr["Rate"] = decRate;
                    tbl.Rows.Add(dr);
                }
            }
        }

        DataSet oDS = new DataSet();
        oDS.Tables.Add(tbl);
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

        if (txtGRNDate.Date.ToShortDateString().Trim() == "")
        {
            sMsg = "Please select GRN date";
            return sMsg;
        }

        if (txtPoDate.Date.ToShortDateString().Trim() == "")
        {
            sMsg = "Please select purchase order date";
            return sMsg;
        }

        if (DateTime.Compare(Convert.ToDateTime(DateTime.Parse(txtPoDate.Date.ToShortDateString()).ToString("dd/MM/yyyy")), Convert.ToDateTime(DateTime.Parse(txtGRNDate.Date.ToShortDateString()).ToString("dd/MM/yyyy"))) > 0)
        {
            sMsg = "GRN date should be greater than P.O. Date";
            return sMsg;
        }

        if (ddlPurchaseOrderNo.SelectedIndex <=0)
        {
            sMsg = "Please select purchase order no";
            return sMsg;
        }

        if (txtSupplier.Text == "")
        {
            sMsg = "Please enter supplier name";
            return sMsg;
        }

        if (ddlStockPoint.SelectedIndex <=0)
        {
            sMsg = "Please select stock point";
            return sMsg;
        }



        bool flag = true, chkFlag = false; ;
        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (((CheckBox)dgList.Items[i].FindControl("chkSelect")).Checked)
            {
                chkFlag = true;
                if (((TextBox)dgList.Items[i].FindControl("txtProduct")).Text== "")
                {
                    sMsg = "Error in row: " + (i + 1) + " Please enter product name";
                    flag = false;
                    return sMsg;
                }

                if (((TextBox)dgList.Items[i].FindControl("txtUnit")).Text.Trim() == "")
                {
                    sMsg = "Error in row: " + (i + 1) + " Please enter Unit";
                    flag = false;
                    return sMsg;
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim() == "")
                {
                    sMsg = "Error in row: " + (i + 1) + " Rate should be more than 0";
                    flag = false;
                    return sMsg;
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtQty")).Text.Trim() == "")
                {
                    sMsg = "Error in row: " + (i + 1) + " balance qty should be more than 0";
                    flag = false;
                    return sMsg;
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRcptQty")).Text.Trim() == "")
                {
                    sMsg = "Error in row: " + (i + 1) + " receive qty should be more than 0";
                    flag = false;
                    return sMsg;
                }

                if (Convert.ToDecimal(((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRcptQty")).Text.Trim())<=0)
                {
                    sMsg = "Error in row: " + (i + 1) + " receive qty should be more than 0";
                    flag = false;
                    return sMsg;
                }


                if (Convert.ToDecimal(((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtQty")).Text.Trim())<  Convert.ToDecimal(((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRcptQty")).Text.Trim()))
                {
                    sMsg = "Error in row: " + (i + 1) + " receive qty should be less than or equal to balance qty";
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

    # region dgList_ItemDataBound
    protected void dgList_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            if (DataBinder.Eval(e.Item.DataItem, "ProductID") != DBNull.Value)
            {
                ((CheckBox)e.Item.FindControl("chkSelect")).Checked = true;
            }
        }
    }
# endregion

    # region PopulateCombo
    private void PopulateCombo(DropDownList ddControl, string FieldName, string FieldID, string spName,string sTrack,string sPONo)
    {
        SqlDataReader oDr;
        ArrayList objArrVal = new ArrayList();

        if (sTrack == "T")
        {
            if (Request["Action"] == "E")
            {
                objArrVal.Add(sPONo.Trim());
            }
            else
            {
                objArrVal.Add("");
            }
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
        }
        else
        {
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            objArrVal.Add("");
        }

        oDr = BLL.Transaction.GoodsReceiptNote.GetComboData(spName, objArrVal);
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
}
