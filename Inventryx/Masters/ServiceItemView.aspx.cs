
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

public partial class ServiceItemView : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("ServiceItemView.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            string sServiceItemID = "";
            if (Request["Action"] == "V")
            {
                if (Request["ID"] != null && Request["ID"] != "")
                {
                    sServiceItemID = Request["ID"];
                    LoadData(sServiceItemID);
                }
            }
        }
    }

    #region Fetch Data
    #region Info
    //THIS FUNCTION WILL FETCH DATA FROM HEADER AND DETAIL TABLE AND POPULATE THIS FORM
    #endregion

    private void LoadData(string sServiceItemID)
    {
        SqlDataReader oDr = BLL.Master.ServiceItem.GetDataForViewPage(sServiceItemID);
        while (oDr.Read())
        {
            if (oDr["ServiceItemID"] != DBNull.Value)
            {
                lblServiceItemID.Text = oDr["ServiceItemID"].ToString();
            }

            if (oDr["ServiceItemName"] != DBNull.Value)
            {
                lblServiceItemName.Text = oDr["ServiceItemName"].ToString();
            }
           
        }
        oDr.Close();
    }
    #endregion

}
