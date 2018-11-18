using System;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Site : System.Web.UI.MasterPage
{
    #region Page_Load
    #region Notes
    //FROM HERE PopulateMenu MENU FUNCTION WILL BE CALLED
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Utility.SetPageTitle(this.Page, this.Request.FilePath.ToString());
            PopulateMenu();
            SetControlStateRightWise();
            lblCurUserName.Text = "Welcome " + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserName;
        }
    }
    #endregion

   

    #region PopulateMenu
    #region Notes
    //THIS FUNCTION WILL POPULATE TOP LEVEL MENU
    #endregion
    private void PopulateMenu()
    {
        DataTable menuData = GetMenuData();
        AddTopMenuItems(menuData);
    }
    #endregion

    #region GetMenuData
    #region Notes
    //THIS FUNCTION WILL CALL STORE PROCEDURE AND FETCH DATA AND POPULATE A DATATABLE FOR ALL MENU 
    #endregion
    private DataTable GetMenuData()
    {
        DataTable dtblCategories = Components.DAL.DBUtils.GetInstance.ExecuteSqlDataSet("", "MstMenu_Select").Tables[0];
        return dtblCategories;
    }
    #endregion

    #region AddTopMenuItems
    #region Notes
    //THIS FUNCTION ADD ONLY TOP LEVEL MENU TO MENU CONTROL
    #endregion
    private void AddTopMenuItems(DataTable menuData)
    {
        DataView view = new DataView(menuData);
        view.RowFilter = "ParentID=00";
        foreach (DataRowView row in view)
        {
            MenuItem newMenuItem = new MenuItem(row["OptionName"].ToString(), row["OptionID"].ToString());
            Menu1.Items.Add(newMenuItem);
            AddChildMenuItems(menuData, newMenuItem);
        }
    }
    #endregion

    #region AddChildMenuItems
    #region Notes
    //THIS FUNCTION ADD CHILD NODES TO PARENT NODES IN RECURSIVE WAY
    #endregion
    private void AddChildMenuItems(DataTable menuData, MenuItem parentMenuItem)
    {
        DataView view = new DataView(menuData);
        view.RowFilter = "ParentID=" + parentMenuItem.Value;
        foreach (DataRowView row in view)
        {
            MenuItem newMenuItem = new MenuItem(row["OptionName"].ToString(), row["OptionID"].ToString());
            if (row["PageURL"] != DBNull.Value)
            {
                newMenuItem.NavigateUrl = row["PageURL"].ToString();
            }
            SetRights(newMenuItem,Convert.ToInt32(row["OptionID"].ToString()));
            parentMenuItem.ChildItems.Add(newMenuItem);
            AddChildMenuItems(menuData, newMenuItem);
        }
    }
    #endregion

    #region SetRights
    #region Notes
    //THIS FUNCTION ACTUALLY DETECT MODULE ACCESS RIGHT AND ACCORDINGLY ENABLE/DISABLE CHILD MENU ITEM
    #endregion
    private void SetRights(MenuItem newMenuItem, int OptionID)
    {
        ArrayList oArrLst = (ArrayList)HttpContext.Current.Session["RightsInfo"];
        for (int i = 0; i <= oArrLst.Count - 1; i++)
        {
            int tmpOptionID= Convert.ToInt32(((Rights) oArrLst[i]).ModuleID);
            if (OptionID == tmpOptionID)
            {
                if (((Rights)oArrLst[i]).View == "N")
                {
                    newMenuItem.Enabled = false;
                    newMenuItem.ImageUrl = "";
                }
            }
        }
    }
    #endregion

    #region SetControlStateRightWise
    #region info
    //FROM HERE WE JUST ENABLE OR DISABLE CONTROL OF EVERY PAGE RIGHT WISE
    //AS A RESULT IF THE LOGIN USER CAN TAKE ACTION BASED ON THE RIGHT GRANT TO HIM/HER
    //AS A RESULT WE CAN MAINTAIN SOME SECURITY BASED ON RIGHTS
    #endregion
    private void SetControlStateRightWise()
    {
        string sAdd = "", sMod = "", sDel = "", sView = "";
        bool bAdd = false, bMod = false, bDel = false, bView = false;
        int j = 0,iXmlModID = 0;


        if (GetPageName(Request.RawUrl.ToString()).ToUpper().IndexOf("ASPX") > 0)
        {
            ArrayList oArrLst = ((ArrayList)HttpContext.Current.Session["RightsInfo"]);
            iXmlModID = Convert.ToInt32(GetModuleID());

            for (int i = 0; i <= oArrLst.Count - 1; i++)
            {
                int tmpOptionID = Convert.ToInt32(((Rights)oArrLst[i]).ModuleID);
                if (tmpOptionID == iXmlModID)
                {
                    sAdd = ((Rights)oArrLst[i]).Add.ToString();
                    sMod = ((Rights)oArrLst[i]).Mod.ToString();
                    sDel = ((Rights)oArrLst[i]).Del.ToString();
                    sView = ((Rights)oArrLst[i]).View.ToString();

                    if (sAdd == "Y")
                    {
                        bAdd = true;
                    }

                    if (sMod == "Y")
                    {
                        bMod = true;
                    }

                    if (sDel == "Y")
                    {
                        bDel = true;
                    }

                    if (sView == "Y")
                    {
                        bView = true;
                    }

                    if (!bView)
                    {
                        HttpContext.Current.Response.Redirect("ErrMsg.aspx?ID=02");
                    }

                    HtmlInputButton oAddBtn = Utility.FindControlRecursive(this, "btnAdd") as HtmlInputButton;
                    if (oAddBtn != null)
                    {
                        if (bAdd)
                        {
                            oAddBtn.Disabled = false;
                        }
                        else
                        {
                            oAddBtn.Disabled = true;
                        }
                    }

                    DataGrid dgList = Utility.FindControlRecursive(this, "dgList") as DataGrid;
                    if (dgList != null)
                    {
                        for (j = 0; j <= dgList.Items.Count - 1; j++)
                        {
                            if(((ImageButton)dgList.Items[j].FindControl("btnView")) != null)
                            {
                                ((ImageButton)dgList.Items[j].FindControl("btnView")).Enabled = bView;
                            }

                            if (((ImageButton)dgList.Items[j].FindControl("btnEdit")) != null)
                            {
                                ((ImageButton)dgList.Items[j].FindControl("btnEdit")).Enabled = bMod;
                            }

                            if (((ImageButton)dgList.Items[j].FindControl("btnDel")) != null)
                            {
                                ((ImageButton)dgList.Items[j].FindControl("btnDel")).Enabled = bDel;
                            }
                        }
                    }

                    Button btnSave = Utility.FindControlRecursive(this, "btnSave") as Button;
                    if (btnSave != null)
                    {
                        if (Request["Action"] != null)
                        {
                            if (Request["Action"].ToUpper() == "E")
                            {
                                btnSave.Enabled = bMod;
                            }

                            if (Request["Action"].ToUpper() == "A")
                            {
                                btnSave.Enabled = bAdd;
                            }
                        }
                    }
                }

            }
        }
    }
    #endregion

    #region GetModuleID
    #region INFO
    //  THIS FUNCTION WILL RETURN MODULE ID FROM A XML FILE BASED ON THE ASPX PAGE NAME
    #endregion
    protected string GetModuleID()
    {
        string sModID = "0";
        DataSet oDS = new DataSet();
        string sModFilePath = Request.PhysicalApplicationPath + @"Includes\Module.xml";
        sModFilePath=sModFilePath.Replace("\\",@"\");
        oDS.ReadXml(sModFilePath);
        for (int i = 0; i <= oDS.Tables[0].Rows.Count - 1; i++)
        {
            if (oDS.Tables[0].Rows[i]["Secure"].ToString().ToUpper() == "YES")
            {
                if (GetPageName(Path.GetFileName(Request.RawUrl.ToString()).ToUpper()) == oDS.Tables[0].Rows[i]["ViewPageName"].ToString().ToUpper())
                {
                    sModID = oDS.Tables[0].Rows[i]["ModuleID"].ToString();
                    break;
                }

                if (GetPageName(Path.GetFileName(Request.RawUrl.ToString()).ToUpper()) == oDS.Tables[0].Rows[i]["ListPageName"].ToString().ToUpper())
                {
                    sModID = oDS.Tables[0].Rows[i]["ModuleID"].ToString();
                    break;
                }

                if (GetPageName(Path.GetFileName(Request.RawUrl.ToString()).ToUpper()) == oDS.Tables[0].Rows[i]["UpsertPageName"].ToString().ToUpper())
                {
                    sModID = oDS.Tables[0].Rows[i]["ModuleID"].ToString();
                    break;
                }
            }
        }

        return sModID;
    }
    #endregion

    #region GetPageName
    #region INFO
    //THIS CODE WILL RETURN ONLY PAGE NAME EXCLUDING QUERY STRING
    #endregion
    private string GetPageName(string PageName)
    {
        string tmpPageName = "";
        tmpPageName = PageName;
        string[] splitted;

        if (PageName.IndexOf("?") > 0)
        {
            splitted = PageName.Split(new char[] { '?' });
            tmpPageName = splitted[0].ToString();
        }

        return tmpPageName;
    }
    #endregion
}
