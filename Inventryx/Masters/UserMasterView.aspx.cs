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

public partial class UserMasterView : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("UserMasterView.aspx");
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
        objArr.Add(UserID);
        oSqlDataReader = BLL.Master.StockPoint.FetchData(objArr, "MstUserFrontEnd_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["UserID"] != DBNull.Value)
                {
                    lblUserID.Text = oSqlDataReader["UserID"].ToString();
                }

                if (oSqlDataReader["UserName"] != DBNull.Value)
                {
                    lblUserName.Text = oSqlDataReader["UserName"].ToString();
                }

                if (oSqlDataReader["UserPWD"] != DBNull.Value)
                {
                    lblPwd.Text = oSqlDataReader["UserPWD"].ToString();
                }

                if (oSqlDataReader["UserTypeName"] != DBNull.Value)
                {
                    lblUserType.Text = oSqlDataReader["UserTypeName"].ToString();
                }

                if (oSqlDataReader["DisableTag"] != DBNull.Value)
                {
                    if (oSqlDataReader["DisableTag"].ToString() == "Y")
                    {
                        lblDisable.Text = "Yes";
                    }
                    else
                    {
                        lblDisable.Text = "No";
                    }
                }
            }
        }
        oSqlDataReader.Close();
    }
    #endregion
}
