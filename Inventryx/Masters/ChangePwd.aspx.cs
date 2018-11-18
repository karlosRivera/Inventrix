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

public partial class ChangePwd : BasePage
{

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("ChangePwd.aspx");
        }

        if (!IsPostBack)
        {
            lblTitle.Text = "Change Password";
            LoadData(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
        }
    }
    #endregion


    #region LoadData
    public void LoadData(string UserID)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        User oUser = new User();
        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(UserID);
        oSqlDataReader = oUser.GetData(objArr, "MstUserPwd_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["UserPWD"] != DBNull.Value)
                {
                    txtOldPwd.Text = oSqlDataReader["UserPWD"].ToString();
                }
            }
        }
        oSqlDataReader.Close();
    }
    #endregion

    #region btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region INFO
        // THIS FUNCTION WILL ACTUALLY INSERT DATA AND UPDATE DATA IN THE TABLE THROUGH STORE PROCEDURE
        #endregion
        User oUser = new User();
        string sMsg;
        sMsg = ValidateInput();
        if (sMsg == "")
        {
            ArrayList objArr = new ArrayList();
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
            objArr.Add(txtNewPwd.Text.Trim());
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);

            object tmpMsg = oUser.Operate(objArr, "U");
            if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
            {
                Utility.ShowMessage(this, tmpMsg.ToString());
            }
            else
            {
                Utility.ShowMessage(this, "Data Saved Successfully");
                Response.Redirect("Index.aspx");
            }
        }
        else
        {
            Utility.ShowMessage(this, sMsg);
        }
    }
    #endregion

    #region ValidateInput
    public string ValidateInput()
    {
        #region INFO
        //THIS FUNCTION WILL VALIDATE DATA BEFORE INSERTING OR UPDATION DATA TO THE TABLE
        #endregion

        string sMsg = "";
        if (txtNewPwd.Text.Trim() == "")
        {
            sMsg = "New password can\\'t be blank";
            return sMsg;
        }

        if (txtConfirmPwd.Text.Trim() == "1")
        {
            sMsg = "Confirm password can\\'t be blank";
            return sMsg;
        }

        if (txtConfirmPwd.Text.Trim() != txtNewPwd.Text.Trim())
        {
            sMsg = "New password and confirm password must be same";
            return sMsg;
        }

        return sMsg;
    }
    #endregion

}
