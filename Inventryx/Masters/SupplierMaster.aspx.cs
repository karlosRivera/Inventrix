
# region DEVELOPED BY
    //this Master is developed by Indranil Roy
# endregion

using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class SupplierMaster :BasePage
{

    # region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("SupplierMaster.aspx");
        }
        else
        {
            CheckQString();
        }

        this.txtSupplierName.Focus();

        if (!IsPostBack)
        {
            
            if (Request["Action"] == "A")
            {
                this.txtSupplierID.Text = "";
                this.lblTitle.Text = "Add New Supplier Data";
            }
            else
            {
                this.lblTitle.Text = "Modify Supplier Data";
                LoadData(Request["ID"]);
            }
        }
    }
    # endregion

    #region LoadData
    public void LoadData(string SupplierID)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();

        objArr.Add(SupplierID);
        objArr.Add("");
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);

        oSqlDataReader = BLL.Master.Supplier.FetchData(objArr, "MstSupplierFrm_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["SupplierID"] != DBNull.Value)
                {
                    this.txtSupplierID.Text= oSqlDataReader["SupplierID"].ToString();
                }

                if (oSqlDataReader["SupplierName"] != DBNull.Value)
                {
                    this.txtSupplierName.Text= oSqlDataReader["SupplierName"].ToString();
                }
                if (oSqlDataReader["SupplierAddress"] != DBNull.Value)
                {
                    this.txtAddress.Text = oSqlDataReader["SupplierAddress"].ToString();
                }
                if (oSqlDataReader["PhoneNo"] != DBNull.Value)
                {
                    this.txtPhoneNo.Text = oSqlDataReader["PhoneNo"].ToString();
                }
                if (oSqlDataReader["MobileNo"] != DBNull.Value)
                {
                    this.txtMobileNo.Text = oSqlDataReader["MobileNo"].ToString();
                }
                if (oSqlDataReader["FaxNo"] != DBNull.Value)
                {
                    this.txtFaxNo.Text = oSqlDataReader["FaxNo"].ToString();
                }
                if (oSqlDataReader["ContactPerson"] != DBNull.Value)
                {
                    this.txtContactPerson.Text = oSqlDataReader["ContactPerson"].ToString();
                }
                if (oSqlDataReader["VATRegNo"] != DBNull.Value)
                {
                    this.txtVATRegNo.Text = oSqlDataReader["VATRegNo"].ToString();
                }
                if (oSqlDataReader["VATRegDate"] != DBNull.Value)
                {

                   this.txtVATRegDate.Date = Convert.ToDateTime(oSqlDataReader["VATRegDate"].ToString());
                }
                if (oSqlDataReader["PANNo"] != DBNull.Value)
                {
                    this.txtPANNo.Text = oSqlDataReader["PANNo"].ToString();
                }
                if (oSqlDataReader["Remarks"] != DBNull.Value)
                {
                    this.txtComments.Text = oSqlDataReader["Remarks"].ToString();
                }
                if (oSqlDataReader["Email"] != DBNull.Value)
                {
                    this.txtEmail.Text = oSqlDataReader["Email"].ToString();
                }
                if (oSqlDataReader["URL"] != DBNull.Value)
                {
                    this.txtURL.Text = oSqlDataReader["URL"].ToString();
                }

                if (oSqlDataReader["SupplierCity"] != DBNull.Value)
                {
                    this.txtCity.Text = oSqlDataReader["SupplierCity"].ToString();
                }

                if (oSqlDataReader["SupplierPin"] != DBNull.Value)
                {
                    this.txtPin.Text = oSqlDataReader["SupplierPin"].ToString();
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
                    objArr.Add(this.txtSupplierID.Text.Trim());
                }


                objArr.Add(this.txtSupplierName.Text.Trim());
                objArr.Add(this.txtAddress.Text.Trim());
                objArr.Add(this.txtCity.Text.Trim());
                objArr.Add(this.txtPin.Text.Trim());
                objArr.Add(this.txtPhoneNo.Text.Trim());
                objArr.Add(this.txtFaxNo.Text.Trim());
                objArr.Add(this.txtURL.Text.Trim());

                objArr.Add(this.txtContactPerson.Text.Trim());
                objArr.Add(this.txtPersonDesignation.Text.Trim());
                objArr.Add(this.txtMobileNo.Text.Trim());
                objArr.Add(this.txtEmail.Text.Trim());
                objArr.Add(this.txtVATRegNo.Text.Trim());
                objArr.Add(this.txtVATRegDate.DateString.Trim());
                objArr.Add(this.txtPANNo.Text.Trim());
                objArr.Add(this.txtComments.Text.Trim());
                
                

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);

                object tmpMsg = BLL.Master.Supplier.Operate(objArr, Request["Action"].ToString());
                //Utility.ShowMessage(this, (string)tmpMsg);
                Response.Redirect("SupplierView.aspx?Action=V&ID=" + tmpMsg.ToString());
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
        if (this.txtSupplierName.Text.Trim()=="")
        {
            sMsg = "Supplier Name can\\'t be blank";
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