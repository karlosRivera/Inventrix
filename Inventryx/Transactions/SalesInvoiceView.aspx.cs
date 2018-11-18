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

public partial class Transactions_SalesInvoiceView : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("SalesInvoiceView.aspx");
        }
        CheckQString();
        lblSalesInvNo.Text = Request["ID"];
        LoadData(Request["ID"]);
    }

    #region LoadData
    #region Info
    //THIS FUNCTION WILL BE CALLED WHEN USER EDIT THIS FORM
    //THE MAIN OBJECTIVE OF THIS FUNCTION IS TO POPULATE THIS FORM
    #endregion
    protected void LoadData(string DeliveryNoteNo)
    {
        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(DeliveryNoteNo);
        oSqlDataReader = BLL.Transaction.SalesInvoice.FetchData(objArr, "TrnSalesInv_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["InvoiceDate"] != DBNull.Value)
                {
                    lblInvdate.Text = DateTime.Parse(oSqlDataReader["InvoiceDate"].ToString()).ToString("dd/MM/yyyy");
                }

                if (oSqlDataReader["DeliveryNoteNo"] != DBNull.Value)
                {
                    lblDeliveryNote.Text = oSqlDataReader["DeliveryNoteNo"].ToString();
                }

                if (oSqlDataReader["CustomerName"] != DBNull.Value)
                {
                    lblCustomer.Text = oSqlDataReader["CustomerName"].ToString();
                }

                if (oSqlDataReader["BillingAddress"] != DBNull.Value)
                {
                    lblBillingAddress.Text = oSqlDataReader["BillingAddress"].ToString();
                }

                if (oSqlDataReader["BillingCity"] != DBNull.Value)
                {
                    lblCity.Text = oSqlDataReader["BillingCity"].ToString();
                }

                if (oSqlDataReader["BillingPin"] != DBNull.Value)
                {
                    lblPin.Text = oSqlDataReader["BillingPin"].ToString();
                }

                if (oSqlDataReader["Remarks"] != DBNull.Value)
                {
                    lblRemarks.Text = oSqlDataReader["Remarks"].ToString();
                }

                if (oSqlDataReader["ProductTotalAmt"] != DBNull.Value)
                {
                    lblSubTotal.Text = oSqlDataReader["ProductTotalAmt"].ToString();
                }

                if (oSqlDataReader["VATRate"] != DBNull.Value)
                {
                    lblVatrate.Text = oSqlDataReader["VATRate"].ToString();
                }

                if (oSqlDataReader["VATAmt"] != DBNull.Value)
                {
                    lblVatAmt.Text = oSqlDataReader["VATAmt"].ToString();
                }

                if (oSqlDataReader["InvoiceAmt"] != DBNull.Value)
                {
                    lblInvAmt.Text = oSqlDataReader["InvoiceAmt"].ToString();
                }

            }

            oSqlDataReader.NextResult();

            dgList.DataSource = oSqlDataReader;
            dgList.DataBind();
        }
        oSqlDataReader.Close();
    }
    #endregion
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Response.Redirect("../ViewReport.aspx?ModID=" + GetModuleID() + "&Tag=1&ID=" + lblSalesInvNo.Text.Trim());
    }
}
