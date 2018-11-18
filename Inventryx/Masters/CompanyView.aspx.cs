
# region DEVELOPED BY
    //This Master is developed by Indranil Roy
# endregion


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


public partial class CompanyView :BasePage
{
    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("CompanyView.aspx");
        }
        else
        {
            CheckQString();
        }
        if (!IsPostBack)
        {
            string CompanyID = "";
            if (Request["Action"] == "V")
            {
                if (Request["ID"] != null && Request["ID"] != "")
                {
                    CompanyID = Request["ID"];
                    LoadData(CompanyID);
                }
            }
        }
    }
    # endregion

    # region LoadData
    private void LoadData(string CompanyID)
    {
        SqlDataReader oDr = BLL.Master.Company.GetDataForViewPage(CompanyID);

        while (oDr.Read())
        {
            if (oDr["CompanyID"] != DBNull.Value)
            {
                this.lblCompanyID.Text = oDr["CompanyID"].ToString();
            }

            if (oDr["CompanyName"] != DBNull.Value)
            {
                this.lblCompanyName.Text = oDr["CompanyName"].ToString();
            }

            if (oDr["Addr"] != DBNull.Value)
            {
                this.lblAddress.Text = oDr["Addr"].ToString();
            }

            if (oDr["City"] != DBNull.Value)
            {
                this.lblCity.Text = oDr["City"].ToString();
            }

            if (oDr["Pin"] != DBNull.Value)
            {
                this.lblPin.Text = oDr["Pin"].ToString();
            }


            if (oDr["ContactPerson"] != DBNull.Value)
            {
                this.lblContactPerson.Text = oDr["ContactPerson"].ToString();
            }

            if (oDr["PersonDesignation"] != DBNull.Value)
            {
                this.lblPersonDesignation.Text = oDr["PersonDesignation"].ToString();
            }

            if (oDr["PhoneNo"] != DBNull.Value)
            {
                this.lblPhoneNo.Text = oDr["PhoneNo"].ToString();
            }

            if (oDr["FaxNo"] != DBNull.Value)
            {
                this.lblFaxNo.Text = oDr["FaxNo"].ToString();
            }

            if (oDr["Email"] != DBNull.Value)
            {
                this.lblEmail.Text = oDr["Email"].ToString();
            }

            if (oDr["RegNo"] != DBNull.Value)
            {
                this.lblRegNo.Text = oDr["RegNo"].ToString();
            }

            if (oDr["PFNo"] != DBNull.Value)
            {
                this.lblPFNo.Text = oDr["PFNo"].ToString();
            }
            if (oDr["ESINo"] != DBNull.Value)
            {
                this.lblESINo.Text = oDr["ESINo"].ToString();
            }
            if (oDr["CSTNo"] != DBNull.Value)
            {
                this.lblCSTNo.Text = oDr["ESINo"].ToString();
            }
            if (oDr["LSTNo"] != DBNull.Value)
            {
                this.lblLSTNo.Text = oDr["ESINo"].ToString();
            }

            if (oDr["URL"] != DBNull.Value)
            {
                this.lblURL.Text = oDr["URL"].ToString();
            }
            if (oDr["ServTaxRegNo"] != DBNull.Value)
            {
                this.lblServTaxRegNo.Text = oDr["ServTaxRegNo"].ToString();
            }

            if (oDr["ServTaxCode"] != DBNull.Value)
            {
                this.lblServTaxCode.Text = oDr["ServTaxCode"].ToString();
            }

            if (oDr["ProfTaxECN"] != DBNull.Value)
            {
                this.lblProfTaxECN.Text = oDr["ProfTaxECN"].ToString();
            }

            if (oDr["ProfTaxRCN"] != DBNull.Value)
            {
                this.lblProfTaxRCN.Text = oDr["ProfTaxRCN"].ToString();
            }

            if (oDr["VATNo"] != DBNull.Value)
            {
                this.lblVATNo.Text = oDr["VATNo"].ToString();
            }

            if (oDr["ITTanNo"] != DBNull.Value)
            {
                this.lblITTanNo.Text = oDr["ITTanNo"].ToString();
            }

            if (oDr["PANNo"] != DBNull.Value)
            {
                this.lblPANNo.Text = oDr["PANNo"].ToString();
            }
          
        }
        oDr.Close();
    }
    # endregion
}
