
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

public partial class DepartmentMaster : BasePage
{

    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("DepartmentMaster.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            if (Request["Action"] == "A")
            {
                txtDepartmentID.Text = "";
                lblTitle.Text = "Add New Department Data";
            }
            else
            {
                lblTitle.Text = "Modify Department Data";
                LoadData(Request["ID"]);
            }
        }
    }
    # endregion

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
                    objArr.Add(txtDepartmentID.Text);
                }
                objArr.Add(txtDepartmentName.Text);

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);

                object tmpMsg = BLL.Master.Department.Operate(objArr, Request["Action"].ToString());
                //Utility.ShowMessage(this, (string)tmpMsg);
                //Response.Redirect("Department.aspx");
                Response.Redirect("DepartmentView.aspx?Action=V&ID=" + tmpMsg.ToString());
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
        if (txtDepartmentName.Text.Trim() == "")
        {
            sMsg = "Please give the Department Name";
            return sMsg;
        }

        return sMsg;
    }
    #endregion

    #region LoadData
    public void LoadData(string DepartmentID)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion


        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(DepartmentID);
        oSqlDataReader = BLL.Master.Department.FetchData(objArr, "MstDepartment_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["DepartmentID"] != DBNull.Value)
                {
                    txtDepartmentID.Text = oSqlDataReader["DepartmentID"].ToString();
                }

                if (oSqlDataReader["DepartmentName"] != DBNull.Value)
                {
                    txtDepartmentName.Text = oSqlDataReader["DepartmentName"].ToString();
                }
            }
        }
        oSqlDataReader.Close();
    }
    #endregion
}
