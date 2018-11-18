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

public partial class StockPointMaster : BasePage
{

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("StockPoint.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            if (Request["Action"] == "A")
            {
                txtStockPointID.Text = "";
                lblTitle.Text = "Add New Stock Point Data";
            }
            else
            {
                lblTitle.Text = "Modify Stock Point Data";
                LoadData(Request["ID"]);
            }
        }
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
        oSqlDataReader = BLL.Master.StockPoint.FetchData(objArr, "MstStockPoint_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["StockPointID"] != DBNull.Value)
                {
                    txtStockPointID.Text = oSqlDataReader["StockPointID"].ToString();
                }

                if (oSqlDataReader["StockPointName"] != DBNull.Value)
                {
                    txtStockPointName.Text = oSqlDataReader["StockPointName"].ToString();
                }

                if (oSqlDataReader["StockPointType"] != DBNull.Value)
                {
                    ddlStockPointType.Items.FindByValue(oSqlDataReader["StockPointType"].ToString()).Selected = true;
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
                    objArr.Add(txtStockPointID.Text);
                }
                objArr.Add(txtStockPointName.Text);
                objArr.Add(ddlStockPointType.SelectedValue);

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

                object tmpMsg = BLL.Master.StockPoint.Operate(objArr, Request["Action"].ToString());
                //Utility.ShowMessage(this, (string)tmpMsg);
                Response.Redirect("StockPointView.aspx?Action=V&ID=" + tmpMsg.ToString());
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
        if (txtStockPointName.Text.Trim() == "")
        {
            sMsg = "Stock Point can not be blank";
            return sMsg;
        }

        if (ddlStockPointType.SelectedValue == "-1")
        {
            sMsg = "Select Stock Point type";
            return sMsg;
        }
        return sMsg;
    }
    #endregion
}
