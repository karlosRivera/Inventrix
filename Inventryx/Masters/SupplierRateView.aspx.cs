
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

public partial class SupplierRateView :BasePage
{
    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        {
            if (!Utility.IsUserLoggedIn())
            {
                Utility.RedirectToLoginPage("SupplierRateView.aspx");
            }
            else
            {
                CheckQString();
            }
            if (!IsPostBack)
            {
                string SupplierRateID = "";
                if (Request["Action"] == "V")
                {
                    if (Request["ID"] != null && Request["ID"] != "")
                    {
                        SupplierRateID = Request["ID"];
                        LoadData(SupplierRateID);
                    }
                }
            }
        }
    }
    # endregion

    # region LoadData

    private void LoadData(string SupplierRateID)
    {
        SqlDataReader oDr = BLL.Master.SupplierRate.GetDataForViewPage(SupplierRateID,"V");

        while (oDr.Read())
        {
            if (oDr["SupplierRateID"] != DBNull.Value)
            {
                this.lbSupplierRateID.Text = oDr["SupplierRateID"].ToString();
            }

            if (oDr["SupplierName"] != DBNull.Value)
            {
                this.lblSupplierName.Text = oDr["SupplierName"].ToString();
            }

            if (oDr["ProductName"] != DBNull.Value)
            {
                this.lblProductName.Text = oDr["ProductName"].ToString();
            }

            if (oDr["EffectiveDate"] != DBNull.Value)
            {
                this.lblEffectiveDate.Text = oDr["EffectiveDate"].ToString();
            }
            if (oDr["SupplierRate"] != DBNull.Value)
            {
                this.lblSupplierRate.Text = oDr["SupplierRate"].ToString();
            }

        }
        oDr.Close();
    }
    # endregion
}
