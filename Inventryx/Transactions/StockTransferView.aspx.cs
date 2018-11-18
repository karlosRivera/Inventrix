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

public partial class Transactions_StockTransferView : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("StockTransferViewView.aspx");
        }
        CheckQString();

        if (!IsPostBack)
        {
            lblTitle.Text = "View Stock Transfer";
            lblStTrnNo.Text = Request["ID"];
            LoadData(Request["ID"]);

            if (Request["Action"] == "C")
            {
                pnlInvCancel.Visible = true;
            }
            else
                pnlInvCancel.Visible = false;
        }
    }

    #region LoadData
    #region Info
    //THIS FUNCTION WILL BE CALLED WHEN USER EDIT THIS FORM
    //THE MAIN OBJECTIVE OF THIS FUNCTION IS TO POPULATE THIS FORM
    #endregion
    protected void LoadData(string StockTransferNo)
    {
        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(StockTransferNo);
        oSqlDataReader = BLL.Transaction.DeliveryNote.FetchData(objArr, "TrnStockTransferGrid_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["StockTransferDate"] != DBNull.Value)
                {
                    lblStTrnDate.Text = DateTime.Parse(oSqlDataReader["StockTransferDate"].ToString()).ToString("dd/MM/yyyy");
                }

                if (oSqlDataReader["StockPointFrom"] != DBNull.Value)
                {
                    lblStPointName.Text = oSqlDataReader["StockPointFrom"].ToString();
                }

                if (oSqlDataReader["StockPointTo"] != DBNull.Value)
                {
                    lblStTrnTo.Text = oSqlDataReader["StockPointTo"].ToString();
                }

                if (oSqlDataReader["Remarks"] != DBNull.Value)
                {
                    lblRemarks.Text = oSqlDataReader["Remarks"].ToString();
                }
            }

            oSqlDataReader.NextResult();

            dgGrid.DataSource = oSqlDataReader;
            dgGrid.DataBind();
        }
        oSqlDataReader.Close();
    }
    #endregion
    protected void btnPrint_Click(object sender, EventArgs e)
    {

    }
    protected void dgGrid_ItemDataBound(object sender, DataGridItemEventArgs e)
    {

    }

    #region btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        string sMsg = "";
        //sMsg = ValidateInput();
        if (sMsg == "")
        {
            ArrayList objArr = new ArrayList();
            objArr.Add(this.lblStTrnNo.Text.Trim());
            objArr.Add(this.txtCancelDate.Date.ToShortDateString().ToString().Trim());
            objArr.Add(this.txtCancelReason.Text.Trim());
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

            object tmpMsg = BLL.Transaction.StockTransfer.Operate(objArr, Request["Action"].ToString());
            LoadData(tmpMsg.ToString().Trim());
        }
        else
        {
            Utility.ShowMessage(this, sMsg);
        }
    }
    #endregion btnCancel_Click
}
