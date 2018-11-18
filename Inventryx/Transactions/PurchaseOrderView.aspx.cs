//Developed By : Tridip Bhattacharjee

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

public partial class PurchaseOrderView : BasePage
{

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("PurchaseOrderView.aspx");
        }

        if (!IsPostBack)
        {
            string sPurchaseOrderNo = "";
            if (Request["Action"] == "V")
            {
                if (Request["ID"]!=null && Request["ID"] != "")
                {
                    sPurchaseOrderNo = Request["ID"];
                    LoadData(sPurchaseOrderNo);
                }
            }
        }
    }
    #endregion

    #region LoadData
    #region Info
    //THIS FUNCTION WILL FETCH DATA FROM HEADER AND DETAIL TABLE AND POPULATE THIS FORM
    #endregion
    private void LoadData(string sPurchaseOrderNo)
    {
        SqlDataReader oDr = BLL.Transaction.PurchaseOrder.GetDataForViewPage(sPurchaseOrderNo);
        while (oDr.Read())
        {
            if (oDr["PurchaseOrderNo"] != DBNull.Value)
            {
                lblPoNo.Text = oDr["PurchaseOrderNo"].ToString();
            }

            if (oDr["PurchaseOrderDate"] != DBNull.Value)
            {
                lblPoDate.Text = Convert.ToDateTime(oDr["PurchaseOrderDate"].ToString()).ToString("dd/MM/yyyy");
            }

            if (oDr["Dateofdelivery"] != DBNull.Value)
            {
                lbldateofdelivery.Text = Convert.ToDateTime(oDr["Dateofdelivery"].ToString()).ToString("dd/MM/yyyy");
            }

            if (oDr["paymentterms"] != DBNull.Value)
            {
                lblPaymentterms.Text = oDr["paymentterms"].ToString();
            }

            if (oDr["remarks"] != DBNull.Value)
            {
                lblRemarks.Text = oDr["remarks"].ToString();
            }

            if (oDr["SupplierName"] != DBNull.Value)
            {
                lblSupplier.Text = oDr["SupplierName"].ToString();
            }

            if (oDr["DepartmentName"] != DBNull.Value)
            {
                lblDepartment.Text = oDr["DepartmentName"].ToString();
            }

            if (oDr["ProductGroupName"] != DBNull.Value)
            {
                lblProductGroup.Text = oDr["ProductGroupName"].ToString();
            }

            if (oDr["VatRate"] != DBNull.Value)
            {
                lblVatRate.Text = oDr["VatRate"].ToString();
            }

            if (oDr["VatAmt"] != DBNull.Value)
            {
                lblVatAmt.Text = oDr["VatAmt"].ToString();
            }

            if (oDr["ProductTotalAmt"] != DBNull.Value)
            {
                lblSubTotal.Text = oDr["ProductTotalAmt"].ToString();
            }

            if (oDr["PurchaseOrderAmt"] != DBNull.Value)
            {
                lblPoTotal.Text = oDr["PurchaseOrderAmt"].ToString();
            }

            pnlCancel.Visible = false;
            if (oDr["PurchaseOrderStatus"] != DBNull.Value)
            {
                if (oDr["PurchaseOrderStatus"].ToString().Trim() == "CAN")
                {
                    pnlCancel.Visible = true;

                    if (oDr["CancelDate"] != DBNull.Value)
                    {
                        lblCancelDate.Text = DateTime.Parse(oDr["CancelDate"].ToString()).ToString("dd/MM/yyyy");
                    }

                    if (oDr["CancelReason"] != DBNull.Value)
                    {
                        lblCancelReason.Text = oDr["CancelReason"].ToString();
                    }

                }
            }
        }

        oDr.NextResult();

        dgList.DataSource = oDr;
        dgList.DataBind();
        oDr.Close();
    }
    #endregion

    #region btPrint_Click
    #region Info
    // THIS WILL REDIRECT PAGE TO THE REPORT PAGE WITH PROPER QUERY STRING
    #endregion
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Response.Redirect("../ViewReport.aspx?ModID=" + GetModuleID() + "&Tag=1&ID=" + lblPoNo.Text.Trim());
    }
    #endregion
  
}
