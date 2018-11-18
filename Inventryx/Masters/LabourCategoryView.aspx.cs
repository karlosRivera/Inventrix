

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

public partial class LabourCategoryView : BasePage
{

    # region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("LabourCategoryView.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            if (Request["Action"] == "V")
            {
                lblTitle.Text = "View Labour Category Data";
                LoadData(Request["ID"]);
            }
        }
    }
    # endregion

    #region ForViewData
    public void LoadData(string LabourCategoryID)
    {
        #region INFO
        // IN VIEW MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(LabourCategoryID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);

        oSqlDataReader = BLL.Master.LabourCategory.FetchData(objArr, "MstLabourCategory_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["LabourCategoryID"] != DBNull.Value)
                {
                    lblLabourCategoryID.Text = oSqlDataReader["LabourCategoryID"].ToString();
                }

                if (oSqlDataReader["LabourCategoryName"] != DBNull.Value)
                {
                    lblLabourCategoryName.Text = oSqlDataReader["LabourCategoryName"].ToString();
                }
                if (oSqlDataReader["HourlyRate"] != DBNull.Value)
                {
                    lblHourlyRate.Text = oSqlDataReader["HourlyRate"].ToString();
                }
            }
        }
        oSqlDataReader.Close();
    }
    #endregion
}
