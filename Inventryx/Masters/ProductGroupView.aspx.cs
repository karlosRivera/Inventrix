

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

public partial class ProductGroupView : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("ProductGroupView.aspx");
        }
        else
        {
            CheckQString();
        }

        if (!IsPostBack)
        {
            if (Request["Action"] == "V")
            {
                lblTitle.Text = "View Product Group Data";
                LoadData(Request["ID"]);
            }
                       
        }
     }
       

    #region ForModifyData
    public void LoadData(string ProductGroupID)
    {
        #region INFO
        // IN VIEW MODE THIS FUNCTION FETCH DATA AND POPULATE THE FORM
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
                    lblProductGroupID.Text = oSqlDataReader["ProductGroupID"].ToString();
                }

                if (oSqlDataReader["ProductGroupName"] != DBNull.Value)
                {
                    lblProductGroupName.Text = oSqlDataReader["ProductGroupName"].ToString();
                }
            }
        }
        oSqlDataReader.Close();
    }
    #endregion
    }

