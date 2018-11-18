

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

public partial class ProductRateView : BasePage
{

    # region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("ProductView.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            string sProductID = "";
            if (Request["Action"] == "V")
            {
                if (Request["ID"] != null && Request["ID"] != "")
                {
                    sProductID = Request["ID"];
                    LoadData(sProductID);
                }
            }
        }
    }
    # endregion

    #region LoadData
    #region Info
    //THIS FUNCTION WILL FETCH DATA FROM HEADER AND DETAIL TABLE AND POPULATE THIS FORM
    #endregion

    private void LoadData(string sProductRateID)
    {
        ArrayList ObjArrVal = new ArrayList();
        ObjArrVal.Add(sProductRateID);
        ObjArrVal.Add("");
        ObjArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        ObjArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);

        SqlDataReader oDr = BLL.Master.ProductRate.GetDataForViewPage(ObjArrVal);
        while (oDr.Read())
        {
            if (oDr["ProductRateID"] != DBNull.Value)
            {
                lblProductRateID.Text = oDr["ProductRateID"].ToString();
            }

            if (oDr["ProductName"] != DBNull.Value)
            {
                lblProduct.Text = oDr["ProductName"].ToString();
            }

            if (oDr["EffectiveDate"] != DBNull.Value)
            {
                lblEffectiveDate.Text = Convert.ToDateTime(oDr["EffectiveDate"].ToString()).ToString("dd/MM/yyyy");
            }

            if (oDr["UnitSaleRate"] != DBNull.Value)
            {
                lblUnitofSale.Text = oDr["UnitSaleRate"].ToString();
            }
        }
        oDr.Close();
    }
    #endregion

    }

