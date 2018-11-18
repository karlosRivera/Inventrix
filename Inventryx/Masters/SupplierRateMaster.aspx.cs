

# region DEVELOPED BY
//this Master is developed By Indranil Roy.
# endregion

using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class SupplierRateMaster : BasePage
{

    # region EnumDeclaration
    enum ComboPopulation
    {
        supplier=0,
        product=1
    }

    # endregion

    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("SupplierRate.aspx");
        }
        else
        {
            CheckQString();
        }

        this.ddSupplier.Focus();
        if (!IsPostBack)
        {
            PopulateCombo(this.ddSupplier, "SupplierName", "SupplierID", "MstSupplierFrm_Select", (int)(ComboPopulation.supplier));
            PopulateCombo(this.ddProduct, "ProductName", "ProductID", "MstProduct_Select", (int)(ComboPopulation.product));

            if (Request["Action"] == "A")
            {
                this.txtSupplierRateID.Text = "";
                this.lblTitle.Text = "Add New Supplier Rate";
            }
            else
            {
                this.lblTitle.Text = "Modify Supplier Rate";
                LoadData(Request["ID"]);
            }
        }
    }
    # endregion

    #region LoadData
    public void LoadData(string SupplierRateID)
    {
        #region INFO
        // IN EDIT MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
        #endregion

        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(SupplierRateID);
        objArr.Add("");
        if (Request["Action"] == "E")
        {
            objArr.Add("E");
        }
        oSqlDataReader = BLL.Master.SupplierRate.FetchData(objArr, "MstSupplierRate_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["SupplierRateID"] != DBNull.Value)
                {
                    this.txtSupplierRateID.Text = oSqlDataReader["SupplierRateID"].ToString();
                }

                if (oSqlDataReader["SupplierID"] != DBNull.Value)
                {
                    this.ddSupplier.SelectedIndex = -1;
                    this.ddSupplier.Items.FindByValue(oSqlDataReader["SupplierID"].ToString()).Selected = true;
                }

                if (oSqlDataReader["ProductID"] != DBNull.Value)
                {
                    this.ddProduct.SelectedIndex = -1;
                    this.ddProduct.Items.FindByValue(oSqlDataReader["ProductID"].ToString()).Selected = true;
                }

                if (oSqlDataReader["EffectiveDate"] != DBNull.Value)
                {
                    this.txtEffectiveDate.Date = Convert.ToDateTime(oSqlDataReader["EffectiveDate"].ToString());
                }
                if (oSqlDataReader["SupplierRate"] != DBNull.Value)
                {
                    this.txtSupplierRate.Text = oSqlDataReader["SupplierRate"].ToString();
                }
            }
        }
        oSqlDataReader.Close();
    }
    #endregion

    # region btnSave_Click
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
                    objArr.Add(this.txtSupplierRateID.Text.Trim());
                }

                objArr.Add(this.ddSupplier.SelectedValue.Trim());
                objArr.Add(this.ddProduct.SelectedValue.Trim());
                objArr.Add(this.txtEffectiveDate.Date.ToShortDateString().Trim());
                objArr.Add(this.txtSupplierRate.Text.Trim());


                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

                object tmpMsg = BLL.Master.SupplierRate.Operate(objArr, Request["Action"].ToString());
                //Utility.ShowMessage(this, (string)tmpMsg);
                Response.Redirect("SupplierRateView.aspx?Action=V&ID=" + tmpMsg.ToString());
            }
            else
            {
                Utility.ShowMessage(this, sMsg);
            }
        }
    }
    # endregion

    #region ValidateInput
    public string ValidateInput()
    {
        #region INFO
        //THIS FUNCTION WILL VALIDATE DATA BEFORE INSERTING OR UPDATION DATA TO THE TABLE
        #endregion
        string sMsg = "";

        if (Convert.ToInt32(this.ddSupplier.SelectedValue) == -1)
            {
                sMsg = "Please Select Supplier";
                return sMsg;
            }

        if (Convert.ToInt32(this.ddProduct.SelectedValue) == -1)
        {
            sMsg = "Please Select Product";
            return sMsg;
        }

        if (this.txtSupplierRate.Text =="")
        {
            sMsg = "Supplier Rate Can't be blank";
            return sMsg;
        }
        return sMsg;
    }
    #endregion

    # region PopulateCombo
    private void PopulateCombo(DropDownList ddControl, string FieldName, string FieldID, string spName,int iTrack)
    {
        SqlDataReader oDr;
        ArrayList objArrVal = new ArrayList();

        if (iTrack == (int)(ComboPopulation.supplier))
        {
            objArrVal.Add("");
            objArrVal.Add("");
        }
        else if (iTrack == (int)(ComboPopulation.product))
        {
            objArrVal.Add("");
        }

        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

        oDr = BLL.Master.SupplierRate.GetComboData(spName, objArrVal);
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
