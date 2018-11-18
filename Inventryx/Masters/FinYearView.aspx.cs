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

public partial class FinYearView : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("FinYearView.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            if (Request["Action"] == "V")
            {
                LoadData(Request["ID"]);
            }
        }
    }

    #region LoadData
    public void LoadData(string UserID)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(Request["ID"]);
        oSqlDataReader = BLL.Master.FinYear.FetchData(objArr, "MstAdminFinYear_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["FinYearID"] != DBNull.Value)
                {
                    lblFinYr.Text = oSqlDataReader["FinYearID"].ToString();
                }

                if (oSqlDataReader["StartDate"] != DBNull.Value)
                {
                    lblStartDate.Text = Convert.ToDateTime(oSqlDataReader["StartDate"].ToString()).ToString("dd/MM/yyyy");
                }

                if (oSqlDataReader["EndDate"] != DBNull.Value)
                {
                    lblEndDate.Text = Convert.ToDateTime(oSqlDataReader["EndDate"].ToString()).ToString("dd/MM/yyyy");
                }
            }
        }
        oSqlDataReader.Close();
    }
    #endregion
}
