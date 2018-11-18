//Developed By : Tridip Bhattacharjee

using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Caching;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;



/// <summary>
/// Summary description for BasePage
/// </summary>
#region BasePage
public class BasePage : System.Web.UI.Page  
{
    public BasePage()
	{
        this.AddKeepAlive();
    }
     

    #region GetModuleID
    #region INFO
    //  THIS FUNCTION WILL RETURN MODULE ID FROM A XML FILE BASED ON THE ASPX PAGE NAME
    #endregion
    protected string GetModuleID()
    {
        string sModID="0";
        DataSet oDS = new DataSet();
        oDS.ReadXml(Request.PhysicalApplicationPath+@"Includes\Module.xml");
        for (int i = 0; i <= oDS.Tables[0].Rows.Count - 1; i++)
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
            splitted = PageName.Split(new char[] {'?'});
            tmpPageName = splitted[0].ToString();
        }

        return tmpPageName;
    }
    #endregion

    #region CheckQString
    #region INFO
    //THIS CODE WILL CHECK ANY QUERY STRING IS THERE WHEN REQUESTING A PAGE FOR INSERT/UPDATE/VIEW DATA
    #endregion
    protected void CheckQString()
    {
        bool flag = false;
        string sQString = HttpContext.Current.Request.ServerVariables["QUERY_STRING"];
        if (sQString != "")
        {
            if (Request["Action"] != null)
            {
                if (Request["Action"] == "A" || Request["Action"] == "E" || Request["Action"] == "V" || Request["Action"] == "R" || Request["Action"] == "C")
                {
                    flag = true;
                }
            }
        }

        if (!flag)
        {
            HttpContext.Current.Response.Redirect("../ErrMsg.aspx?ID=01");
        }
    }
    #endregion
    #region ClearFilterControls
    #region INFO
    //  THIS CODE WILL CLEAR ALL CONTROL PLACED IN A FILTER PANEL
    #endregion
    protected void ClearFilterControls(Panel oPanel)
    {
        foreach (Control oCtrl in oPanel.Controls)
        {
            if (oCtrl is TextBox)
            {
                TextBox txtBox = new TextBox();
                txtBox = (TextBox)oCtrl;
                txtBox.Text = "";
            }

            if (oCtrl is DropDownList)
            {
                DropDownList oDropDownList = new DropDownList();
                oDropDownList = (DropDownList)oCtrl;
                oDropDownList.SelectedIndex = -1;
            }

            if (oCtrl is CheckBox)
            {
                CheckBox oCheckBox = new CheckBox();
                oCheckBox = (CheckBox)oCtrl;
                oCheckBox.Checked=false;
            }
        }
    }
    #endregion

    #region AddKeepAlive
    #region INFO
    //  THIS CODE WILL CAUSE THE CLIENT TO REQUEST WITHIN 30 SECONDS OF THE SESSION TIMEOUT 
    //  THE PAGE RECONNECT.ASPX.AS RESULT THE SESSION WILL NEVER GET EXPIRE.
    #endregion
    private void AddKeepAlive()
    {
        int int_MilliSecondsTimeOut = 15000;
        string str_Script = @"
        <script type='text/javascript'>
        var count=0;
        var max = 5;
        function Reconnect()
        {
            count++;
            if (count < max)
            {
                window.status = 'Refreshed...';
                var img = new Image(1,1);
                img.src = 'Reconnect.aspx';
            }
        }
        window.setInterval('Reconnect()',"+ int_MilliSecondsTimeOut.ToString()+ @"); 
        </script>";
        
        this.Page.RegisterClientScriptBlock("Reconnect", str_Script);
    }
    #endregion

    //#region SavePageStateToPersistenceMedium
    //protected override void SavePageStateToPersistenceMedium(object viewState)
    //{
    //    #region Info
    //    //THIS FUNCTION STORE ALL THE VIEWSTATE IN A SESSION OR CACHE BASED ON CONFIG IN CONFIG FILE
    //    //AS A RESULT VIEWSTATE WILL BE MAINTAIN ON THE SERVERSIDE AND WILL NOT COME IN PAGE
    //    //SO PAGE GETS DOWNLOAD IN THE CLIENT MACHINE VERY QUICKLY
    //    #endregion

    //    string VSKey;
    //    VSKey = "VIEWSTATE_" + base.Session.SessionID + "_" + Request.RawUrl + "_" + System.DateTime.Now.Ticks.ToString();
    //    if (ConfigurationManager.AppSettings["ServerSideViewState"].ToUpper() == "TRUE")
    //    {
    //        if (ConfigurationManager.AppSettings["ViewStateStore"].ToUpper() == "CACHE")
    //        {
    //            Cache.Add(VSKey, viewState, null, System.DateTime.Now.AddMinutes(Session.Timeout), Cache.NoSlidingExpiration, CacheItemPriority.Default, null);
    //        }
    //        else
    //        {
    //            DataTable VsDataTable;
    //            DataRow DbRow = null;
    //            if (Session["__VSDataTable"] == null)
    //            {
    //                DataColumn[] PkColumn = new DataColumn[1];
    //                DataColumn DbColumn;
    //                VsDataTable = new DataTable("VState");
    //                DbColumn = new DataColumn("VSKey", typeof(string));
    //                VsDataTable.Columns.Add(DbColumn);
    //                PkColumn[0] = DbColumn;
    //                VsDataTable.PrimaryKey = PkColumn;
    //                DbColumn = new DataColumn("VSData", typeof(object));
    //                VsDataTable.Columns.Add(DbColumn);
    //                DbColumn = new DataColumn("DateTime", typeof(System.DateTime));
    //                VsDataTable.Columns.Add(DbColumn);
    //            }
    //            else
    //            {
    //                VsDataTable = ((DataTable)Session["__VSDataTable"]);
    //            }
    //            if (DbRow != null)
    //            {
    //                DbRow = VsDataTable.Rows.Find(VSKey);
    //            }
    //            else
    //            {
    //                DbRow = VsDataTable.NewRow();
    //                DbRow["VSKey"] = VSKey;
    //                DbRow["VsData"] = viewState;
    //                DbRow["DateTime"] = System.DateTime.Now;
    //                VsDataTable.Rows.Add(DbRow);
    //            }

    //            if (Convert.ToInt16(ConfigurationManager.AppSettings["ViewStateTableSize"]) < VsDataTable.Rows.Count)
    //            {
    //                VsDataTable.Rows[0].Delete();
    //            }
    //            Session["__VSDataTable"] = VsDataTable;
    //        }
    //        Page.ClientScript.RegisterHiddenField("__VIEWSTATE_KEY", VSKey);
    //    }
    //    else
    //    {
    //        base.SavePageStateToPersistenceMedium(viewState);
    //    }
    //}
    //#endregion

    //#region LoadPageStateFromPersistenceMedium
    //protected override object LoadPageStateFromPersistenceMedium()
    //{
    //    #region Info
    //    //THIS FUNCTION RESTOTE THE VIEWSTATE FROM A SESSION OR CACHE BASED ON CONFIG IN CONFIG FILE
    //    #endregion

    //    if (ConfigurationManager.AppSettings["ServerSideViewState"].ToUpper() == "TRUE")
    //    {
    //        string VSKey;
    //        VSKey = Request.Form["__VIEWSTATE_KEY"];
    //        if (!(VSKey.StartsWith("VIEWSTATE_")))
    //        {
    //            throw new Exception("Invalid VIEWSTATE Key: " + VSKey);
    //        }
    //        if (ConfigurationManager.AppSettings["ViewStateStore"].ToUpper() == "CACHE")
    //        {
    //            return Cache[VSKey];
    //        }
    //        else
    //        {
    //            DataTable VsDataTable;
    //            DataRow DbRow = null;

    //            VsDataTable = ((DataTable)Session["__VSDataTable"]);
    //            if (VsDataTable != null)
    //            {
    //                DbRow = VsDataTable.Rows.Find(VSKey);
    //                /*if (DbRow!=null) 
    //                {
    //                    throw new Exception("VIEWStateKey not Found. Consider increasing the ViewStateTableSize parameter on Web.Config file.");
    //                }
    //                */
    //            }
    //            return DbRow["VsData"];
    //        }
    //    }
    //    else
    //    {
    //        return base.LoadPageStateFromPersistenceMedium();
    //    }
    //}
    //#endregion

    #region StorePageState
    #region Info
    //THIS FUNCTION BASICALLY HOLD THE CONTROLS VALUE MEANS STATE WHEN WE REDIRECT TO ANOTHER PAGE
    #endregion
    protected void StorePageState(string sPageName, int PageNo, string SortColumn, string SortDirection)
    {
        string m_ChkBoxSearchField1 = "";
        string m_ChkBoxSearchField2 = "";
        string m_ChkBoxSearchField3 = "";

        string m_ddlSearchField1 = "";
        string m_ddlSearchField2 = "";
        string m_ddlSearchField3 = "";

        string m_ddlFilterCondition1 = "";
        string m_ddlFilterCondition2 = "";
        string m_ddlFilterCondition3 = "";

        string m_txtSearchValue1 = "";
        string m_txtSearchValue2 = "";
        string m_txtSearchValue3 = "";

        string m_ChkBoxMatchCase1 = "";
        string m_ChkBoxMatchCase2 = "";
        string m_ChkBoxMatchCase3 = "";

        ArrayList oArrFilter = new ArrayList();
        oArrFilter.Add(PageNo);
        oArrFilter.Add(SortColumn);
        oArrFilter.Add(SortDirection);

        DropDownList oddSearchField1 = Utility.FindControlRecursive(this.Master, "ddSearchField1") as DropDownList;
        if (oddSearchField1 != null)
        {
            m_ddlSearchField1 = oddSearchField1.SelectedValue;
        }

        DropDownList oddSearchField2 = Utility.FindControlRecursive(this.Master, "ddSearchField2") as DropDownList;
        if (oddSearchField2 != null)
        {
            m_ddlSearchField2 = oddSearchField2.SelectedValue;
        }

        DropDownList oddSearchField3 = Utility.FindControlRecursive(this.Master, "ddSearchField3") as DropDownList;
        if (oddSearchField3 != null)
        {
            m_ddlSearchField3 = oddSearchField3.SelectedValue;
        }
        //
        CheckBox oChkBoxSearchField1 = Utility.FindControlRecursive(this.Master, "chkSearch1") as CheckBox;
        if (oChkBoxSearchField1 != null)
        {
            m_ChkBoxSearchField1 = (oChkBoxSearchField1.Checked ? "1" : "0");
        }

        CheckBox oChkBoxSearchField2 = Utility.FindControlRecursive(this.Master, "chkSearch2") as CheckBox;
        if (oChkBoxSearchField2 != null)
        {
            m_ChkBoxSearchField2 = (oChkBoxSearchField2.Checked ? "1" : "0");
        }

        CheckBox oChkBoxSearchField3 = Utility.FindControlRecursive(this.Master, "chkSearch3") as CheckBox;
        if (oChkBoxSearchField3 != null)
        {
            m_ChkBoxSearchField3 = (oChkBoxSearchField3.Checked ? "1" : "0");
        }

        //
        DropDownList oddSearchCondition1 = Utility.FindControlRecursive(this.Master, "ddSearchCondition1") as DropDownList;
        if (oddSearchCondition1 != null)
        {
            m_ddlFilterCondition1 = oddSearchCondition1.SelectedValue;
        }

        DropDownList oddSearchCondition2 = Utility.FindControlRecursive(this.Master, "ddSearchCondition2") as DropDownList;
        if (oddSearchCondition2 != null)
        {
            m_ddlFilterCondition2 = oddSearchCondition2.SelectedValue;
        }

        DropDownList oddSearchCondition3 = Utility.FindControlRecursive(this.Master, "ddSearchCondition3") as DropDownList;
        if (oddSearchCondition3 != null)
        {
            m_ddlFilterCondition3 = oddSearchCondition3.SelectedValue;
        }

        //

        TextBox otxtCriteriaType1 = Utility.FindControlRecursive(this.Master, "txtCriteriaType1") as TextBox;
        if (otxtCriteriaType1 != null)
        {
            m_txtSearchValue1 = otxtCriteriaType1.Text.Trim();
        }

        TextBox otxtCriteriaType2 = Utility.FindControlRecursive(this.Master, "txtCriteriaType2") as TextBox;
        if (otxtCriteriaType2 != null)
        {
            m_txtSearchValue2 = otxtCriteriaType2.Text.Trim();
        }

        TextBox otxtCriteriaType3 = Utility.FindControlRecursive(this.Master, "txtCriteriaType3") as TextBox;
        if (otxtCriteriaType3 != null)
        {
            m_txtSearchValue3 = otxtCriteriaType3.Text.Trim();
        }

        //
        CheckBox ochkMC1 = Utility.FindControlRecursive(this.Master, "chkMC1") as CheckBox;
        if (ochkMC1 != null)
        {
            m_ChkBoxMatchCase1 = (ochkMC1.Checked ? "1" : "0");
        }

        CheckBox ochkMC2 = Utility.FindControlRecursive(this.Master, "chkMC2") as CheckBox;
        if (ochkMC2 != null)
        {
            m_ChkBoxMatchCase2 = (ochkMC2.Checked ? "1" : "0");
        }

        CheckBox ochkMC3 = Utility.FindControlRecursive(this.Master, "chkMC3") as CheckBox;
        if (ochkMC3 != null)
        {
            m_ChkBoxMatchCase3 = (ochkMC3.Checked ? "1" : "0");
        }

        oArrFilter.Add(new PageState(m_ChkBoxSearchField1, m_ddlSearchField1, m_ddlFilterCondition1, m_txtSearchValue1, m_ChkBoxMatchCase1));
        oArrFilter.Add(new PageState(m_ChkBoxSearchField2, m_ddlSearchField2, m_ddlFilterCondition2, m_txtSearchValue2, m_ChkBoxMatchCase2));
        oArrFilter.Add(new PageState(m_ChkBoxSearchField3, m_ddlSearchField3, m_ddlFilterCondition3, m_txtSearchValue3, m_ChkBoxMatchCase3));

        HttpContext.Current.Session[sPageName.ToUpper()] = oArrFilter;
    }
    #endregion 

    protected void KillSession(string sPageName)
    {
        if (HttpContext.Current.Session[sPageName.ToUpper()] != null)
        {HttpContext.Current.Session[sPageName.ToUpper()] = null;}
        
    }
    #region ReadPageState
    #region Info
    //THIS FUNCTION BASICALLY READ THE CONTROLS VALUE AND SET THE CONTROL VALUE 
    #endregion
    protected void ReadPageState(string sPageName, out int PageNo, out string SortColumn, out string SortDirection)
    {
        PageNo = 1;
        SortColumn = "";
        SortDirection = "";
        ArrayList oArrFilter = null;
        object oValue = "";

        if (HttpContext.Current.Session[sPageName.ToUpper()] != null)
        {
            oArrFilter = (ArrayList)HttpContext.Current.Session[sPageName];
            PageNo = Convert.ToInt32(oArrFilter[0]);
            SortColumn = oArrFilter[1].ToString();
            SortDirection = oArrFilter[2].ToString();

            oValue=((PageState)oArrFilter[3]).m_ddlSearchField;
            DropDownList oddSearchField1 = Utility.FindControlRecursive(this.Master, "ddSearchField1") as DropDownList;
            if (oddSearchField1 != null)
            {
                oddSearchField1.Items.FindByValue(oValue.ToString()).Selected = true;
            }

            oValue = ((PageState)oArrFilter[4]).m_ddlSearchField;
            DropDownList oddSearchField2 = Utility.FindControlRecursive(this.Master, "ddSearchField2") as DropDownList;
            if (oddSearchField2 != null)
            {
                oddSearchField2.Items.FindByValue(oValue.ToString()).Selected = true;
            }

            oValue = ((PageState)oArrFilter[5]).m_ddlSearchField;
            DropDownList oddSearchField3 = Utility.FindControlRecursive(this.Master, "ddSearchField3") as DropDownList;
            if (oddSearchField3 != null)
            {
                oddSearchField3.Items.FindByValue(oValue.ToString()).Selected = true;
            }

            oValue = ((PageState)oArrFilter[3]).m_ChkBoxSearchField;
            CheckBox oChkBoxSearchField1 = Utility.FindControlRecursive(this.Master, "chkSearch1") as CheckBox;
            if (oChkBoxSearchField1 != null)
            {
                if (oValue.ToString() == "1")
                    oChkBoxSearchField1.Checked = true;
                else
                    oChkBoxSearchField1.Checked = false;
            }

            oValue = ((PageState)oArrFilter[4]).m_ChkBoxSearchField;
            CheckBox oChkBoxSearchField2 = Utility.FindControlRecursive(this.Master, "chkSearch2") as CheckBox;
            if (oChkBoxSearchField2 != null)
            {
                if (oValue.ToString() == "1")
                    oChkBoxSearchField2.Checked = true;
                else
                    oChkBoxSearchField2.Checked = false;
            }

            oValue = ((PageState)oArrFilter[5]).m_ChkBoxSearchField;
            CheckBox oChkBoxSearchField3 = Utility.FindControlRecursive(this.Master, "chkSearch3") as CheckBox;
            if (oChkBoxSearchField3 != null)
            {
                if (oValue.ToString() == "1")
                    oChkBoxSearchField3.Checked = true;
                else
                    oChkBoxSearchField3.Checked = false;
            }

//
            oValue = ((PageState)oArrFilter[3]).m_ddlFilterCondition;
            DropDownList oddSearchCondition1 = Utility.FindControlRecursive(this.Master, "ddSearchCondition1") as DropDownList;
            if (oddSearchCondition1 != null)
            {
                oddSearchCondition1.Items.FindByValue(oValue.ToString()).Selected = true;
            }

            oValue = ((PageState)oArrFilter[4]).m_ddlFilterCondition;
            DropDownList oddSearchCondition2 = Utility.FindControlRecursive(this.Master, "ddSearchCondition2") as DropDownList;
            if (oddSearchCondition2 != null)
            {
                oddSearchCondition2.Items.FindByValue(oValue.ToString()).Selected = true;
            }

            oValue = ((PageState)oArrFilter[5]).m_ddlFilterCondition;
            DropDownList oddSearchCondition3 = Utility.FindControlRecursive(this.Master, "ddSearchCondition3") as DropDownList;
            if (oddSearchCondition3 != null)
            {
                oddSearchCondition3.Items.FindByValue(oValue.ToString()).Selected = true;
            }
//
            oValue = ((PageState)oArrFilter[3]).m_txtSearchValue;
            TextBox otxtCriteriaType1 = Utility.FindControlRecursive(this.Master, "txtCriteriaType1") as TextBox;
            if (otxtCriteriaType1 != null)
            {
                otxtCriteriaType1.Text = oValue.ToString().Trim();
            }

            oValue = ((PageState)oArrFilter[4]).m_txtSearchValue;
            TextBox otxtCriteriaType2 = Utility.FindControlRecursive(this.Master, "txtCriteriaType2") as TextBox;
            if (otxtCriteriaType2 != null)
            {
                otxtCriteriaType2.Text = oValue.ToString().Trim();
            }

            oValue = ((PageState)oArrFilter[5]).m_txtSearchValue;
            TextBox otxtCriteriaType3 = Utility.FindControlRecursive(this.Master, "txtCriteriaType3") as TextBox;
            if (otxtCriteriaType3 != null)
            {
                otxtCriteriaType3.Text = oValue.ToString().Trim();
            }
//
            oValue = ((PageState)oArrFilter[3]).m_ChkBoxMatchCase;
            CheckBox ochkMC1 = Utility.FindControlRecursive(this.Master, "chkMC1") as CheckBox;
            if (ochkMC1 != null)
            {
                if (oValue.ToString() == "1")
                    ochkMC1.Checked = true;
                else
                    ochkMC1.Checked = false;
            }

            oValue = ((PageState)oArrFilter[4]).m_ChkBoxMatchCase;
            CheckBox ochkMC2 = Utility.FindControlRecursive(this.Master, "chkMC2") as CheckBox;
            if (ochkMC2 != null)
            {
                if (oValue.ToString() == "1")
                    ochkMC2.Checked = true;
                else
                    ochkMC2.Checked = false;
            }

            oValue = ((PageState)oArrFilter[5]).m_ChkBoxMatchCase;
            CheckBox ochkMC3 = Utility.FindControlRecursive(this.Master, "chkMC3") as CheckBox;
            if (ochkMC3 != null)
            {
                if (oValue.ToString() == "1")
                    ochkMC3.Checked = true;
                else
                    ochkMC3.Checked = false;
            }

        }
    }
    #endregion 
}
#endregion 