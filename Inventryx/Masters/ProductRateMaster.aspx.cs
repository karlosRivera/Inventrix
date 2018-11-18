


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

public partial class ProductRateMaster : BasePage
{

    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("ProductRate.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            PopulateCombo(this.ddlProduct, "ProductName", "ProductID", "MstProduct_Select");

            if (Request["Action"] == "A")
            {
                txtPRateNo.Text = "";
                lblTitle.Text = "Add New Product Rate Data";
            }
            else
            {
                lblTitle.Text = "Modify Product Rate Data";
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
        oSqlDataReader = BLL.Master.ProductRate.FetchData(objArr, "MstProductRate_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["ProductRateID"] != DBNull.Value)
                {
                    txtPRateNo.Text = oSqlDataReader["ProductRateID"].ToString();
                }

                if (oSqlDataReader["ProductID"] != DBNull.Value)
                {
                    ddlProduct.Text = oSqlDataReader["ProductID"].ToString();
                }

                if (oSqlDataReader["EffectiveDate"] != DBNull.Value)
                {
                    txtEffectiveDate.Date = Convert.ToDateTime(oSqlDataReader["EffectiveDate"].ToString());
                }

                if (oSqlDataReader["UnitSaleRate"] != DBNull.Value)
                {
                    txtUnitSale.Text = oSqlDataReader["UnitSaleRate"].ToString();
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
                    objArr.Add(txtPRateNo.Text);
                }
                objArr.Add(ddlProduct.SelectedValue);
                objArr.Add(txtEffectiveDate.Date.ToShortDateString().Trim());
                objArr.Add(txtUnitSale.Text);

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

                object tmpMsg = BLL.Master.ProductRate.Operate(objArr, Request["Action"].ToString());
                //Utility.ShowMessage(this, (string)tmpMsg);
                Response.Redirect("ProductRateView.aspx?Action=V&ID=" + tmpMsg.ToString());
            }
            else
            {
                Utility.ShowMessage(this, sMsg);
            }
        }
    }
    #endregion

    #region ValidateInput
    private string ValidateInput()
    {
        #region INFO
        //THIS FUNCTION WILL VALIDATE DATA BEFORE INSERTING OR UPDATION DATA TO THE TABLE
        #endregion
        string sMsg = "";

        if (ddlProduct.SelectedValue.ToString() == "-1")
        {
            sMsg = "Please select department";
            return sMsg;
        }

        if (txtEffectiveDate.Date.ToShortDateString().Trim() == "")
        {
            sMsg = "Please select date of delivery";
            return sMsg;
        }

        if (txtUnitSale.Text.Trim() == "")
        {
            sMsg = "Unit Sale Rate  can not be blank ";
            return sMsg;
        }
        return sMsg; 
    }
    #endregion

    # region PopulateCombo
    private void PopulateCombo(DropDownList ddControl, string FieldName, string FieldID, string spName)
    {
        SqlDataReader oDr;
        ArrayList objArrVal = new ArrayList();

        objArrVal.Add("");
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

        oDr = BLL.Master.ProductRate.GetComboData(spName, objArrVal);
        ddControl.Items.Clear();
        ddControl.Items.Add(new ListItem("-- Select --", "-1"));
        while (oDr.Read())
        {
            ddControl.Items.Add(new ListItem((string)(oDr[FieldName]), (string)(oDr[FieldID])));
        }
        if (!oDr.IsClosed)
        { oDr.Close(); }
    }
    # endregion
}
