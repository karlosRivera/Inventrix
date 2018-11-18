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

public partial class Transactions_SalesReturn : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("SalesReturn.aspx");
        }

        CheckQString();

        if (!IsPostBack)
        {
            Utility.PopulateCombo(BLL.Transaction.SalesReturn.GetComboData("TrnInvoice_Select", ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID, ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID, ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear), ddlInvoiceNo, "InvoiceNo", "", "InvoiceNo", "");
            Utility.PopulateCombo(BLL.Transaction.SalesReturn.GetComboData("MstStockPointNames_Select", ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID, ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID,""), ddlStockPoint, "StockPointName", "", "StockPointID", "");

            txtSubVatRate.Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
            txtSubVatAmt.Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
            PnlDetail.Visible = false;
            if (Request["Action"] == "A")
            {
                lblTitle.Text = "Add New Sales Return";
                ddlInvoiceNo.Enabled = true;
            }
            else if (Request["Action"] == "E")
            {
                lblTitle.Text = "Modify Sales Return";
                ddlInvoiceNo.Enabled = true;
            }
        }
    }

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

    protected void ddlInvoiceNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Request["Action"] == "A")
        {
            if (ddlInvoiceNo.SelectedIndex > 0)
            {
                ArrayList oArr = new ArrayList();
                oArr.Add(ddlInvoiceNo.SelectedValue);
                SqlDataReader oDr = BLL.Transaction.SalesReturn.FetchData(oArr, "TrnInvoiceDetail_Select");
                if (oDr.HasRows)
                {
                    while (oDr.Read())
                    {
                        if (oDr["InvoiceDate"] != DBNull.Value)
                        {
                            dtpInvoiceDate.Date = Convert.ToDateTime(oDr["InvoiceDate"].ToString());
                        }

                        if (oDr["DeliveryNoteNo"] != DBNull.Value)
                        {
                            txtDeliveryNoteNo.Text = oDr["DeliveryNoteNo"].ToString();
                        }

                        if (oDr["DeliveryNoteDate"] != DBNull.Value)
                        {
                            dtpDeliveryNoteDate.Date = Convert.ToDateTime(oDr["DeliveryNoteDate"].ToString());
                        }

                        if (oDr["CustomerName"] != DBNull.Value)
                        {
                            txtCustomer.Text = oDr["CustomerName"].ToString();
                        }
                    }

                    oDr.NextResult();

                    dgList.DataSource = oDr;
                    dgList.DataBind();
                }
                oDr.Close();
                if (dgList.Items.Count > 0)
                {
                    EmitTotalRows();
                    EmitScript();
                    PnlDetail.Visible = true;
                }
                else
                {
                    PnlDetail.Visible = false;
                }
            }
        }
    }
 
    protected void dgList_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            ((eWorld.UI.NumericBox)e.Item.FindControl("txtRate")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
            ((eWorld.UI.NumericBox)e.Item.FindControl("txtRetQty")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
        }
    }

    #region BuildXmlForDetail
    private string BuildXmlForDetail()
    {
        #region INFO
        //THIS FUNCTION WILL GENERATE AND RETURN XML FOR DETAIL GRID PORTION
        #endregion
        string sXMLDetail = "";
        string sProduct = "", sRate = "", sInvQty = "", sReturnQty = "", sAmount = "";
        int i = 0, j = 0;
        DataTable tbl = new DataTable();
        tbl.TableName = "SalesReturn";
        DataRow dr = null;
        tbl.Columns.Add("ProductID");
        tbl.Columns.Add("Rate");
        tbl.Columns.Add("InvQty");
        tbl.Columns.Add("ReturnQty");
        tbl.Columns.Add("Amount");

        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (Convert.ToDouble(((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text) > 0)
            {
                sProduct = ((Label)dgList.Items[i].FindControl("lblProductID")).Text.Trim();
                sRate = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim();
                sInvQty = ((Label)dgList.Items[i].FindControl("lblGRNQty")).Text.Trim();
                sReturnQty = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRetQty")).Text.Trim();
                sAmount = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text.Trim();

                dr = tbl.NewRow();
                dr["ProductID"] = sProduct;
                dr["Rate"] = sRate;
                dr["InvQty"] = sInvQty;
                dr["ReturnQty"] = sReturnQty;
                dr["Amount"] = sAmount;
                tbl.Rows.Add(dr);
            }
        }
        DataSet oDS = new DataSet();
        oDS.Tables.Add(tbl);
        sXMLDetail = oDS.GetXml().ToString();
        return sXMLDetail;
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
                    objArr.Add(txtGRNDate.Date.ToShortDateString().Trim());
                    objArr.Add(ddlInvoiceNo.SelectedValue);
                    objArr.Add(dtpInvoiceDate.Date.ToShortDateString().Trim());
                    objArr.Add(txtDeliveryNoteNo.Text.Trim());
                    objArr.Add(dtpDeliveryNoteDate.Date.ToShortDateString().Trim());
                    objArr.Add(ddlStockPoint.SelectedValue);
                    objArr.Add(txtDeliveredBy.Text.Trim());
                    objArr.Add(txtVehicleNo.Text.Trim());
                    objArr.Add(txtRemarks.Text.Trim());
                    objArr.Add(txtSubVatRate.Text.Trim());
                    objArr.Add(txtSubVatAmt.Text.Trim());
                    objArr.Add(txtSubTotal.Text.Trim());
                    objArr.Add(txtPOTotal.Text.Trim());
                    objArr.Add(BuildXmlForDetail());
                }

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

                object tmpMsg = BLL.Transaction.SalesReturn.Operate(objArr, Request["Action"].ToString());

                if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
                {
                    Utility.ShowMessage(this, tmpMsg.ToString());
                }
                else
                {
                    Response.Redirect("SalesReturnView.aspx?Action=V&ID=" + tmpMsg.ToString());
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
        bool IsDetailExist = false;

        if (ddlInvoiceNo.SelectedIndex <= 0)
        {
            sMsg = "Please select invoice no";
            return sMsg;
        }

        if (dtpInvoiceDate.Date.ToShortDateString() == "")
        {
            sMsg = "Please select invoice date";
            return sMsg;
        }

        if (txtDeliveryNoteNo.Text == "")
        {
            sMsg = "Please enter delivery note no";
            return sMsg;
        }

        if (dtpDeliveryNoteDate.Date.ToShortDateString() == "")
        {
            sMsg = "Please select delivery note date";
            return sMsg;
        }

        if (ddlStockPoint.SelectedIndex <= 0)
        {
            sMsg = "Please select stock point";
            return sMsg;
        }

        if (txtCustomer.Text == "")
        {
            sMsg = "Please enter customer no";
            return sMsg;
        }

        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (Convert.ToDouble(((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text) > 0)
            {
                IsDetailExist = true;
            }
        }

        if (!IsDetailExist)
        {
            sMsg = "Product detail section is not filled properly";
            return sMsg;
        }
        return sMsg;
    }
    #endregion

 
}
