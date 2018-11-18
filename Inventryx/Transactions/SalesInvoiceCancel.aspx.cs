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


public partial class Transactions_SalesInvoiceCancel : BasePage
{
     protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("SalesInvoiceCancel.aspx");
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
        oSqlDataReader = BLL.Transaction.DeliveryNote.FetchData(objArr, "TrnSalesInv_Select");

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
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        #region INFO
        // THIS FUNCTION WILL ACTUALLY INSERT DATA AND UPDATE DATA IN THE TABLE THROUGH STORE PROCEDURE
        #endregion
        if (Request["Action"] == "C")
        {
            string sMsg;
            sMsg = ValidateInput();
            if (sMsg == "")
            {
                ArrayList objArr = new ArrayList();
                objArr.Add(lblSalesInvNo.Text.Trim());
                objArr.Add(lblDeliveryNote.Text.Trim());
                objArr.Add(txtCancelDate.Date.ToShortDateString());
                objArr.Add(txtCancelReason.Text.Trim());

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

    #region ValidateInput
    private string ValidateInput()
    {
        #region INFO
        //THIS FUNCTION WILL VALIDATE DATA BEFORE INSERTING OR UPDATION DATA TO THE TABLE
        #endregion
        int i = 0;
        string sMsg = "";

        if (txtCancelDate.Date.ToShortDateString().Trim() == "")
        {
            sMsg = "Please select cancel date";
            return sMsg;
        }

        if (txtCancelReason.Text.Trim() == "")
        {
            sMsg = "Please enter cancel reason";
            return sMsg;
        }

        return sMsg;
    }
    #endregion
}
