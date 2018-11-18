

// Developed by Swarnali Datta //

using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class LabourCategoryMaster : BasePage
{

    # region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("LabourCategory.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            if (Request["Action"] == "A")
            {
                txtLabourCategoryID.Text = "";
                lblTitle.Text = "Add New Labour Category Data";
            }
            else
            {
                lblTitle.Text = "Modify Labour Category Data";
                LoadData(Request["ID"]);
            }
        }
    }
    # endregion

    #region LoadData
    public void LoadData(string LabourCategoryID)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(LabourCategoryID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);
        oSqlDataReader = BLL.Master.LabourCategory.FetchData(objArr, "MstLabourCategory_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["LabourCategoryID"] != DBNull.Value)
                {
                    txtLabourCategoryID.Text = oSqlDataReader["LabourCategoryID"].ToString();
                }

                if (oSqlDataReader["LabourCategoryName"] != DBNull.Value)
                {
                    txtLabourCategoryName.Text = oSqlDataReader["LabourCategoryName"].ToString();
                }

                if (oSqlDataReader["HourlyRate"] != DBNull.Value)
                {
                    txtHourlyRate.Text = oSqlDataReader["HourlyRate"].ToString();
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
                if (Request["Action"] == "A")
                {
                    objArr.Add("");
                }
                else
                {
                    objArr.Add(txtLabourCategoryID.Text);
                }
                objArr.Add(txtLabourCategoryName.Text);
                objArr.Add(txtHourlyRate.Text);

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);

                object tmpMsg = BLL.Master.LabourCategory.Operate(objArr, Request["Action"].ToString());
                Utility.ShowMessage(this, (string)tmpMsg);
                Response.Redirect("LabourCategoryView.aspx?Action=V&ID=" + tmpMsg.ToString());
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
        if (txtLabourCategoryName.Text.Trim() == "")
        {
            sMsg = "Please give Labour Category Name";
            return sMsg;
        }

        if (txtHourlyRate.Text.Trim() == "")
        {
            sMsg = "Please Give Hourly Rate";
            return sMsg;
        }
        return sMsg;
    }
    #endregion
}
