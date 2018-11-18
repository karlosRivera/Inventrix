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


public partial class Transactions_SalesInvoice : BasePage
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("SalesInvoice.aspx");
        }
        CheckQString();

        if (!IsPostBack)
        {
            Utility.PopulateCombo(BLL.Transaction.SalesInvoice.GetComboData("TrnDeliveryNoteNo_Select", ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID, ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID, ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear), ddlDeliveryNoteNo, "DeliveryNoteNo", "", "DeliveryNoteNo", "");
            txtSubVatRate.Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
            txtSubVatAmt.Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
            PnlDetail.Visible = false;
            if (Request["Action"] == "A")
            {
                lblTitle.Text = "Add New Sales Invoice";
            }
            else if (Request["Action"] == "E")
            {
                //LoadData(Request["ID"]);
            }
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

    #region ddlDeliveryNoteNo_SelectedIndexChanged
    protected void ddlDeliveryNoteNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Request["Action"] == "A")
        {
            if (ddlDeliveryNoteNo.SelectedIndex > 0)
            {
                ArrayList oArr = new ArrayList();
                oArr.Add(ddlDeliveryNoteNo.SelectedValue);
                SqlDataReader oDr = BLL.Transaction.SalesInvoice.FetchData(oArr, "TrnDeliveryNoteNoWiseDtl_Select");
                if (oDr.HasRows)
                {
                    while (oDr.Read())
                    {
                        if (oDr["BillingAddress"] != DBNull.Value)
                        {
                            txtBillingAddress.Text = oDr["BillingAddress"].ToString();
                        }

                        if (oDr["CustomerName"] != DBNull.Value)
                        {
                            txtCustomer.Text = oDr["CustomerName"].ToString();
                        }

                        if (oDr["BillingCity"] != DBNull.Value)
                        {
                            txtCity.Text = oDr["BillingCity"].ToString();
                        }

                        if (oDr["BillingPin"] != DBNull.Value)
                        {
                            txtPin.Text = oDr["BillingPin"].ToString();
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
    #endregion dgList_ItemDataBound
    #region
    protected void dgList_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            ((eWorld.UI.NumericBox)e.Item.FindControl("txtRate")).Attributes.Add("onChange", "javascript:CalculateTotalAmount();");
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
        tbl.TableName = "InvoiceDetail";
        DataRow dr = null;
        tbl.Columns.Add("ProductID");
        tbl.Columns.Add("Unit");
        tbl.Columns.Add("Rate");
        tbl.Columns.Add("Qty");
        tbl.Columns.Add("Amount");


        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (((Label)dgList.Items[i].FindControl("lblProductID")).Text.Trim() != "")
                {
                    sProduct = ((Label)dgList.Items[i].FindControl("lblProductID")).Text.Trim();
                }

                if (((Label)dgList.Items[i].FindControl("lblUnit")).Text.Trim() != "")
                {
                    sUnit = ((Label)dgList.Items[i].FindControl("lblUnit")).Text.Trim();
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim() != "")
                {
                    sRate = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim();
                }

                if (((Label)dgList.Items[i].FindControl("lblQty")).Text.Trim() != "")
                {
                    sQty = ((Label)dgList.Items[i].FindControl("lblQty")).Text.Trim();
                }

                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text.Trim() != "")
                {
                    sAmount = ((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtAmount")).Text.Trim();
                }

                if (sProduct.Trim() != "" && sUnit.Trim() != "" && sRate.Trim() != "" && sQty.Trim() != "" && sAmount.Trim() != "")
                {
                    dr = tbl.NewRow();
                    dr["ProductID"] = sProduct;
                    dr["Unit"] = sUnit;
                    dr["Rate"] = sRate;
                    dr["Qty"] = sQty;
                    dr["Amount"] = sAmount;
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
            double POTotal = 0, SubTotal = 0;
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
                    objArr.Add(txtInvNo.Text);
                }

                objArr.Add(txtInvDate.Date.ToShortDateString().Trim());
                objArr.Add(ddlDeliveryNoteNo.SelectedValue);
                objArr.Add(txtBillingAddress.Text.Trim());
                objArr.Add(txtCity.Text.Trim());
                objArr.Add(txtPin.Text.Trim());
                objArr.Add(txtRemarks.Text.Trim());
                objArr.Add(txtSubVatRate.Text.Trim());
                objArr.Add(txtSubVatAmt.Text.Trim());
                POTotal =Convert.ToDouble(txtPOTotal.Text);
                SubTotal = Convert.ToDouble(txtSubTotal.Text);
                objArr.Add(POTotal);
                objArr.Add(SubTotal);
                objArr.Add(BuildXmlForDetail());

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

                object tmpMsg = BLL.Transaction.SalesInvoice.Operate(objArr, Request["Action"].ToString());
                if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
                {
                    Utility.ShowMessage(this, tmpMsg.ToString());
                }
                else
                {
                    Response.Redirect("SalesInvoiceView.aspx?Action=V&ID=" + tmpMsg.ToString());
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

        if (txtInvDate.Date.ToShortDateString().Trim() == "")
        {
            sMsg = "Please select invoice date";
            return sMsg;
        }

        if (ddlDeliveryNoteNo.SelectedValue == DBNull.Value.ToString())
        {
            sMsg = "Please select delivery note no";
            return sMsg;
        }

        if (txtBillingAddress.Text.Trim()== "")
        {
            sMsg = "Please enter billing address";
            return sMsg;
        }


        if (txtCustomer.Text.Trim() == "")
        {
            sMsg = "Customer name can't be empty";
            return sMsg;
        }


        bool flag = true;
        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
                if (((eWorld.UI.NumericBox)dgList.Items[i].FindControl("txtRate")).Text.Trim() == "")
                {
                    sMsg = "Error in row: " + (i + 1) + " Sales Rate should be minimum 0";
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
        return sMsg;
    }
    #endregion
}
