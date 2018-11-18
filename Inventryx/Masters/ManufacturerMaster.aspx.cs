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

public partial class Masters_ManufacturerMaster : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("Manufacturer.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            if (Request["Action"] == "A")
            {
                txtManufacturerID.Text = "";
                lblTitle.Text = "Add New Manufacturer Data";
            }
            else
            {
                lblTitle.Text = "Modify Manufacturer Data";
                LoadData(Request["ID"]);
            }
        }
    }
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
                    objArr.Add(txtManufacturerID.Text);
                }
                objArr.Add(txtManufacturerName.Text);

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

                object tmpMsg = BLL.Master.Manufacturer.Operate(objArr, Request["Action"].ToString());
                //Utility.ShowMessage(this, (string)tmpMsg);
                Response.Redirect("ManufacturerView.aspx?Action=V&ID=" + tmpMsg.ToString());
            }
            else
            {
                Utility.ShowMessage(this, sMsg);
            }
        }
    }

    #region ValidateInput
    public string ValidateInput()
    {
        #region INFO
        //THIS FUNCTION WILL VALIDATE DATA BEFORE INSERTING OR UPDATION DATA TO THE TABLE
        #endregion

        string sMsg = "";
        if (txtManufacturerName.Text.Trim() == "")
        {
            sMsg = "Manufacturer name can\\'t be blank";
            return sMsg;
        }
        return sMsg;
    }
    #endregion

    #region LoadData
    public void LoadData(string StockPointID)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(StockPointID);
        oSqlDataReader = BLL.Master.Manufacturer.FetchData(objArr, "MstManufacturer_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["ManufacturerID"] != DBNull.Value)
                {
                    txtManufacturerID.Text = oSqlDataReader["ManufacturerID"].ToString();
                }

                if (oSqlDataReader["ManufacturerName"] != DBNull.Value)
                {
                    txtManufacturerName.Text = oSqlDataReader["ManufacturerName"].ToString();
                }
            }
        }
        oSqlDataReader.Close();
    }
    #endregion
}
