
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

public partial class ServiceItemMaster : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("ServiceItem.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            if (Request["Action"] == "A")
            {
                txtServiceItemID.Text = "";
                lblTitle.Text = "Add New Service Item Data";
            }
            else
            {
                lblTitle.Text = "Modify Service Item Data";
                LoadData(Request["ID"]);
            }
        }

    }

    #region LoadData
    public void LoadData(string ServiceItemID)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(ServiceItemID);
        oSqlDataReader = BLL.Master.ServiceItem.FetchData(objArr, "MstServiceItem_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["ServiceItemID"] != DBNull.Value)
                {
                    txtServiceItemID.Text = oSqlDataReader["ServiceItemID"].ToString();
                }

                if (oSqlDataReader["ServiceItemName"] != DBNull.Value)
                {
                    txtServiceItemName.Text = oSqlDataReader["ServiceItemName"].ToString();
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
                    objArr.Add(txtServiceItemID.Text);
                }
                objArr.Add(txtServiceItemName.Text);
                
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);

                object tmpMsg = BLL.Master.ServiceItem.Operate(objArr, Request["Action"].ToString());
                if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
                {
                    Utility.ShowMessage(this, tmpMsg.ToString());
                }
                else
                {
                    Response.Redirect("ServiceItemView.aspx?Action=V&ID=" + tmpMsg.ToString());
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
        if (txtServiceItemName.Text.Trim() == "")
        {
            sMsg = "Service Item can not be blank";
            return sMsg;
        }
        return sMsg;
    }
    #endregion
}

