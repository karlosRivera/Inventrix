
//Developed By : Indranil Roy

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

public partial class Transactions_ProformaInvoiceView : BasePage
{

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("ProformaInvoiceView.aspx");
        }

        if (!IsPostBack)
        {

            string sProformaInvoiceNo = "";

            if (Request["Action"] == "C")
            {
                this.pnlInvCancel.Visible = true;
                this.btnCancel.Visible = true;
            }
            if (Request["ID"] != null && Request["ID"] != "")
            {
                sProformaInvoiceNo = Request["ID"];
                LoadData(sProformaInvoiceNo);
            }

        }
    }
    #endregion

    #region LoadData
    #region Info
    //THIS FUNCTION WILL FETCH DATA FROM HEADER AND DETAIL TABLE AND POPULATE THIS FORM
    #endregion
    private void LoadData(string sProformaInvoiceNo)
    {

        ArrayList objArr = new ArrayList();
        objArr.Add(sProformaInvoiceNo);
        objArr.Add("V");
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

        SqlDataReader oDr = BLL.Transaction.ProformaInvoice.GetDataForViewPage(objArr);
        while (oDr.Read())
        {
            if (oDr["ProformaInvNo"] != DBNull.Value)
            {
                this.lblProformaInvNo.Text = oDr["ProformaInvNo"].ToString();
            }
            if (oDr["ProformaInvDate"] != DBNull.Value)
            {
                this.lblProformaInvDate.Text = oDr["ProformaInvDate"].ToString();
            }
            if (oDr["DeliveryDate"] != DBNull.Value)
            {
                this.lblDeliveryDate.Text = oDr["DeliveryDate"].ToString();
            }
            if (oDr["CustomerName"] != DBNull.Value)
            {
                this.lblCustomer.Text = oDr["CustomerName"].ToString();
            }
            if (oDr["Remarks"] != DBNull.Value)
            {
                this.lblRemarks.Text = oDr["Remarks"].ToString();
            }

            if (oDr["CancelDate"] != DBNull.Value)
            {
                this.lblCancelDate.Text = oDr["CancelDate"].ToString();
            }
            if (oDr["CancelReason"] != DBNull.Value)
            {
                this.lblCancelReason.Text = oDr["CancelReason"].ToString();
            }
            
            if (oDr["VatRate"] != DBNull.Value)
            {
                this.lblVatRate.Text = oDr["VatRate"].ToString();
            }
            if (oDr["VatAmt"] != DBNull.Value)
            {
                this.lblVatAmt.Text = oDr["VatAmt"].ToString();
            }
            if (oDr["ProductTotal"] != DBNull.Value)
            {
                this.lblSubTotal.Text = oDr["ProductTotal"].ToString();
            }

            if (oDr["ProformaInvAmt"] != DBNull.Value)
            {
                this.lblInvTotal.Text = oDr["ProformaInvAmt"].ToString();
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
        Response.Redirect("../Report.aspx?ModID=" + GetModuleID() + "&Tag=1&ID=" + lblProformaInvNo.Text.Trim());
    }
    #endregion

    # region btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {

            string sMsg;
            sMsg = ValidateInput();
            if (sMsg == "")
            {
                ArrayList objArr = new ArrayList();
                objArr.Add(this.lblProformaInvNo.Text.Trim());
                objArr.Add(this.txtCancelDate.Date.ToShortDateString().ToString().Trim());
                objArr.Add(this.txtCancelReason.Text.Trim());
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
                object tmpMsg = BLL.Transaction.ProformaInvoice.Operate(objArr, Request["Action"].ToString());
                //Utility.ShowMessage(this, (string)tmpMsg);
                //Response.Redirect("ProformaInvoiceView.aspx?Action=V&ID=" + tmpMsg.ToString());
                LoadData(tmpMsg.ToString().Trim());
            }
            else
            {
                Utility.ShowMessage(this, sMsg);
            }


    }
    # endregion

    # region ValidateInput
    private string ValidateInput()
    {
        #region INFO
        //THIS FUNCTION WILL VALIDATE DATA BEFORE INSERTING OR UPDATION DATA TO THE TABLE
        #endregion

        string sMsg = "";

        if (this.txtCancelDate.Date.ToShortDateString().ToString().Trim() == "")
        {
            sMsg = "Please give Cancellation Date";
            return sMsg;
        }

        if (this.txtCancelReason.Text.Trim()== "")
        {
            sMsg = "Please give the Reason behind Invoice Cancellation";
            return sMsg;
        }

        return sMsg;
    }

    # endregion
}
