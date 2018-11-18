//Developed By : Tridip Bhattacharjee

using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for Rights
/// </summary>
public class Rights
{
    #region Notes
    //this class will Be USED TO STORE USER RELATED MODULES INFORMATION.
    #endregion Notes

	private int m_ModuleID=0;
    private string m_View= "";
    private string m_Add = "";
    private string m_Mod = "";
    private string m_Del = "";

	public Rights(){}

    public Rights(int ModuleID, string View, string Add, string Mod, string Del)
    {
        this.m_ModuleID = ModuleID;
        this.m_View = View;
        this.m_Add = Add;
        this.m_Mod = Mod;
        this.m_Del = Del;
    }

    public int ModuleID
    {
        get
        {
            return m_ModuleID;
        }
        set
        {
            m_ModuleID = value;
        }
    }

    public string View
    {
        get
        {
            return m_View;
        }
        set
        {
            m_View = value;
        }
    }

    public string Add
    {
        get
        {
            return m_Add;
        }
        set
        {
            m_Add = value;
        }
    }

    public string Mod
    {
        get
        {
            return m_Mod;
        }
        set
        {
            m_Mod = value;
        }
    }

    public string Del
    {
        get
        {
            return m_Del;
        }
        set
        {
            m_Del = value;
        }
    }
}
