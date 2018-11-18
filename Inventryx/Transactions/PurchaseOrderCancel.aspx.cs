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

public partial class Transactions_PurchaseOrderCancel : BasePage 
{

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("PurchaseOrderCancel.aspx");
        }

        if (!IsPostBack)
        {
            string sPurchaseOrderNo = "";
            if (Request["Action"] == "C")
            {
                if (Request["ID"] != null && Request["ID"] != "")
                {
                    sPurchaseOrderNo = Request["ID"];
                    LoadData(sPurchaseOrderNo);
                }
            }
        }
    }
    #endregion

    #region LoadData
    #region Info
    //THIS FUNCTION WILL FETCH DATA FROM HEADER AND DETAIL TABLE AND POPULATE THIS FORM
    #endregion
    private void LoadData(string sPurchaseOrderNo)
    {
        SqlDataReader oDr = BLL.Transaction.PurchaseOrder.GetDataForViewPage(sPurchaseOrderNo);
        while (oDr.Read())
        {
            if (oDr["PurchaseOrderNo"] != DBNull.Value)
            {
                lblPoNo.Text = oDr["PurchaseOrderNo"].ToString();
            }

            if (oDr["PurchaseOrderDate"] != DBNull.Value)
            {
                lblPoDate.Text = Convert.ToDateTime(oDr["PurchaseOrderDate"].ToString()).ToString("dd/MM/yyyy");
            }

            if (oDr["Dateofdelivery"] != DBNull.Value)
            {
                lbldateofdelivery.Text = Convert.ToDateTime(oDr["Dateofdelivery"].ToString()).ToString("dd/MM/yyyy");
            }

            if (oDr["paymentterms"] != DBNull.Value)
            {
                lblPaymentterms.Text = oDr["paymentterms"].ToString();
            }

            if (oDr["remarks"] != DBNull.Value)
            {
                lblRemarks.Text = oDr["remarks"].ToString();
            }

            if (oDr["SupplierName"] != DBNull.Value)
            {
                lblSupplier.Text = oDr["SupplierName"].ToString();
            }

            if (oDr["DepartmentName"] != DBNull.Value)
            {
                lblDepartment.Text = oDr["DepartmentName"].ToString();
            }

            if (oDr["ProductGroupName"] != DBNull.Value)
            {
                lblProductGroup.Text = oDr["ProductGroupName"].ToString();
            }

            if (oDr["VatRate"] != DBNull.Value)
            {
                lblVatRate.Text = oDr["VatRate"].ToString();
            }

            if (oDr["VatAmt"] != DBNull.Value)
            {
                lblVatAmt.Text = oDr["VatAmt"].ToString();
            }

            if (oDr["ProductTotalAmt"] != DBNull.Value)
            {
                lblSubTotal.Text = oDr["ProductTotalAmt"].ToString();
            }

            if (oDr["PurchaseOrderAmt"] != DBNull.Value)
            {
                lblPoTotal.Text = oDr["PurchaseOrderAmt"].ToString();
            }
        }

        oDr.NextResult();

        dgList.DataSource = oDr;
        dgList.DataBind();
        oDr.Close();
    }
    #endregion



    #region btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region INFO
        // THIS FUNCTION WILL ACTUALLY INSERT DATA AND UPDATE DATA IN THE TABLE THROUGH STORE PROCEDURE
        #endregion

        if (Request["Action"] == "C")
        {
            string sMsg;
            sMsg = ValidateInput();
            if (sMsg == "")
            {
                ArrayList objArr = new ArrayList();
                objArr.Add(lblPoNo.Text.Trim());
                objArr.Add(txtCancelDate.Date.ToShortDateString().Trim());
                objArr.Add(txtCancelReason.Text.Trim());

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

                object tmpMsg = BLL.Transaction.PurchaseOrder.Operate(objArr, "C");
                if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
                {
                    Utility.ShowMessage(this, tmpMsg.ToString());
                }
                else
                {
                    //Response.Redirect("GoodsReceiptNoteView.aspx?Action=V&ID=" + tmpMsg.ToString());
                    btnCancel.Enabled = false;
                    Utility.ShowMessage(this, "Purchase Order Successfully cancel");
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
    private string ValidateInput()
    {
        #region INFO
        //THIS FUNCTION WILL VALIDATE DATA BEFORE INSERTING OR UPDATION DATA TO THE TABLE
        #endregion
        int i = 0;
        string sMsg = "";
        if (txtCancelReason.Text.Trim() == "")
        {
            sMsg = "Sorry Cancel reason can not be blank";
            return sMsg;
        }
        if (dgList.Items.Count <= 0)
        {
            sMsg = "Sorry can not cancel because detail part is missing";
            return sMsg;
        }
        return sMsg;
    }
    #endregion
    
}
