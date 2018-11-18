

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

public partial class SupplierView : BasePage
{

    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("SupplierView.aspx");
        }
        else
        {
            CheckQString();
        }
        if (!IsPostBack)
        {
            string SupplierID = "";
            if (Request["Action"] == "V")
            {
                if (Request["ID"] != null && Request["ID"] != "")
                {
                    SupplierID = Request["ID"];
                    LoadData(SupplierID);
                }
            }
        }
    }
    # endregion

    # region LoadData
    private void LoadData(string SupplierID)
    {
        ArrayList objArr = new ArrayList();

        objArr.Add(SupplierID);
        objArr.Add("V");
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);

        SqlDataReader oDr = BLL.Master.Supplier.GetDataForViewPage(objArr);

        while (oDr.Read())
        {
            if (oDr["SupplierID"] != DBNull.Value)
            {
                this.lblSupplierID.Text = oDr["SupplierID"].ToString();
            }

            if (oDr["SupplierName"] != DBNull.Value)
            {
                this.lblSupplierName.Text = oDr["SupplierName"].ToString();
            }

            if (oDr["SupplierAddress"] != DBNull.Value)
            {
                this.lblAddress.Text = oDr["SupplierAddress"].ToString();
            }

            if (oDr["SupplierCity"] != DBNull.Value)
            {
                this.lblCity.Text = oDr["SupplierCity"].ToString();
            }

            if (oDr["SupplierPin"] != DBNull.Value)
            {
                this.lblPin.Text = oDr["SupplierPin"].ToString();
            }

            if (oDr["FaxNo"] != DBNull.Value)
            {
                this.lblFaxNo.Text = oDr["FaxNo"].ToString();
            }

            if (oDr["URL"] != DBNull.Value)
            {
                this.lblURL.Text = oDr["URL"].ToString();
            }

            if (oDr["ContactPerson"] != DBNull.Value)
            {
                this.lblContactPerson.Text = oDr["ContactPerson"].ToString();
            }

            if (oDr["PersonDesignation"] != DBNull.Value)
            {
                this.lblPersonDesignation.Text = oDr["PersonDesignation"].ToString();
            }

            if (oDr["MobileNo"] != DBNull.Value)
            {
                this.lblMobileNo.Text = oDr["MobileNo"].ToString();
            }

            if (oDr["Email"] != DBNull.Value)
            {
                this.lblEmail.Text = oDr["Email"].ToString();
            }

            if (oDr["VATRegNo"] != DBNull.Value)
            {
                this.lblVATRegNo.Text = oDr["VATRegNo"].ToString();
            }

            if (oDr["VATRegDate"] != DBNull.Value)
            {
                this.lblVATRegDate.Text = oDr["VATRegDate"].ToString();
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
