
// Developed by Swarnali Datta //

using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class ProductView : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("ProductView.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            string sProductID = "";
            if (Request["Action"] == "V")
            {
                if (Request["ID"] != null && Request["ID"] != "")
                {
                    sProductID = Request["ID"];
                    LoadData(sProductID);
                }
            }
        }
    }

    #region LoadData
    #region Info
    //THIS FUNCTION WILL FETCH DATA FROM HEADER AND DETAIL TABLE AND POPULATE THIS FORM
    #endregion

    private void LoadData(string sProductID)
    {
        SqlDataReader oDr = BLL.Master.Product.GetDataForViewPage(sProductID);
        while (oDr.Read())
        {
            if (oDr["ProductID"] != DBNull.Value)
            {
                lblProductID.Text = oDr["ProductID"].ToString();
            }

            if (oDr["ProductName"] != DBNull.Value)
            {
                lblProductName.Text = oDr["ProductName"].ToString();
            }

            if (oDr["ProductSpec"] != DBNull.Value)
            {
                lblProductSpec.Text = oDr["ProductSpec"].ToString();
            }

            if (oDr["ProductGroupName"] != DBNull.Value)
            {
                lblProductGroup.Text = oDr["ProductGroupName"].ToString();
            }

            if (oDr["ManufacturerName"] != DBNull.Value)
            {
                lblManufacturer.Text = oDr["ManufacturerName"].ToString();
            }

            if (oDr["ProductUOM"] != DBNull.Value)
            {
                lblProductUOM.Text = oDr["ProductUOM"].ToString();
            }

            if (oDr["ReorderLevel"] != DBNull.Value)
            {
                lblReOrderLevel.Text = oDr["ReorderLevel"].ToString();
            }
            
        }
        oDr.Close();
    }
    #endregion
}
