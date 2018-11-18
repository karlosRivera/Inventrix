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

public partial class StockPointView : BasePage
{
    #region LoadData
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("PurchaseOrderView.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            string sStockPointID = "";
            if (Request["Action"] == "V")
            {
                if (Request["ID"] != null && Request["ID"] != "")
                {
                    sStockPointID = Request["ID"];
                    LoadData(sStockPointID);
                }
            }
        }
    }
    #endregion

    #region LoadData
    #region Info
    //THIS FUNCTION WILL FETCH DATA FROM HEADER AND DETAIL TABLE AND POPULATE THIS FORM
    #endregion

    private void LoadData(string sStockPointID)
    {
        SqlDataReader oDr = BLL.Master.StockPoint.GetDataForViewPage(sStockPointID);
        while (oDr.Read())
        {
            if (oDr["StockPointID"] != DBNull.Value)
            {
                lblStockPointID.Text = oDr["StockPointID"].ToString();
            }

            if (oDr["StockPointName"] != DBNull.Value)
            {
                lblStockPointName.Text = oDr["StockPointName"].ToString();
            }

            if (oDr["StockPointType"] != DBNull.Value)
            {
                if (oDr["StockPointType"].ToString().ToUpper() == "V")
                {
                    lblStockPointType.Text = "Van";
                }
                else if (oDr["StockPointType"].ToString().ToUpper() == "W")
                {
                    lblStockPointType.Text = "Warehouse";
                }
            }
        }
        oDr.Close();
    }
    #endregion

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Response.Redirect("../ViewReport.aspx?ModID=" + GetModuleID() + "&Tag=1&ID=" + lblStockPointID.Text.Trim());
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("StockPoint.aspx");
    }
}
