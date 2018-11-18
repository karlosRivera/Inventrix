
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

public partial class Transactions_ServiceInvoiceView : System.Web.UI.Page
{

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("ServiceInvoiceView.aspx");
        }

        if (!IsPostBack)
        {
            string sServiceInvoiceNo = "";

            if (Request["Action"] == "C")
            {
                this.pnlInvCancel.Visible = true;
                this.btnCancel.Visible = true;
            }
            if (Request["ID"] != null && Request["ID"] != "")
            {
                sServiceInvoiceNo = Request["ID"];
                LoadData(sServiceInvoiceNo);
            }

        }
    }
    #endregion

    #region LoadData
    #region Info
    //THIS FUNCTION WILL FETCH DATA FROM HEADER AND DETAIL TABLE AND POPULATE THIS FORM
    #endregion
    private void LoadData(string sServiceInvoiceNo)
    {

        ArrayList objArrVal = new ArrayList();
        objArrVal.Add(sServiceInvoiceNo);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
        objArrVal.Add("V");

        SqlDataReader oDr = BLL.Transaction.ServiceInvoice.GetDataForViewPage(objArrVal);
        while (oDr.Read())
        {
            if (oDr["InvoiceNo"] != DBNull.Value)
            {
                this.lblServiceInvNo.Text = oDr["InvoiceNo"].ToString();
            }
            if (oDr["InvoiceDate"] != DBNull.Value)
            {
                this.lblInvDate.Text = oDr["InvoiceDate"].ToString();
            }

            if (oDr["JobNo"] != DBNull.Value)
            {
                this.lblJobNo.Text = oDr["JobNo"].ToString();
            }

            if (oDr["CustomerName"] != DBNull.Value)
            {
                this.lblCustomer.Text = oDr["CustomerName"].ToString();
            }

            if (oDr["BillingAddress"] != DBNull.Value)
            {
                this.lblBillingAddress.Text = oDr["BillingAddress"].ToString();
            }

            if (oDr["BillingCity"] != DBNull.Value)
            {
                this.lblBillingCity.Text = oDr["BillingCity"].ToString();
            }

            if (oDr["BillingPin"] != DBNull.Value)
            {
                this.lblBillingPin.Text = oDr["BillingPin"].ToString();
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

            if (oDr["VATRate"] != DBNull.Value)
            {
                this.lblVatRate.Text = oDr["VATRate"].ToString();
            }

            if (oDr["VATAmt"] != DBNull.Value)
            {
                this.lblVatAmt.Text = oDr["VATAmt"].ToString();
            }


            if (oDr["ProductTotalAmt"] != DBNull.Value)
            {
                this.lblSubTotal.Text = oDr["ProductTotalAmt"].ToString();
            }

            if (oDr["InvoiceAmt"] != DBNull.Value)
            {
                this.lblInvTotal.Text = oDr["InvoiceAmt"].ToString();
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
        //Response.Redirect("../Report.aspx?ModID=" + GetModuleID() + "&Tag=1&ID=" + lblJobNo.Text.Trim());
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
            objArr.Add(this.lblServiceInvNo.Text.Trim());
            objArr.Add(this.txtCancelDate.Date.ToShortDateString().ToString().Trim());
            objArr.Add(this.txtCancelReason.Text.Trim());

            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

            object tmpMsg = BLL.Transaction.ServiceInvoice.Operate(objArr, Request["Action"].ToString());
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

        if (this.txtCancelReason.Text.Trim() == "")
        {
            sMsg = "Please give the Reason behind Invoice Cancellation";
            return sMsg;
        }

        return sMsg;
    }

    # endregion

}
