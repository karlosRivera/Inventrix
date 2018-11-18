

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

public partial class Masters_OpeningStockMaster : BasePage
{

    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("OpeningStockMaster.aspx");
        }
        else
        {
            CheckQString();
        }

        this.txtGRNNo.Focus();

        if (!IsPostBack)
        {
            PopulateCombo(this.ddProduct, "ProductName", "ProductID", "MstProduct_Select","MP");
            PopulateCombo(this.ddStockPoint, "StockPointName", "StockPointID", "MstStockPointName_Select","MSP");

            if (Request["Action"] == "A")
            {
                this.txtOpeningStockID.Text = "";
                this.lblTitle.Text = "Add New Opening Stock";
            }
            else
            {
                this.lblTitle.Text = "Modify Opening Stock";
                //LoadData(Request["ID"]);
            }
        }
    }
    # endregion

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
                    objArr.Add(this.txtOpeningStockID.Text.Trim());
                }

                objArr.Add(this.txtGRNNo.Text.Trim());
                objArr.Add(this.txtGRNDate.Date.ToShortDateString().Trim());
                objArr.Add(this.txtEffectiveDate.Date.ToShortDateString().Trim());
                objArr.Add(this.ddProduct.SelectedValue.ToString().Trim());
                objArr.Add(this.ddStockPoint.SelectedValue.ToString().Trim());
                objArr.Add(this.txtOpeningQty.Text.Trim());


                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

                object tmpMsg = BLL.Master.OpeningStock.Operate(objArr, Request["Action"].ToString());
                //Utility.ShowMessage(this, (string)tmpMsg);
                Response.Redirect("OpeningStockView.aspx?Action=V&ID=" + tmpMsg.ToString());
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

        if (this.txtGRNNo.Text.ToString() == "")
        {
            sMsg = "GRN No. Can not be blank";
            return sMsg;
        }

        if (this.txtGRNDate.Date.ToString() == "")
        {
            sMsg = "GRN Date Can not be blank";
            return sMsg;
        }

        if (this.txtEffectiveDate.Date.ToString() == "")
        {
            sMsg = "Effective Date Can not be blank";
            return sMsg;
        }

        if (Convert.ToInt32(this.ddProduct.SelectedValue.ToString()) == -1)
        {
            sMsg = "Please Select Product";
            return sMsg;
        }

        if (Convert.ToInt32(this.ddStockPoint.SelectedValue.ToString()) == -1)
        {
            sMsg = "Please Select Stock Point";
            return sMsg;
        }


        if (this.txtOpeningQty.Text.ToString() == "")
        {
            sMsg = "Opening Quantity Can not be blank";
            return sMsg;
        }
        return sMsg;
    }
    #endregion

    # region PopulateCombo
    private void PopulateCombo(DropDownList ddControl, string FieldName, string FieldID, string spName,string sTrack)
    {
        SqlDataReader oDr;
        ArrayList objArrVal = new ArrayList();

        if (sTrack == "MP")
        {
            objArrVal.Add("");
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        }
        else
        {
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            objArrVal.Add("");
        }



        oDr = BLL.Master.OpeningStock.GetComboData(spName, objArrVal);
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
