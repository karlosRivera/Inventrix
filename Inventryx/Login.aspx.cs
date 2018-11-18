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

namespace InventryxLogin
{
    public partial class Login : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlBranch.Enabled = false;
                txtUserId.Focus();
                LoadCompany();
                LoadFinYr();
            }
        }

        #region LoadCompany
        #region Notes
        //POPULATE COMPANY COMBO
        #endregion
        private void LoadCompany()
        {
            SqlDataReader oDr = BLL.Master.Company.LoadCompany();
            ddlCompany.Items.Clear();
            ddlCompany.SelectedIndex = -1;

            ddlCompany.Items.Add(new ListItem("---Select---", "-1"));
            while (oDr.Read())
            {
                ddlCompany.Items.Add(new ListItem(oDr["CompanyName"].ToString(), oDr["CompanyID"].ToString()));
            }
            oDr.Close();

        }
        #endregion

        #region LoadBranch
        #region Notes
        //POPULATE BRANCH COMBO
        #endregion
        private void LoadBranch(string sCompanyID)
        {
            ArrayList oArr = new ArrayList();
            oArr.Add(sCompanyID);
            SqlDataReader oDr = BLL.Master.Branch.FetchData(oArr, "MstLoadBranch_Select");
            ddlBranch.Items.Clear();
            ddlBranch.SelectedIndex = -1;

            ddlBranch.Items.Add(new ListItem("---Select---", "-1"));
            while (oDr.Read())
            {
                ddlBranch.Items.Add(new ListItem(oDr["BranchName"].ToString(), oDr["BranchID"].ToString()));
            }
            oDr.Close();
            ddlBranch.Enabled = true;
        }
        #endregion

        #region LoadFinYr
        #region Notes
        //POPULATE FINANCIAL YEAR IN A COMBO
        #endregion
        private void LoadFinYr()
        {
            SqlDataReader oDr = BLL.Master.FinYear.LoadFinYr();
            ddlFinYr.Items.Clear();
            ddlFinYr.SelectedIndex = -1;

            ddlFinYr.Items.Add(new ListItem("---Select---", "-1"));
            while (oDr.Read())
            {
                ddlFinYr.Items.Add(new ListItem(oDr["FinYr"].ToString(), oDr["FinYearID"].ToString()));
            }
            oDr.Close();
        }
        #endregion

        #region btnLogin_Click
        #region Notes
        /*
    HERE CHECKING USER ID AND PASSWORD AGAINST DATABASE FOR SUCCESSFULLY LOGIN
    IF LOGIN SUCCESSFULLY THEN USEWISE MODULES WISE RIGHTS WILL BE STORED IN A SESSION AND THEN
    CONTROL WILL REDIRECT TO ANOTHER PAGE OTHERWISE DISPLAY ERROR MSG BELOW.
    */
        #endregion
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string sTmpValue = "", sHOBranchID = "";
            SqlDataReader oDr = null;
            if (Page.IsValid)
            {
                if (ddlCompany.SelectedValue != "-1")
                {
                    if (ddlBranch.SelectedValue != "-1")
                    {
                        if (ddlFinYr.SelectedValue != "-1")
                        {
                            if (txtUserId.Text.Trim() != "" && txtPwd.Text.Trim() != "")
                            {
                                User oUser = new User();
                                sTmpValue = (string)oUser.Login(txtUserId.Text.Trim(), txtPwd.Text.Trim());
                                if (sTmpValue.Trim() == "Y")
                                {
                                    ArrayList oArr = new ArrayList();
                                    oArr.Add(ddlCompany.SelectedValue.ToString());
                                    oDr = oUser.GetData(oArr, "MstHOBranch_Select");
                                    while (oDr.Read())
                                    {
                                        if (oDr["BranchID"] != DBNull.Value)
                                        {
                                            sHOBranchID = oDr["BranchID"].ToString();
                                        }
                                    }
                                    oDr.Dispose();
                                    Utility.StoreProfileInfo(txtUserId.Text.Trim(), ddlCompany.SelectedValue.ToString(), ddlBranch.SelectedValue.ToString(), sHOBranchID, ddlFinYr.SelectedValue);
                                    Utility.StoreRightsInfo(txtUserId.Text.Trim());
                                    FormsAuthentication.SetAuthCookie(txtUserId.Text.Trim(), false);

                                    if (Request.QueryString["ReturnUrl"] != null)
                                    {
                                        FormsAuthentication.RedirectFromLoginPage(txtUserId.Text.Trim(), false);
                                    }
                                    else
                                    {
                                        Response.Redirect("index.aspx");
                                    }
                                }
                                else if (sTmpValue.Trim() == "N")
                                {
                                    Utility.ShowMessage(this, "Please check....invalid user id or password");
                                }
                            }
                            else
                            {
                                Utility.ShowMessage(this, "Please enter user id and password");
                            }
                        }
                        else
                        {
                            Utility.ShowMessage(this, "Please select financial year");
                        }
                    }
                    else
                    {
                        Utility.ShowMessage(this, "Please select branch");
                    }
                }
                else
                {
                    Utility.ShowMessage(this, "Please select company");
                }
            }
        }
        #endregion
        protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCompany.SelectedValue != "-1")
            {
                string sPwd = txtPwd.Text.Trim();
                txtPwd.Attributes.Add("value", sPwd);
                LoadBranch(ddlCompany.SelectedValue.ToString());
                ddlBranch.Focus();
            }
        }
    }
}