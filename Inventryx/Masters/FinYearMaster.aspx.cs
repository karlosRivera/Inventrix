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

public partial class FinYearMaster : BasePage
{

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("FinYearMaster.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            if (Request["Action"] != null)
            {
                txtFinYearID.Focus();
                if (Request["Action"] == "A")
                {
                    txtFinYearID.Text = "";
                    txtFinYearID.Enabled = true;
                    lblTitle.Text = "Add New Financial Year";
                }
                else
                {
                    if (Request["ID"] != null)
                    {
                        lblTitle.Text = "Modify Financial Year";
                        txtFinYearID.Text = Request["ID"].ToString();
                        txtFinYearID.Enabled = false;
                        LoadData(Request["ID"]);
                    }
                }
            }
        }
    }
    #endregion

    #region LoadData
    public void LoadData(string UserID)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(UserID);
        oSqlDataReader = BLL.Master.FinYear.FetchData(objArr, "MstAdminFinYear_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["FinYearID"] != DBNull.Value)
                {
                    txtFinYearID.Text = oSqlDataReader["FinYearID"].ToString();
                }

                if (oSqlDataReader["StartDate"] != DBNull.Value)
                {
                    txtStartDate.Date = Convert.ToDateTime(oSqlDataReader["StartDate"].ToString());
                }

                if (oSqlDataReader["EndDate"] != DBNull.Value)
                {
                    txtEndDate.Date = Convert.ToDateTime(oSqlDataReader["EndDate"].ToString());
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
                objArr.Add(txtFinYearID.Text.Trim());
                objArr.Add(txtStartDate.Date.ToShortDateString().Trim());
                objArr.Add(txtEndDate.Date.ToShortDateString().Trim());
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                object tmpMsg = BLL.Master.FinYear.Operate(objArr, Request["Action"].ToString());
                if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
                {
                    Utility.ShowMessage(this, tmpMsg.ToString());
                }
                else
                {
                    Response.Redirect("FinYearView.aspx?Action=V&ID=" + tmpMsg.ToString());
                }
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
        if (txtFinYearID.Text.Trim() == "")
        {
            sMsg = "Financial Year ID can\\'t be blank";
            return sMsg;
        }

        if (txtStartDate.Date.ToShortDateString().Trim() == "")
        {
            sMsg = "Start Date can\\'t be blank";
            return sMsg;
        }

        if (txtEndDate.Date.ToShortDateString().Trim() == "")
        {
            sMsg = "End Date can\\'t be blank";
            return sMsg;
        }
        return sMsg;
    }
    #endregion

}
