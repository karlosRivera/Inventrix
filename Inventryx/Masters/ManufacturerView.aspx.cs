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

public partial class Masters_ManufacturerView : BasePage
{
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
            string sManufacturerID = "";
            if (Request["Action"] == "V")
            {
                if (Request["ID"] != null && Request["ID"] != "")
                {
                    sManufacturerID = Request["ID"];
                    LoadData(sManufacturerID);
                }
            }
        }
    }

    #region LoadData
    #region Info
    //THIS FUNCTION WILL FETCH DATA FROM HEADER AND DETAIL TABLE AND POPULATE THIS FORM
    #endregion

    private void LoadData(string sManufacturerID)
    {
        SqlDataReader oDr = BLL.Master.Manufacturer.GetDataForViewPage(sManufacturerID);
        while (oDr.Read())
        {
            if (oDr["ManufacturerID"] != DBNull.Value)
            {
                lblManufacturerID.Text = oDr["ManufacturerID"].ToString();
            }

            if (oDr["ManufacturerName"] != DBNull.Value)
            {
                lblManufacturerName.Text = oDr["ManufacturerName"].ToString();
            }
        }
        oDr.Close();
    }
    #endregion
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Report.aspx?ModID=" + GetModuleID() + "&Tag=1&ID=" + lblManufacturerID.Text.Trim());
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manufacturer.aspx");
    }
}
