

# region DEVELOPED BY
//this Master is developed By Indranil Roy.
# endregion

using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class BranchAdmin : BasePage
{

    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("BranchAdmin.aspx");
        }
        else
        {
            CheckQString();
        }
        this.txtBranchName.Focus();
        if (!IsPostBack)
        {
            this.btnSave.Attributes.Add("OnClick", "TabOrder('" + this.btnSave.ClientID + "');");
            
            if (Request["Action"] == "A")
            {
                this.txtBranchID.Text = "";
                this.lblTitle.Text = "Add New Branch Data";
                PopulateCombo(this.ddCompany, "CompanyName", "CompanyID", "MstFrmCompany_Select", "");
                
            }
            else
            {
                this.lblTitle.Text = "Modify Branch Data";
                LoadData(Request["ID"]);
            }
        }
    }
    # endregion

    #region LoadData
    public void LoadData(string BranchID)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add("");
        objArr.Add(BranchID);
        objArr.Add("");
        oSqlDataReader = BLL.Master.Branch.FetchData(objArr, "MstBranch_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["BranchID"] != DBNull.Value)
                {
                    this.txtBranchID.Text = oSqlDataReader["BranchID"].ToString();
                }

                if (oSqlDataReader["BranchName"] != DBNull.Value)
                {
                    this.txtBranchName.Text = oSqlDataReader["BranchName"].ToString();
                }

                PopulateCombo(this.ddCompany, "CompanyName", "CompanyID", "MstFrmCompany_Select", (string)(oSqlDataReader["CompanyID"]));

                if (oSqlDataReader["Addr"] != DBNull.Value)
                {
                    this.txtBranchAddress.Text = oSqlDataReader["Addr"].ToString();
                }
                if (oSqlDataReader["City"] != DBNull.Value)
                {
                    this.txtCity.Text = oSqlDataReader["City"].ToString();
                }
                if (oSqlDataReader["Pin"] != DBNull.Value)
                {
                    this.txtPin.Text = oSqlDataReader["Pin"].ToString();
                }
                if (oSqlDataReader["MobileNo"] != DBNull.Value)
                {
                    this.txtPin.Text = oSqlDataReader["MobileNo"].ToString();
                }

                if (oSqlDataReader["PhoneNo"] != DBNull.Value)
                {
                    this.txtPhoneNo.Text = oSqlDataReader["PhoneNo"].ToString();
                }

                if (oSqlDataReader["FaxNo"] != DBNull.Value)
                {
                    this.txtFaxNo.Text = oSqlDataReader["FaxNo"].ToString();
                }

                if (oSqlDataReader["Email"] != DBNull.Value)
                {
                    this.txtEmail.Text = oSqlDataReader["Email"].ToString();
                }

                if (oSqlDataReader["ContactPerson"] != DBNull.Value)
                {
                    this.txtContactPerson.Text = oSqlDataReader["ContactPerson"].ToString();
                }

                if (oSqlDataReader["PersonDesignation"] != DBNull.Value)
                {
                    this.txtPersonDesignation.Text = oSqlDataReader["PersonDesignation"].ToString();
                }

            }
        }
        oSqlDataReader.Close();
    }
    #endregion

    # region btnSave_Click
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
                if (Request["Action"] == "A")
                {
                    objArr.Add("");
                }
                else
                {
                    objArr.Add(this.txtBranchID.Text.Trim());
                }

                objArr.Add(this.txtBranchName.Text.Trim());
                objArr.Add(this.ddCompany.SelectedValue.Trim());
                objArr.Add(this.txtBranchAddress.Text.Trim());
                objArr.Add(this.txtCity.Text.Trim());
                objArr.Add(this.txtPin.Text.Trim());
                objArr.Add(this.txtContactPerson.Text.Trim());
                objArr.Add(this.txtPersonDesignation.Text.Trim());
                objArr.Add(this.txtMobileNo.Text.Trim());
                objArr.Add(this.txtPhoneNo.Text.Trim());
                objArr.Add(this.txtFaxNo.Text.Trim());
                objArr.Add(this.txtEmail.Text.Trim());
               
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                //objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                //objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

                object tmpMsg = BLL.Master.Branch.Operate(objArr, Request["Action"].ToString());
                //Utility.ShowMessage(this, (string)tmpMsg);
                Response.Redirect("BranchView.aspx?Action=V&ID=" + tmpMsg.ToString());
            }
            else
            {
                Utility.ShowMessage(this, sMsg);
            }
        }
    }
    # endregion

    #region ValidateInput
    public string ValidateInput()
    {
        #region INFO
        //THIS FUNCTION WILL VALIDATE DATA BEFORE INSERTING OR UPDATION DATA TO THE TABLE
        #endregion
        string sMsg = "";
        if (this.txtBranchName.Text.Trim() == "")
        {
            sMsg = "Branch Name can\\'t be blank";
            return sMsg;
        }

        if (Convert.ToInt32(this.ddCompany.SelectedValue) == -1)
        {
            sMsg = "Please Select Company Name";
            return sMsg;
        }

        if (this.txtEmail.Text.Trim() != "")
        {
            string RegEx = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
             @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
             @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
            Regex re = new Regex(RegEx);
            if (!re.IsMatch(this.txtEmail.Text.Trim()))
            {
                sMsg = "Email is not in correct format";
                return sMsg;
            }
        }

        return sMsg;
    }
    #endregion

    # region PopulateCombo
    private void PopulateCombo(DropDownList ddControl, string FieldName, string FieldID, string spName, string ID)
    {
        SqlDataReader oDr;
        oDr = BLL.Master.Branch.GetComboData(spName);
        ddControl.Items.Clear();
        ddControl.Items.Add(new ListItem("-- Select --", "-1"));
        int Cnt = 1;
        while (oDr.Read())
        {
            ddControl.Items.Add(new ListItem((string)(oDr[FieldName]), (string)(oDr[FieldID])));

            if (ID != "")
            {
                if ((string)(oDr[FieldID]) == ID)
                {
                    ddControl.SelectedIndex = Cnt;
                }
                Cnt += 1;
            }
        }
        if (!oDr.IsClosed)
        { oDr.Close(); }
    }
    # endregion

}
