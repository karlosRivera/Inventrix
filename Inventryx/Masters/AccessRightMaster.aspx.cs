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

public partial class AccessRightMaster : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("AccessRightMaster.aspx");
        }

        if (!IsPostBack)
        {
            dgList.Visible = false;
            User oUser=new User();
            Utility.PopulateCombo(oUser.GetComboData("MstUserLoad_Select"), ddlUserName, "userName", "", "UserID", "");
            ddlUserName.SelectedIndex = -1;
            oUser = null;
            
        }
    }

    protected void LoadRights()
    {
        SqlDataReader oDr = null;
        ArrayList oArr=new ArrayList();
        oArr.Add(ddlUserName.SelectedValue.ToString());
        User oUser = new User();
        oDr = oUser.LoadRights(oArr, "MstUserAccess_Select");
        if (oDr.HasRows)
        {
            dgList.DataSource = oDr;
            dgList.DataBind();
        }
        oDr.Dispose();
        dgList.Visible = true;
    }
   
    protected void dgList_ItemDataBound(object sender, DataGridItemEventArgs e)
    {

        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string sLeafTag = DataBinder.Eval(e.Item.DataItem, "LeafTag").ToString();

            if (sLeafTag == "N")
            {
                ((CheckBox)e.Item.FindControl("chkView")).Visible = false;
                ((CheckBox)e.Item.FindControl("chkAdd")).Visible = false;
                ((CheckBox)e.Item.FindControl("chkEdit")).Visible = false;
                ((CheckBox)e.Item.FindControl("chkDelete")).Visible = false;
                ((Label)e.Item.FindControl("lblModuleID")).Text = "";
                ((Label)e.Item.FindControl("lblModuleName")).Font.Bold = true;
            }
            else if (sLeafTag == "Y")
            {
                ((CheckBox)e.Item.FindControl("chkView")).Visible = true;
                ((CheckBox)e.Item.FindControl("chkAdd")).Visible = true;
                ((CheckBox)e.Item.FindControl("chkEdit")).Visible = true;
                ((CheckBox)e.Item.FindControl("chkDelete")).Visible = true;

                if (DataBinder.Eval(e.Item.DataItem, "AccessTag").ToString() == "N")
                    ((CheckBox)e.Item.FindControl("chkView")).Checked = false;
                else if (DataBinder.Eval(e.Item.DataItem, "AccessTag").ToString() == "Y")
                    ((CheckBox)e.Item.FindControl("chkView")).Checked = true;

                if (DataBinder.Eval(e.Item.DataItem, "InsertTag").ToString() == "N")
                    ((CheckBox)e.Item.FindControl("chkAdd")).Checked = false;
                else if (DataBinder.Eval(e.Item.DataItem, "InsertTag").ToString() == "Y")
                    ((CheckBox)e.Item.FindControl("chkAdd")).Checked = true;

                if (DataBinder.Eval(e.Item.DataItem, "UpdateTag").ToString() == "N")
                    ((CheckBox)e.Item.FindControl("chkEdit")).Checked = false;
                else if (DataBinder.Eval(e.Item.DataItem, "UpdateTag").ToString() == "Y")
                    ((CheckBox)e.Item.FindControl("chkEdit")).Checked = true;

                if (DataBinder.Eval(e.Item.DataItem, "DeleteTag").ToString() == "N")
                    ((CheckBox)e.Item.FindControl("chkDelete")).Checked = false;
                else if (DataBinder.Eval(e.Item.DataItem, "DeleteTag").ToString() == "Y")
                    ((CheckBox)e.Item.FindControl("chkDelete")).Checked = true;
            }
        }
    }

    #region btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region INFO
        // THIS FUNCTION WILL ACTUALLY INSERT DATA AND UPDATE DATA IN THE TABLE THROUGH STORE PROCEDURE
        #endregion

            string sMsg;
            sMsg = ValidateInput();
            if (sMsg == "")
            {
                User oUser = new User();
                ArrayList objArr = new ArrayList();
                objArr.Add(ddlUserName.SelectedValue.ToString());
                objArr.Add(BuildXmlForDetail());
                object tmpMsg = oUser.Operate(objArr);

                if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
                {
                    Utility.ShowMessage(this,tmpMsg.ToString());
                }
                else
                {
                    Utility.ShowMessage(this, "Data Saved Successfully");
                    LoadRights();
                    SetRightsStatus("false");
                }
            }
            else
            {
                Utility.ShowMessage(this, sMsg);
            }
    }
    #endregion
    #region BuildXmlForDetail
    private string BuildXmlForDetail()
    {
        #region INFO
        //THIS FUNCTION WILL GENERATE AND RETURN XML FOR DETAIL GRID PORTION
        #endregion

        string sOptionID = "", sAccessTag = "", sInsertTag = "", sUpdateTag = "", sDeleteTag = "";
        int i = 0;
        DataTable tbl = new DataTable();
        tbl.TableName = "RightsDetail";
        DataRow dr = null;
        tbl.Columns.Add("OptionID");
        tbl.Columns.Add("AccessTag");
        tbl.Columns.Add("InsertTag");
        tbl.Columns.Add("UpdateTag");
        tbl.Columns.Add("DeleteTag");


        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (((Label)dgList.Items[i].FindControl("lblModuleID")).Text.Trim() != "")
            {
                sOptionID = ((Label)dgList.Items[i].FindControl("lblModuleID")).Text.Trim();

                if (((CheckBox)dgList.Items[i].FindControl("chkView")).Checked)
                    sAccessTag = "Y";
                else if (!((CheckBox)dgList.Items[i].FindControl("chkView")).Checked)
                    sAccessTag = "N";

                if (((CheckBox)dgList.Items[i].FindControl("chkAdd")).Checked)
                    sInsertTag = "Y";
                else if (!((CheckBox)dgList.Items[i].FindControl("chkAdd")).Checked)
                    sInsertTag = "N";

                if (((CheckBox)dgList.Items[i].FindControl("chkEdit")).Checked)
                    sUpdateTag = "Y";
                else if (!((CheckBox)dgList.Items[i].FindControl("chkEdit")).Checked)
                    sUpdateTag = "N";

                if (((CheckBox)dgList.Items[i].FindControl("chkDelete")).Checked)
                    sDeleteTag = "Y";
                else if (!((CheckBox)dgList.Items[i].FindControl("chkDelete")).Checked)
                    sDeleteTag = "N";

                dr = tbl.NewRow();
                dr["OptionID"] = sOptionID;
                dr["AccessTag"] = sAccessTag;
                dr["InsertTag"] = sInsertTag;
                dr["UpdateTag"] = sUpdateTag;
                dr["DeleteTag"] = sDeleteTag;
                tbl.Rows.Add(dr);
            }
        }

        DataSet oDS = new DataSet();
        oDS.Tables.Add(tbl);
        return oDS.GetXml().ToString();
    }
    #endregion

    #region SetRightsStatus
    private void SetRightsStatus(object sAction)
    {
        for (int i = 0; i <= dgList.Items.Count - 1; i++)
        {
            if (((Label)dgList.Items[i].FindControl("lblModuleID")).Text.Trim() != "")
            {
                ((CheckBox)dgList.Items[i].FindControl("chkView")).Enabled = (sAction=="false" ? false : true);
                ((CheckBox)dgList.Items[i].FindControl("chkAdd")).Enabled = (sAction == "false" ? false : true);
                ((CheckBox)dgList.Items[i].FindControl("chkEdit")).Enabled = (sAction == "false" ? false : true);
                ((CheckBox)dgList.Items[i].FindControl("chkDelete")).Enabled = (sAction == "false" ? false : true);
            }
        }
        btnSave.Enabled = (sAction == "false" ? false : true);
    }
    #endregion

    #region ValidateInput
    public string ValidateInput()
    {
        #region INFO
        //THIS FUNCTION WILL VALIDATE DATA BEFORE INSERTING OR UPDATION DATA TO THE TABLE
        #endregion

        string sMsg = "";
        if (ddlUserName.SelectedValue == "")
        {
            sMsg = "Select User Name";
            return sMsg;
        }
        return sMsg;
    }
    #endregion

    protected void btnSrch_Click(object sender, EventArgs e)
    {
            LoadRights();
            SetRightsStatus("false");
    }

    protected void btnEditRight_Click(object sender, EventArgs e)
    {
        SetRightsStatus("true");
    }
}
