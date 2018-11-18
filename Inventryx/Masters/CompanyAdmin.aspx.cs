

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

public partial class CompanyAdmin : BasePage
{

    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("CompanyAdmin.aspx");
        }
        else
        {
            CheckQString();
        }
        this.txtCompanyName.Focus();
        if (!IsPostBack)
        {
            if (Request["Action"] == "A")
            {
                this.lblTitle.Text = "Add New Company Data";
            }
            else
            {
                this.lblTitle.Text = "Modify Company Data";
                LoadData(Request["ID"]);
            }
        }
    }
    # endregion

    #region LoadData
    public void LoadData(string CompanyID)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(CompanyID);
        oSqlDataReader = BLL.Master.Company.FetchData(objArr, "MstCompany_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["CompanyID"] != DBNull.Value)
                {
                    this.txtCompanyID.Text = oSqlDataReader["CompanyID"].ToString();
                }
                if (oSqlDataReader["CompanyName"] != DBNull.Value)
                {
                    this.txtCompanyName.Text = oSqlDataReader["CompanyName"].ToString();
                }
                if (oSqlDataReader["Addr"] != DBNull.Value)
                {
                    this.txtAddress.Text = oSqlDataReader["Addr"].ToString();
                }
                if (oSqlDataReader["City"] != DBNull.Value)
                {
                    this.txtCity.Text = oSqlDataReader["City"].ToString();
                }

                if (oSqlDataReader["Pin"] != DBNull.Value)
                {
                    this.txtPin.Text = oSqlDataReader["Pin"].ToString();
                }

                if (oSqlDataReader["ContactPerson"] != DBNull.Value)
                {
                    this.txtContactPerson.Text = oSqlDataReader["ContactPerson"].ToString();
                }

                if (oSqlDataReader["PersonDesignation"] != DBNull.Value)
                {
                    this.txtPersonDesignation.Text = oSqlDataReader["PersonDesignation"].ToString();
                }

                if (oSqlDataReader["PhoneNo"] != DBNull.Value)
                {
                    this.txtPhoneNo.Text = oSqlDataReader["PhoneNo"].ToString();
                }
                if (oSqlDataReader["FaxNo"] != DBNull.Value)
                {
                    this.txtFaxNo.Text = oSqlDataReader["PhoneNo"].ToString();
                }

                if (oSqlDataReader["Email"] != DBNull.Value)
                {
                    this.txtEmail.Text = oSqlDataReader["Email"].ToString();
                }

                if (oSqlDataReader["RegNo"] != DBNull.Value)
                {
                    this.txtRegNo.Text = oSqlDataReader["RegNo"].ToString();
                }

                if (oSqlDataReader["PFNo"] != DBNull.Value)
                {
                    this.txtPFNo.Text = oSqlDataReader["PFNo"].ToString();
                }

                if (oSqlDataReader["ESINo"] != DBNull.Value)
                {
                    this.txtESINo.Text = oSqlDataReader["ESINo"].ToString();
                }

                if (oSqlDataReader["PANNo"] != DBNull.Value)
                {
                    this.txtPANNo.Text = oSqlDataReader["PANNo"].ToString();
                }

                if (oSqlDataReader["CSTNo"] != DBNull.Value)
                {
                    this.txtCSTNo.Text = oSqlDataReader["CSTNo"].ToString();
                }

                if (oSqlDataReader["LSTNo"] != DBNull.Value)
                {
                    this.txtLSTNo.Text = oSqlDataReader["LSTNo"].ToString();
                }

                if (oSqlDataReader["URL"] != DBNull.Value)
                {
                    this.txtURL.Text = oSqlDataReader["URL"].ToString();
                }

                if (oSqlDataReader["ServTaxRegNo"] != DBNull.Value)
                {
                    this.txtServTaxRegNo.Text = oSqlDataReader["ServTaxRegNo"].ToString();
                }
                if (oSqlDataReader["ServTaxCode"] != DBNull.Value)
                {
                    this.txtServTaxCode.Text = oSqlDataReader["ServTaxCode"].ToString();
                }
                if (oSqlDataReader["ProfTaxECN"] != DBNull.Value)
                {
                    this.txtProfTaxECN.Text = oSqlDataReader["ProfTaxECN"].ToString();
                }

                if (oSqlDataReader["ProfTaxRCN"] != DBNull.Value)
                {
                    this.txtProfTaxRCN.Text = oSqlDataReader["ProfTaxECN"].ToString();
                }

                if (oSqlDataReader["ITTanNo"] != DBNull.Value)
                {
                    this.txtITTanNo.Text = oSqlDataReader["ITTanNo"].ToString();
                }
                if (oSqlDataReader["VATNo"] != DBNull.Value)
                {
                    this.txtVATNo.Text = oSqlDataReader["VATNo"].ToString();
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
                    objArr.Add(this.txtCompanyID.Text.Trim());
                }

                objArr.Add(this.txtCompanyName.Text.Trim());
                objArr.Add(this.txtAddress.Text.Trim());
                objArr.Add(this.txtCity.Text.Trim());
                objArr.Add(this.txtPin.Text.Trim());
                objArr.Add(this.txtContactPerson.Text.Trim());
                objArr.Add(this.txtPersonDesignation.Text.Trim());
                objArr.Add(this.txtPhoneNo.Text.Trim());
                objArr.Add(this.txtFaxNo.Text.Trim());
                objArr.Add(this.txtEmail.Text.Trim());
                
                objArr.Add(this.txtServTaxRegNo.Text.Trim());
                objArr.Add(this.txtServTaxCode.Text.Trim());
                objArr.Add(this.txtProfTaxECN.Text.Trim());
                objArr.Add(this.txtProfTaxRCN.Text.Trim());
                objArr.Add(this.txtITTanNo.Text.Trim());
                objArr.Add(this.txtVATNo.Text.Trim());

                objArr.Add(this.txtRegNo.Text.Trim());
                objArr.Add(this.txtPFNo.Text.Trim());
                objArr.Add(this.txtESINo.Text.Trim());
                objArr.Add(this.txtPANNo.Text.Trim());
                objArr.Add(this.txtCSTNo.Text.Trim());
                objArr.Add(this.txtLSTNo.Text.Trim());
                objArr.Add(this.txtURL.Text.Trim());

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);

                //objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                //objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

                object tmpMsg = BLL.Master.Company.Operate(objArr, Request["Action"].ToString());
                //Utility.ShowMessage(this, (string)tmpMsg);
                Response.Redirect("CompanyView.aspx?Action=V&ID=" + tmpMsg.ToString());
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
        if (this.txtCompanyName.Text.Trim() == "")
        {
            sMsg = "Company Name can\\'t be blank";
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

}