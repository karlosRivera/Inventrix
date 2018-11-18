

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


public partial class ProductMaster : BasePage
{

    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("ProductMaster.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            PopulateCombo(this.ddlProductGroup, "ProductGroupName", "ProductGroupID", "MstProductGroupFrm_Select");
            PopulateCombo(this.ddlManufacturer, "ManufacturerName", "ManufacturerID", "MstManufacturerfrm_Select");

            if (Request["Action"] == "A")
            {
                txtProductID.Text = "";
                lblTitle.Text = "Add New Product Data";
            }
            else
            {
                lblTitle.Text = "Modify Product Data";
                LoadData(Request["ID"]);
            }
        }
    }
# endregion
    
    #region LoadData
    public void LoadData(string ProductID)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(ProductID);
        oSqlDataReader = BLL.Master.Product.FetchData(objArr, "MstProducts_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["ProductID"] != DBNull.Value)
                {
                    txtProductID.Text = oSqlDataReader["ProductID"].ToString();
                }

                if (oSqlDataReader["ProductName"] != DBNull.Value)
                {
                    txtProName.Text = oSqlDataReader["ProductName"].ToString();
                }

                if (oSqlDataReader["ProductName"] != DBNull.Value)
                {
                    txtProSpec.Text = oSqlDataReader["ProductSpec"].ToString();
                }

                if (oSqlDataReader["ProductGroupID"] != DBNull.Value)
                {
                    ddlProductGroup.SelectedIndex = -1;
                    ddlProductGroup.Items.FindByValue(oSqlDataReader["ProductGroupID"].ToString()).Selected = true;
                }

                if (oSqlDataReader["ManufacturerID"] != DBNull.Value)
                {
                    ddlManufacturer.SelectedIndex = -1;
                    ddlManufacturer.Items.FindByValue(oSqlDataReader["ManufacturerID"].ToString()).Selected = true;
                }

                if (oSqlDataReader["ProductUOM"] != DBNull.Value)
                {
                    txtUOM.Text = oSqlDataReader["ProductUOM"].ToString();
                }

                if (oSqlDataReader["ReorderLevel"] != DBNull.Value)
                {
                    txtReorderLevel.Text = oSqlDataReader["ReorderLevel"].ToString();
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
                    objArr.Add(txtProductID.Text);
                }
                objArr.Add(txtProName.Text);
                objArr.Add(txtProSpec.Text);
                objArr.Add(ddlProductGroup.SelectedValue.ToString());
                objArr.Add(ddlManufacturer.SelectedValue.ToString() == "-1" ? null : ddlManufacturer.SelectedValue.ToString());
                objArr.Add(txtUOM.Text);
                objArr.Add(txtReorderLevel.Text);

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);

                object tmpMsg = BLL.Master.Product.Operate(objArr, Request["Action"].ToString());
                //Utility.ShowMessage(this, (string)tmpMsg);
                Response.Redirect("ProductView.aspx?Action=V&ID=" + tmpMsg.ToString());
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
        if (txtProName.Text.Trim() == "")
        {
            sMsg = "Product can not be blank";
            return sMsg;
        }

        if (ddlProductGroup.SelectedValue.ToString() == "-1")
        {
            sMsg = "Select Product Group";
            return sMsg;
        }

        if (txtUOM.Text.Trim() == "")
        {
            sMsg = "Product Unit of Measurement can not be blank";
            return sMsg;
        }

        if (txtReorderLevel.Text.Trim() == "")
        {
            sMsg = "Reorder Level can not be blank";
            return sMsg;
        }
        return sMsg;
    }
    #endregion

    #region PopulateCombo
    private void PopulateCombo(DropDownList ddControl, string FieldName, string FieldID, string spName)
    {
        SqlDataReader oDr;
        ArrayList objArrVal = new ArrayList();

        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);

        oDr = BLL.Master.Product.GetComboData(spName, objArrVal);
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


