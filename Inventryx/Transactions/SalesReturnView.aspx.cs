//Developed by Tridip
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

public partial class Transactions_SalesReturnView : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("SalesReturnView.aspx");
        }
        CheckQString();

        if (!IsPostBack)
        {
            if (Request["Action"] == "V")
            {
                lblTitle.Text = "Sales Return View";
                lblGrnNo.Text = Request["ID"];
                LoadData(Request["ID"]);
            }
        }
    }

    #region LoadData
    #region Info
    //THIS FUNCTION WILL BE CALLED WHEN USER EDIT THIS FORM
    //THE MAIN OBJECTIVE OF THIS FUNCTION IS TO POPULATE THIS FORM
    #endregion
    protected void LoadData(string PRetNo)
    {
        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(PRetNo);
        oSqlDataReader = BLL.Transaction.SalesReturn.FetchData(objArr, "GetSalesReturnDetail_vw");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["DeliveryNoteDate"] != DBNull.Value)
                {
                    lblGrnDate.Text = DateTime.Parse(oSqlDataReader["GRNDate"].ToString()).ToString("dd/MM/yyyy");
                }

                if (oSqlDataReader["InvoiceNo"] != DBNull.Value)
                {
                    lblInvNo.Text = DateTime.Parse(oSqlDataReader["InvoiceNo"].ToString()).ToString("dd/MM/yyyy");
                }

                if (oSqlDataReader["InvoiceDate"] != DBNull.Value)
                {
                    lblInvDate.Text = DateTime.Parse(oSqlDataReader["InvoiceDate"].ToString()).ToString("dd/MM/yyyy");
                }

                if (oSqlDataReader["DeliveryNoteNo"] != DBNull.Value)
                {
                    lblDeliveryNoteNo.Text = oSqlDataReader["DeliveryNoteNo"].ToString();
                }

                if (oSqlDataReader["DeliveryNoteDate"] != DBNull.Value)
                {
                    lblDeliveryNoteDate.Text = DateTime.Parse(oSqlDataReader["DeliveryNoteDate"].ToString()).ToString("dd/MM/yyyy");
                }

                if (oSqlDataReader["StockPointName"] != DBNull.Value)
                {
                    lblStockPoint.Text = oSqlDataReader["StockPointName"].ToString();
                }

                if (oSqlDataReader["CustomerName"] != DBNull.Value)
                {
                    lblCustomer.Text = oSqlDataReader["CustomerName"].ToString();
                }

                if (oSqlDataReader["DeliveredBy"] != DBNull.Value)
                {
                    lbldeliveredBy.Text = oSqlDataReader["DeliveredBy"].ToString();
                }

                if (oSqlDataReader["VehicleNo"] != DBNull.Value)
                {
                    lblVehicleNo.Text = oSqlDataReader["VehicleNo"].ToString();
                }

                if (oSqlDataReader["Remarks"] != DBNull.Value)
                {
                    lblRemarks.Text = oSqlDataReader["Remarks"].ToString();
                }

                if (oSqlDataReader["VatRate"] != DBNull.Value)
                {
                    lblVatRate.Text = oSqlDataReader["VatRate"].ToString();
                }

                if (oSqlDataReader["VatAmount"] != DBNull.Value)
                {
                    lblVatAmt.Text = oSqlDataReader["VatAmount"].ToString();
                }

                if (oSqlDataReader["SubTotal"] != DBNull.Value)
                {
                    lblSubTotal.Text = oSqlDataReader["SubTotal"].ToString();
                }

                if (oSqlDataReader["InvTotal"] != DBNull.Value)
                {
                    lblInvTotal.Text = oSqlDataReader["InvTotal"].ToString();
                }
            }

            oSqlDataReader.NextResult();

            dgList.DataSource = oSqlDataReader;
            dgList.DataBind();
        }
        oSqlDataReader.Close();
    }
    #endregion

    protected void btnPrint_Click1(object sender, EventArgs e)
    {
        Response.Redirect("../ViewReport.aspx?ModID=" + GetModuleID() + "&Tag=1&ID=" + lblGrnNo.Text.Trim());
    }

}
