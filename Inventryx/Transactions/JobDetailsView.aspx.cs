
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

public partial class Transactions_JobDetailsView : BasePage
{

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("JobDetailsView.aspx");
        }

        if (!IsPostBack)
        {
            string sJobNo = "";

            if (Request["Action"] == "C")
            {
                this.pnlInvCancel.Visible = true;
                this.btnCancel.Visible = true;
            }
            if (Request["ID"] != null && Request["ID"] != "")
            {
                sJobNo = Request["ID"];
                LoadData(sJobNo);
            }

        }
    }
    #endregion

    #region LoadData
    #region Info
    //THIS FUNCTION WILL FETCH DATA FROM HEADER AND DETAIL TABLE AND POPULATE THIS FORM
    #endregion
    private void LoadData(string sJobNo)
    {

        ArrayList objArrVal = new ArrayList();
        objArrVal.Add(sJobNo);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
        objArrVal.Add("V");

        SqlDataReader oDr = BLL.Transaction.JobDetails.GetDataForViewPage(objArrVal);
        while (oDr.Read())
        {
            if (oDr["JobNo"] != DBNull.Value)
            {
                this.lblJobNo.Text = oDr["JobNo"].ToString();
            }
            if (oDr["JobStartDate"] != DBNull.Value)
            {
                this.lblJobStartDate.Text = oDr["JobStartDate"].ToString();
            }
            if (oDr["CustomerName"] != DBNull.Value)
            {
                this.lblCustomer.Text = oDr["CustomerName"].ToString();
            }
            if (oDr["JobAddress"] != DBNull.Value)
            {
                this.lblJobAddress.Text = oDr["JobAddress"].ToString();
            }
            if (oDr["JobCity"] != DBNull.Value)
            {
                this.lblJobCity.Text = oDr["JobCity"].ToString();
            }

            if (oDr["JobPin"] != DBNull.Value)
            {
                this.lblJobPin.Text = oDr["JobPin"].ToString();
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


            if (oDr["LabWorkTotal"] != DBNull.Value)
            {
                this.lblLabWorkTotal.Text = oDr["LabWorkTotal"].ToString();
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
        Response.Redirect("../Report.aspx?ModID=" + GetModuleID() + "&Tag=1&ID=" + lblJobNo.Text.Trim());
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
            objArr.Add(this.lblJobNo.Text.Trim());
            objArr.Add(this.txtCancelDate.Date.ToShortDateString().ToString().Trim());
            objArr.Add(this.txtCancelReason.Text.Trim());
            object tmpMsg = BLL.Transaction.JobDetails.Operate(objArr, Request["Action"].ToString());
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
            sMsg = "Please give the Reason behind Job Cancellation";
            return sMsg;
        }

        return sMsg;
    }

    # endregion

}
