

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

public partial class DepartmentView : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("DepartmentView.aspx");
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
    
    #region ForViewData
    public void LoadData(string DepartmentID)
    {
        #region INFO
        // IN VIEW MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion
       
        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(DepartmentID);
        oSqlDataReader = BLL.Master.Department.FetchData(objArr, "MstDepartment_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["DepartmentID"] != DBNull.Value)
                {
                    lblDepartmentID.Text = oSqlDataReader["DepartmentID"].ToString();
                }

                if (oSqlDataReader["DepartmentName"] != DBNull.Value)
                {
                    lblDepartmentName.Text = oSqlDataReader["DepartmentName"].ToString();
                }
            }
        }
        oSqlDataReader.Close();
    }
    #endregion
}
