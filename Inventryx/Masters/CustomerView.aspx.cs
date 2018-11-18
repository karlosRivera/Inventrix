

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

public partial class CustomerView : BasePage
{

    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        {
            if (!Utility.IsUserLoggedIn())
            {
                Utility.RedirectToLoginPage("CustomerView.aspx");
            }
            else
            {
                CheckQString();
            }

            if (!IsPostBack)
            {
                string CustomerID = "";
                if (Request["Action"] == "V")
                {
                    if (Request["ID"] != null && Request["ID"] != "")
                    {
                        CustomerID = Request["ID"];
                        LoadData(CustomerID);
                    }
                }
            }
        }
    }
    # endregion

    # region LoadData

    private void LoadData(string CustomerID)
    {
        ArrayList ObjArrVal = new ArrayList();
        ObjArrVal.Add(CustomerID);
        ObjArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        ObjArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);

        SqlDataReader oDr = BLL.Master.Customer.GetDataForViewPage(ObjArrVal);

        while (oDr.Read())
        {
            if (oDr["CustomerID"] != DBNull.Value)
            {
                this.lblCustomerID.Text = oDr["CustomerID"].ToString();
            }

            if (oDr["CustomerName"] != DBNull.Value)
            {
                this.lblCustomerName.Text = oDr["CustomerName"].ToString();
            }

            if (oDr["BillingAddress"] != DBNull.Value)
            {
                this.lblBillingAddress.Text = oDr["BillingAddress"].ToString();
            }

            if (oDr["BillingCity"] != DBNull.Value)
            {
                this.lblBillingCity.Text = oDr["BillingCity"].ToString();
            }

            if (oDr["BillingPin"] != DBNull.Value)
            {
                this.lblBillingPin.Text = oDr["BillingPin"].ToString();
            }

            if (oDr["PhoneNo"] != DBNull.Value)
            {
                this.lblPhoneNo.Text = oDr["PhoneNo"].ToString();
            }

            if (oDr["MobileNo"] != DBNull.Value)
            {
                this.lblMobileNo.Text = oDr["MobileNo"].ToString();
            }

            if (oDr["FaxNo"] != DBNull.Value)
            {
                this.lblFaxNo.Text = oDr["FaxNo"].ToString();
            }

            if (oDr["URL"] != DBNull.Value)
            {
                this.lblURL.Text = oDr["URL"].ToString();
            }

            if (oDr["Email"] != DBNull.Value)
            {
                this.lblEmail.Text = oDr["Email"].ToString();
            }



            if (oDr["ContactPerson"] != DBNull.Value)
            {
                this.lblContactPerson.Text = oDr["ContactPerson"].ToString();
            }

            if (oDr["PersonDesignation"] != DBNull.Value)
            {
                this.lblPersonDesignation.Text = oDr["PersonDesignation"].ToString();
            }

            if (oDr["ShippingAddress"] != DBNull.Value)
            {
                this.lblShippingAddress.Text = oDr["ShippingAddress"].ToString();
            }

            if (oDr["ShippingCity"] != DBNull.Value)
            {
                this.lblShippingCity.Text = oDr["ShippingCity"].ToString();
            }

            if (oDr["ShippingPin"] != DBNull.Value)
            {
                this.lblShippingPin.Text = oDr["ShippingPin"].ToString();
            }

            if (oDr["PANNo"] != DBNull.Value)
            {
                this.lblPANNo.Text = oDr["PhoneNo"].ToString();
            }

            if (oDr["Remarks"] != DBNull.Value)
            {
                this.lblComments.Text = oDr["Remarks"].ToString();
            }

        }
        oDr.Close();
    }
    # endregion
}   
  
  

