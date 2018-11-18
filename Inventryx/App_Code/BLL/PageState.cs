//Developed By : Tridip Bhattacharjee

using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Components.DAL;

/// <summary>
/// Summary description for PageState
/// </summary>
public class PageState
{
    #region Notes
    //THIS CLASS WILL BE USED TO STORE PAGE STATE.
    #endregion Notes


    public string m_ChkBoxSearchField = "";
    public string m_ddlSearchField = "";
    public string m_ddlFilterCondition = "";
    public string m_txtSearchValue = "";
    public string m_ChkBoxMatchCase = "";

    public PageState() { }

    public PageState(string ChkBoxSearchField,string ddlSearchField, string ddlFilterCondition, string txtSearchValue, string ChkBoxMatchCase)
    {
        m_ChkBoxSearchField = ChkBoxSearchField;
        m_ddlSearchField = ddlSearchField;
        m_ddlFilterCondition = ddlFilterCondition;
        m_txtSearchValue = txtSearchValue;
        m_ChkBoxMatchCase = ChkBoxMatchCase;
    }
}
