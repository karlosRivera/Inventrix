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

//Insert TrnDeliveryNoteHdr
public partial class Transactions_PurchaseReturn : BasePage 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("PurchaseReturn.aspx");
        }
        CheckQString();

        if (!IsPostBack)
        {
            Utility.PopulateCombo(BLL.Transaction.PurchaseReturn.GetComboData("PurchaseRetddl_Select", ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID, ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID, ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear), ddlGRN, "GRNNo", "", "GRNNo", "");
            txtSubVatRate.Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
            txtSubVatAmt.Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
            txtSubTotal.Attributes.Add("onchange", "javascript:CalculateTotalAmount()");
            txtPOTotal.Attributes.Add("onchange", "javascript:CalculateTotalAmount()");

            PnlDetail.Visible = false;
            if (Request["Action"] == "A")
            {
                lblTitle.Text = "Add New Purchase Return";
                ddlGRN.Enabled = true;
            }
            else if (Request["Action"] == "E")
            {
                lblTitle.Text = "Modify Purchase Return";
                //LoadData(Request["ID"]);
                ddlGRN.Enabled = true;
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
    protected void ddlGRN_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Request["Action"] == "A")
        {
            if (ddlGRN.SelectedIndex > 0)
            {
                ArrayList oArr = new ArrayList();
                oArr.Add(ddlGRN.SelectedValue);
                SqlDataReader oDr = BLL.Transaction.PurchaseReturn.FetchData(oArr, "PurchaseReturndetail_Select");
                if (oDr.HasRows)
                {
                    while (oDr.Read())
                    {
                        if (oDr["SupplierName"] != DBNull.Value)
                        {
                            txtSupplier.Text = oDr["SupplierName"].ToString();
                        }

                        if (oDr["SupplierAddress"] != DBNull.Value)
                        {
                            txtShippingAddress.Text = oDr["SupplierAddress"].ToString();
                        }

                        if (oDr["SupplierCity"] != DBNull.Value)
                        {
                            txtShippingCity.Text = oDr["SupplierCity"].ToString();
                        }

                        if (oDr["SupplierPin"] != DBNull.Value)
                        {
                            txtShippingPin.Text = oDr["SupplierPin"].ToString();
                        }

                        if (oDr["RefDeliveryNoteNo"] != DBNull.Value)
                        {
                            txtChallanNo.Text = oDr["RefDeliveryNoteNo"].ToString();
                        }

                        if (oDr["RefDeliveryNoteDate"] != DBNull.Value)
                        {
                            txtChallanDate.Date =Convert.ToDateTime(oDr["RefDeliveryNoteDate"].ToString());
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
        }
    }

    #region BuildXmlForDetail
    private string BuildXmlForDetail()
    {
        #region INFO
        //THIS FUNCTION WILL GENERATE AND RETURN XML FOR DETAIL GRID PORTION
        #endregion
        string sXMLDetail = "";
        string sProduct = "", sRate = "", sGRNQty = "", sReturnQty = "", sAmount = "";
        int i=0,j=0;
        DataTable tbl = new DataTable();
        tbl.TableName = "PurchaseReturn";
        DataRow dr = null;
        tbl.Columns.Add("ProductID");
        tbl.Columns.Add("Rate");
        tbl.Columns.Add("GRNQty");
        tbl.Columns.Add("ReturnQty");
        tbl.Columns.Add("Amount");

        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (Convert.ToInt32(((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text) > 0)
            {
                sProduct = ((Label)dgList.Items[i].FindControl("lblProdID")).Text.Trim();
                sRate = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim();
                sGRNQty = ((Label)dgList.Items[i].FindControl("lblGRNQty")).Text.Trim();
                sReturnQty = ((Label)dgList.Items[i].FindControl("lblRetQty")).Text.Trim();
                sAmount = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text.Trim();

                dr = tbl.NewRow();
                dr["ProductID"] = sProduct;
                dr["Rate"] = sRate;
                dr["GRNQty"] = sGRNQty;
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
                    objArr.Add(txtPurRetDate.Date.ToShortDateString().Trim());
                    objArr.Add(ddlGRN.SelectedValue);
                    objArr.Add(txtShippingAddress.Text.Trim());
                    objArr.Add(txtShippingCity.Text.Trim());
                    objArr.Add(txtShippingPin.Text.Trim());
                    objArr.Add(txtChallanNo.Text.Trim());
                    objArr.Add(txtChallanDate.Date.ToShortDateString().Trim());
                    objArr.Add(ddlModeofDespatch.SelectedValue);
                    objArr.Add(txtVehicleNo.Text.Trim());
                    objArr.Add(txtDeliveredBy.Text.Trim());
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
                
                object tmpMsg = BLL.Transaction.PurchaseReturn.Operate(objArr, Request["Action"].ToString());

                if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
                {
                    Utility.ShowMessage(this, tmpMsg.ToString());
                }
                else
                {
                    Response.Redirect("PurcahseReturnView.aspx?Action=V&ID=" + tmpMsg.ToString());
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
        if (ddlGRN.SelectedIndex <=0)
        {
            sMsg = "Please select grn no";
            return sMsg;
        }

        if (txtSupplier.Text == "")
        {
            sMsg = "Please enter supplier name";
            return sMsg;
        }

        if (txtShippingAddress.Text == "")
        {
            sMsg = "Please enter shipping address";
            return sMsg;
        }

        return sMsg;
    }
    #endregion
}
