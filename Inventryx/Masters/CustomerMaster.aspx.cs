

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

public partial class CustomerMaster : BasePage
{

    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("CustomerMaster.aspx");
        }
        else
        {
            CheckQString();
        }

        

        if (!IsPostBack)
        {
            txtCustomerName.Focus();
            this.chkCopyBillAddr.Attributes.Add("OnClick", "CopyBillAddress();");
            this.txtBillingAddress.Attributes.Add("onchange", "CopyBillAddress();");
            this.txtBillingCity.Attributes.Add("onchange", "CopyBillAddress();");
            this.txtBillingPin.Attributes.Add("onchange", "CopyBillAddress();");
            if (Request["Action"] == "A")
            {
                this.txtCustomerID.Text = "";
                this.lblTitle.Text = "Add New Customer Data";
            }
            else
            {
                this.lblTitle.Text = "Modify Customer Data";
                LoadData(Request["ID"]);
            }
        }
    }
    # endregion

    #region LoadData
    public void LoadData(string CustomerID)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(CustomerID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);

        oSqlDataReader = BLL.Master.Customer.FetchData(objArr, "MstCustomer_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["CustomerID"] != DBNull.Value)
                {
                    this.txtCustomerID.Text = oSqlDataReader["CustomerID"].ToString();
                }

                if (oSqlDataReader["CustomerName"] != DBNull.Value)
                {
                    this.txtCustomerName.Text = oSqlDataReader["CustomerName"].ToString();
                }

                if (oSqlDataReader["BillingAddress"] != DBNull.Value)
                {
                    this.txtBillingAddress.Text = oSqlDataReader["BillingAddress"].ToString();
                }

                if (oSqlDataReader["BillingCity"] != DBNull.Value)
                {
                    this.txtBillingCity.Text = oSqlDataReader["BillingCity"].ToString();
                }

                if (oSqlDataReader["BillingPin"] != DBNull.Value)
                {
                    this.txtBillingPin.Text = oSqlDataReader["BillingPin"].ToString();
                }

                if (oSqlDataReader["ShippingAddress"] != DBNull.Value)
                {
                    this.txtShippingAddress.Text = oSqlDataReader["ShippingAddress"].ToString();
                }
                if (oSqlDataReader["ShippingCity"] != DBNull.Value)
                {
                    this.txtShippingCity.Text = oSqlDataReader["ShippingCity"].ToString();
                }
                if (oSqlDataReader["ShippingPin"] != DBNull.Value)
                {
                    this.txtShippingPin.Text = oSqlDataReader["ShippingPin"].ToString();
                }

                if (oSqlDataReader["PhoneNo"] != DBNull.Value)
                {
                    this.txtPhoneNo.Text = oSqlDataReader["PhoneNo"].ToString();
                }

                if (oSqlDataReader["FaxNo"] != DBNull.Value)
                {
                    this.txtFaxNo.Text = oSqlDataReader["FaxNo"].ToString();
                }

                if (oSqlDataReader["PersonDesignation"] != DBNull.Value)
                {
                    this.txtPersonDesignation.Text = oSqlDataReader["PersonDesignation"].ToString();
                }

                if (oSqlDataReader["ContactPerson"] != DBNull.Value)
                {
                    this.txtContactPerson.Text = oSqlDataReader["ContactPerson"].ToString();
                }

                if (oSqlDataReader["MobileNo"] != DBNull.Value)
                {
                    this.txtMobileNo.Text = oSqlDataReader["MobileNo"].ToString();
                }
                if (oSqlDataReader["PANNo"] != DBNull.Value)
                {
                    this.txtPANNo.Text = oSqlDataReader["PANNo"].ToString();
                }
                if (oSqlDataReader["Email"] != DBNull.Value)
                {
                    this.txtEmail.Text = oSqlDataReader["Email"].ToString();
                }
                if (oSqlDataReader["Remarks"] != DBNull.Value)
                {
                    this.txtRemarks.Text = oSqlDataReader["Remarks"].ToString();
                }

                if (oSqlDataReader["URL"] != DBNull.Value)
                {
                    this.txtURL.Text = oSqlDataReader["URL"].ToString();
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
                    objArr.Add(this.txtCustomerID.Text.Trim());
                }

                objArr.Add(this.txtCustomerName.Text.Trim());
                objArr.Add(this.txtBillingAddress.Text.Trim());
                objArr.Add(this.txtBillingCity.Text.Trim());
                objArr.Add(this.txtBillingPin.Text.Trim());
                objArr.Add(this.txtPhoneNo.Text.Trim());
                objArr.Add(this.txtMobileNo.Text.Trim());
                objArr.Add(this.txtFaxNo.Text.Trim());
                objArr.Add(this.txtURL.Text.Trim());
                objArr.Add(this.txtEmail.Text.Trim());

                objArr.Add(this.txtContactPerson.Text.Trim());
                objArr.Add(this.txtPersonDesignation.Text.Trim());
                objArr.Add(this.txtShippingAddress.Text.Trim());
                objArr.Add(this.txtShippingCity.Text.Trim());
                objArr.Add(this.txtShippingPin.Text.Trim());
                objArr.Add(this.txtPANNo.Text.Trim());
                objArr.Add(this.txtRemarks.Text.Trim());
                

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);

                object tmpMsg = BLL.Master.Customer.Operate(objArr, Request["Action"].ToString());
                //Utility.ShowMessage(this, (string)tmpMsg);
                Response.Redirect("CustomerView.aspx?Action=V&ID=" + tmpMsg.ToString());
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
        if (this.txtCustomerName.Text.Trim() == "")
        {
            sMsg = "Customer Name can not be blank";
            return sMsg;
        }

        if (this.txtBillingAddress.Text.Trim() == "")
        {
            sMsg = "Billing Address can not be blank";
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
