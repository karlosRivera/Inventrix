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

public partial class Transactions_PurchaseReturnView : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("PurchaseReturnView.aspx");
        }
        CheckQString();

        if (!IsPostBack)
        {
            if (Request["Action"] == "V")
            {
                lblTitle.Text = "Purchase Return View";
                lblretno.Text = Request["ID"];
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
        oSqlDataReader = BLL.Transaction.PurchaseReturn.FetchData(objArr, "TrnPurchaseReturn_SelectVw");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["DeliveryNoteDate"] != DBNull.Value)
                {
                    lblretdate.Text = DateTime.Parse(oSqlDataReader["DeliveryNoteDate"].ToString()).ToString("dd/MM/yyyy");
                }

                if (oSqlDataReader["ChallanDate"] != DBNull.Value)
                {
                    lblchallandate.Text = DateTime.Parse(oSqlDataReader["ChallanDate"].ToString()).ToString("dd/MM/yyyy");
                }

                if (oSqlDataReader["ChallanNo"] != DBNull.Value)
                {
                    lblchallanno.Text = oSqlDataReader["ChallanNo"].ToString();
                }

                if (oSqlDataReader["GRNNo"] != DBNull.Value)
                {
                    lblgrnno.Text = oSqlDataReader["GRNNo"].ToString();
                }

                if (oSqlDataReader["SupplierName"] != DBNull.Value)
                {
                    lblsupplier.Text = oSqlDataReader["SupplierName"].ToString();
                }

                if (oSqlDataReader["ShippingAddress"] != DBNull.Value)
                {
                    lblshippingaddress.Text = oSqlDataReader["ShippingAddress"].ToString();
                }

                if (oSqlDataReader["DespatchMode"] != DBNull.Value)
                {
                    lbldespatchmode.Text = oSqlDataReader["DespatchMode"].ToString();
                }

                if (oSqlDataReader["ShippingCity"] != DBNull.Value)
                {
                    lblshippingcity.Text = oSqlDataReader["ShippingCity"].ToString();
                }

                if (oSqlDataReader["ShippingPin"] != DBNull.Value)
                {
                    lblshippingpin.Text = oSqlDataReader["ShippingPin"].ToString();
                }

                if (oSqlDataReader["DeliveredBy"] != DBNull.Value)
                {
                    lbldeliveryby.Text = oSqlDataReader["DeliveredBy"].ToString();
                }

                if (oSqlDataReader["VehicleNo"] != DBNull.Value)
                {
                    lblvehicleno.Text = oSqlDataReader["VehicleNo"].ToString();
                }

                if (oSqlDataReader["Remarks"] != DBNull.Value)
                {
                    lblremarks.Text = oSqlDataReader["Remarks"].ToString();
                }

                if (oSqlDataReader["VATRate"] != DBNull.Value)
                {
                    lblvatrate.Text = oSqlDataReader["VATRate"].ToString();
                }

                if (oSqlDataReader["VATAmt"] != DBNull.Value)
                {
                    lblvatamt.Text = oSqlDataReader["VATAmt"].ToString();
                }

                if (oSqlDataReader["ProductTotalAmt"] != DBNull.Value)
                {
                    lblsubtotal.Text = oSqlDataReader["ProductTotalAmt"].ToString();
                }

                if (oSqlDataReader["TotalAmt"] != DBNull.Value)
                {
                    lblinvtotal.Text = oSqlDataReader["TotalAmt"].ToString();
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
        Response.Redirect("../ViewReport.aspx?ModID=" + GetModuleID() + "&Tag=1&ID=" + lblretno.Text.Trim());

    }
}
