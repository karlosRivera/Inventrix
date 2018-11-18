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

public partial class UserMaster : BasePage 
{

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("UserMaster.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            txtUserID.Focus();
            User oUser = new User();
            PopulateCombo(oUser.GetComboData("MstUserTypeFrontEnd_Select"), ddlUserType, "UserTypeName", "", "UserTypeID", "");

            if (Request["Action"] == "A")
            {
                txtUserID.Text = "";
                txtUserID.Enabled = true;
                lblTitle.Text = "Add New User Data";
            }
            else
            {
                lblTitle.Text = "Modify User Data";
                txtUserID.Enabled = false;
                LoadData(Request["ID"]);
            }
        }
    }
    #endregion
    #region PopulateCombo
    private static void PopulateCombo(SqlDataReader oDr, System.Web.UI.WebControls.DropDownList ddlCom, string DataTextField1, string DataTextField2, string DataValueField, string Initialtext)
    {
        #region Info
        //THIS FUNCTION WILL POPULATE DROPDOWN WITH DATA FROM DATABASE TABLE
        #endregion

        string sTempText = "", sTempValue = "";
        ddlCom.Items.Clear();
        ddlCom.SelectedIndex = -1;

        if (Initialtext.Trim() == "")
        {
            ddlCom.Items.Add(new ListItem("--Select One--", System.DBNull.Value.ToString()));
        }
        else
        {
            ddlCom.Items.Add(new ListItem(Initialtext.Trim(), System.DBNull.Value.ToString()));
        }

        while (oDr.Read())
        {
            if (DataTextField2.Trim() != "")
            {
                sTempText = oDr[DataTextField1.ToString()] + " [" + oDr[DataTextField2.ToString()] + "]";
                sTempValue = oDr[DataValueField.ToString()].ToString();
                ddlCom.Items.Add(new ListItem(sTempText, sTempValue));
            }
            else
            {
                sTempText = oDr[DataTextField1.ToString()].ToString();
                sTempValue = oDr[DataValueField.ToString()].ToString();
                ddlCom.Items.Add(new ListItem(sTempText, sTempValue));
            }
        }

        if (!oDr.IsClosed)
        {
            oDr.Close();
        }
    }
     #endregion

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
                    txtUserID.Text = oSqlDataReader["UserID"].ToString();
                }

                if (oSqlDataReader["UserName"] != DBNull.Value)
                {
                    txtUserName.Text = oSqlDataReader["UserName"].ToString();
                }

                if (oSqlDataReader["UserPWD"] != DBNull.Value)
                {
                    txtPwd.Text = oSqlDataReader["UserPWD"].ToString();
                }

                if (oSqlDataReader["UserTypeID"] != DBNull.Value)
                {
                    ddlUserType.Items.FindByValue(oSqlDataReader["UserTypeID"].ToString()).Selected = true;
                }

                if (oSqlDataReader["DisableTag"] != DBNull.Value)
                {
                    if (oSqlDataReader["DisableTag"].ToString() == "Y")
                    {
                        chkDisable.Checked = true;
                    }
                    else
                    {
                        chkDisable.Checked = false;
                    }
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
        
        if (Request["Action"] == "A" || Request["Action"] == "E")
        {
            string sMsg;
            sMsg = ValidateInput();
            if (sMsg == "")
            {
                ArrayList objArr = new ArrayList();
                objArr.Add(txtUserID.Text.Trim());
                objArr.Add(txtUserName.Text.Trim());
                objArr.Add(txtPwd.Text.Trim());
                objArr.Add(ddlUserType.SelectedValue);
                objArr.Add((chkDisable.Checked ? "Y" : "N"));
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                User oUser=new User();
                object tmpMsg = oUser.Operate(objArr, Request["Action"].ToString());
                if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
                {
                    Utility.ShowMessage(this, tmpMsg.ToString());
                }
                else
                {
                    Response.Redirect("UserMasterView.aspx?Action=V&ID=" + tmpMsg.ToString());
                }
            }
            else
            {
                Utility.ShowMessage(this, sMsg);
            }
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
        if (txtUserID.Text.Trim() == "")
        {
            sMsg = "User ID can\\'t be blank";
            return sMsg;
        }

        if (txtUserName.Text.Trim() == "")
        {
            sMsg = "User Name can\\'t be blank";
            return sMsg;
        }

        if (txtPwd.Text.Trim() == "")
        {
            sMsg = "Password can\\'t be blank";
            return sMsg;
        }

        if (ddlUserType.SelectedValue == DBNull.Value.ToString())
        {
            sMsg = "Select User type";
            return sMsg;
        }
        return sMsg;
    }
    #endregion

}
