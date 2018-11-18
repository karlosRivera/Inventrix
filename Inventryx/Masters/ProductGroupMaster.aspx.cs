

// Developed by Swarnali Datta //


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

public partial class ProductGroupMaster : BasePage
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("ProductGroupMaster.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            if (Request["Action"] == "A")
            {
                txtProductGroupID.Text = "";
                lblTitle.Text = "Add New Product Group Data";
            }
            else
            {
                lblTitle.Text = "Modify Product Group Data";
                LoadData(Request["ID"]);
            }
        }
     }
    #endregion

    #region ForEditData
    public void LoadData(string ProductGroupID)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        
        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(ProductGroupID);
        oSqlDataReader = BLL.Master.ProductGroup.FetchData(objArr, "MstProductGroup_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["ProductGroupID"] != DBNull.Value)
                {
                    txtProductGroupID.Text = oSqlDataReader["ProductGroupID"].ToString();
                }

                if (oSqlDataReader["ProductGroupName"] != DBNull.Value)
                {
                    txtProductGroupName.Text = oSqlDataReader["ProductGroupName"].ToString();
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
                    objArr.Add(txtProductGroupID.Text);
                }
                objArr.Add(txtProductGroupName.Text);               

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);

                object tmpMsg = BLL.Master.ProductGroup.Operate(objArr, Request["Action"].ToString());
                //Utility.ShowMessage(this, (string)tmpMsg);
                Response.Redirect("ProductGroupView.aspx?Action=V&ID=" + tmpMsg.ToString());
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
        if (txtProductGroupName.Text.Trim() == "")
        {
            sMsg = "Please give Product Group Name";
            return sMsg;
        }

       return sMsg;
    }
    #endregion
}
