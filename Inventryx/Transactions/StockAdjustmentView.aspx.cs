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

public partial class Transactions_StockAdjustmentView : System.Web.UI.Page
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("StockAdjustmentView.aspx");
        }

        if (!IsPostBack)
        {

            string sStockAdjustmentNo = "";

            if (Request["Action"] == "C")
            {
                this.pnlInvCancel.Visible = true;
                this.btnCancel.Visible = true;
            }
            if (Request["ID"] != null && Request["ID"] != "")
            {
                sStockAdjustmentNo = Request["ID"];
                LoadData(sStockAdjustmentNo);
            }
        }
    }
    #endregion Page_Load

    #region LoadData
    #region Info
    //THIS FUNCTION WILL FETCH DATA FROM HEADER AND DETAIL TABLE AND POPULATE THIS FORM
    #endregion
    private void LoadData(string sStockAdjustmentNo)
    {

        ArrayList objArrVal = new ArrayList();

        //objArrVal.Add("");
        objArrVal.Add(sStockAdjustmentNo);
        objArrVal.Add("V");
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

        SqlDataReader oDr = BLL.Transaction.StockAdjustment.GetDataForViewPage(objArrVal);
        while (oDr.Read())
        {
            if (oDr["StockAdjustmentNo"] != DBNull.Value)
            {
                this.lblStockAdjustmentNo.Text = oDr["StockAdjustmentNo"].ToString();
            }
            if (oDr["StockAdjustmentDate"] != DBNull.Value)
            {
                this.lblStockAdDate.Text = oDr["StockAdjustmentDate"].ToString();
            }

            if (oDr["StockPointName"] != DBNull.Value)
            {
                this.lblStockAdjustmentDate.Text = oDr["StockPointName"].ToString();
            }
            if (oDr["ProductName"] != DBNull.Value)
            {
                this.lblProduct.Text = oDr["ProductName"].ToString();
            }
            if (oDr["Remarks"] != DBNull.Value)
            {
                this.lblRemarks.Text = oDr["Remarks"].ToString();
            }
            if (oDr["BookStockQty"] != DBNull.Value)
            {
                this.lblBookStock.Text = oDr["BookStockQty"].ToString();
            }

            if (oDr["PhysicalStockQty"] != DBNull.Value)
            {
                this.lblPhysicalStock.Text = oDr["PhysicalStockQty"].ToString();
            }

        }
        oDr.NextResult();
        this.dgList.DataSource = oDr;
        this.dgList.DataBind();
        oDr.Close();
    }
    #endregion

    #region btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        string sMsg="";
        //sMsg = ValidateInput();
        if (sMsg == "")
        {
            ArrayList objArr = new ArrayList();
            objArr.Add(this.lblStockAdjustmentNo.Text.Trim());
            objArr.Add(this.txtCancelDate.Date.ToShortDateString().ToString().Trim());
            objArr.Add(this.txtCancelReason.Text.Trim());
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

            object tmpMsg = BLL.Transaction.StockAdjustment.Operate(objArr, Request["Action"].ToString());
            LoadData(tmpMsg.ToString().Trim());
        }
        else
        {
            Utility.ShowMessage(this, sMsg);
        }
    }
    #endregion btnCancel_Click
}
