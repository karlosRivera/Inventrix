

# region DEVELOPED BY
//this Master is developed By Indranil Roy.
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

public partial class BranchView :BasePage
{


    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        {
            if (!Utility.IsUserLoggedIn())
            {
                Utility.RedirectToLoginPage("BranchView.aspx");
            }
            else
            {
                CheckQString();
            }

            if (!IsPostBack)
            {
                string BranchID = "";
                if (Request["Action"] == "V")
                {
                    if (Request["ID"] != null && Request["ID"] != "")
                    {
                        BranchID = Request["ID"];
                        LoadData(BranchID);
                    }
                }
            }
        }
    }
    # endregion

    # region LoadData

    private void LoadData(string BranchID)
    {
        SqlDataReader oDr = BLL.Master.Branch.GetDataForViewPage(BranchID,"V");

        while (oDr.Read())
        {
            if (oDr["BranchID"] != DBNull.Value)
            {
                this.lblBranchID.Text = oDr["BranchID"].ToString();
            }

            if (oDr["BranchName"] != DBNull.Value)
            {
                this.lblBranchName.Text = oDr["BranchName"].ToString();
            }
            if (oDr["CompanyName"] != DBNull.Value)
            {
                this.lblCompanyName.Text = oDr["CompanyName"].ToString();
            }

            if (oDr["Addr"] != DBNull.Value)
            {
                this.lblBranchAddress.Text = oDr["Addr"].ToString();
            }
            if (oDr["City"] != DBNull.Value)
            {
                this.lblCity.Text = oDr["City"].ToString();
            }
            if (oDr["Pin"] != DBNull.Value)
            {
                this.lblPin.Text = oDr["Pin"].ToString();
            }

            if (oDr["MobileNo"] != DBNull.Value)
            {
                this.lblMobileNo.Text = oDr["MobileNo"].ToString();
            }

            if (oDr["MobileNo"] != DBNull.Value)
            {
                this.lblMobileNo.Text = oDr["MobileNo"].ToString();
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

            if (oDr["ContactPerson"] != DBNull.Value)
            {
                this.lblContactPerson.Text = oDr["ContactPerson"].ToString();
            }
            if (oDr["PersonDesignation"] != DBNull.Value)
            {
                this.lblPersonDesignation.Text = oDr["PersonDesignation"].ToString();
            }

       
        }
        oDr.Close();
    }
    # endregion
    protected void btnPrint_Click(object sender, EventArgs e)
    {

    }
}
