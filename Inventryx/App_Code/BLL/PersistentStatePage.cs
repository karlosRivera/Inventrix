using System;
using System.Collections;
using System.Collections.Specialized;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Serialization;
using System.IO;

namespace X.Web.UI {
	/// <summary>
	/// To use this class, simply call the RedirectSavingPageState(string url) method instead of
	/// Response.Redirect to call a page and have this page keep its state.
	/// You must also replace Request.Form with PostData throughout the existing code in your page.
	/// 
	/// The substitution of Request.Form in existing code is necessary because the .NET framework doesn't
	/// let us replace or modify the Request.Form collection.
	/// </summary>
	public class PersistentStatePage : System.Web.UI.Page 
    {
		/// <summary>
		/// The persisted PageState.
		/// This is non-null if a postback is being emulated from the persisted PageState.
		/// </summary>
		private PageState pageState=null;

		/// <summary>
		/// Contains the URL to redirect to
		/// </summary>
		private string redirectSavingPageStateURL=null;

		/// <summary>
		/// Constructor
		/// </summary>
    public PersistentStatePage() {
			// The following statement must be uncommented if running under .NET 2.0 to avoid an
			// "Invalid postback or callback argument" exception when restoring the page state.
			EnableEventValidation=false;
    }
		
		/// <summary>
		/// Indicates whether the current page is being or has been restored from a persisted state
		/// </summary>
		public bool IsRestoredPageState {
			get {
				return pageState!=null;
			}
		}

		/// <summary>
		/// Returns the post data from the persisted PageState if it exists, otherwise the actual post data from Request.Form
		/// </summary>
		public NameValueCollection PostData {
			get {
				return IsRestoredPageState ? pageState.PostData : Request.Form;
			}
		}

		/// <summary>
		/// Returns the data passed back from the sub-page which can be used to make changes to the saved page state.
		/// This data is passed back via the query string.
		/// </summary>
		public NameValueCollection PassBackData {
			get {
				return IsRestoredPageState ? pageState.PassBackData : null;
			}
		}

		/// <summary>
		/// Call this method instead of Response.Redirect(url) to cause this page to restore its current state when it is next displayed.
		/// </summary>
		public void RedirectSavingPageState(string url) {
			redirectSavingPageStateURL=url;
		}

		/// <summary>
		/// Call this method to redirect to the specified relative URL,
		/// specifying whether to restore the page's saved state
		/// (assuming its state was saved when it was last shown).
		/// The specified URL is relative to that of the current request.
		/// This method is usually called from a "sub-page", which doesn't extend this class. 
		/// </summary>
		public static void RedirectToSavedPage(string url, bool restorePageState) {
			if (!restorePageState) RemoveSavedPageState(url);
			HttpContext.Current.Response.Redirect(url);
		}

		/// <summary>
		/// Call this method to clear the saved PageState of the page with the specified relative URL.
		/// This ensures that the next redirect to the specified page will not revert to the saved state.
		/// The specified URL is relative to that of the current request.
		/// </summary>
		public static void RemoveSavedPageState(string url) {
			RemoveSavedPageState(new Uri(HttpContext.Current.Request.Url,url));
		}

		/// <summary>
		/// This method is called by the framework after the Init event to determine whether a postback is being performed.
		/// The Page.IsPostBack property returns true iff this method returns a non-null.
		/// </summary>
		protected override NameValueCollection DeterminePostBackMode() {
			pageState=LoadPageState(Request.Url);
			NameValueCollection normalReturnObject=base.DeterminePostBackMode();
			if (!IsRestoredPageState) return normalReturnObject; // default to normal behaviour if there is no persisted pagestate.
			if (normalReturnObject!=null) {
				// this is a normal postback, so don't use persisted page state
				pageState=null;
				RemoveSavedPageState(Request.Url); // clear the page state from the persistence medium so it is not used again
				return normalReturnObject;
			}
			// If we get to this point, we want to restore the persisted page state.
			// Save PassBackData if we have not already done so:
			if (pageState.PassBackData==null) {
				pageState.PassBackData=Request.QueryString;
				// call SavePageState again in case the change we just made is not persisted purely in memory:
				SavePageState(pageState.Url,pageState);
			}
			// Check whether the current request URL matches the persisted URL:
			if (pageState.Url.AbsoluteUri!=Request.Url.AbsoluteUri) {
				// The url, and hence the query string, doesn't match the one in the page state, so reload this page immediately with the persisted URL.
				Response.Redirect(pageState.Url.AbsoluteUri,true);
			}
			RemoveSavedPageState(Request.Url); // clear the page state from the persistence medium so it is not used again
			// This method must return something other than null, otherwise the framework does not call
			// the LoadPageStateFromPersistenceMedium() method and IsPostBack will return false.
			// Request.Form is an empty object of the correct type to achieve this.
			return Request.Form;
		}

		/// <summary>
		/// This method is called by the framework after DeterminePostBackMode(), but before custom event handling.
		/// It returns the view state that the framework uses to restore the state of the controls.
		/// </summary>
		protected override object LoadPageStateFromPersistenceMedium() {
			if (!IsRestoredPageState) return base.LoadPageStateFromPersistenceMedium(); // default to normal behaviour if we don't want to restore the persisted page state
			return pageState.ViewStateObject; // otherwise return the ViewStateObject contained in the persisted pageState
		}

		/// <summary>
		/// This method is called by the framework after LoadPageStateFromPersistenceMedium() to raise the Load event.
		/// Controls are populated with data from PostData here because it has to happen after
		/// the framework has loaded the view state, which happens after the execution of the
		/// LoadPageStateFromPersistenceMedium() method.
		/// </summary>
		override protected void OnLoad(EventArgs e) {
			// The following code is meant to emulate what ASP.NET does "automagically" for us when it
			// populates the controls with post data before processing the events.
			// http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpguide/html/cpconreceivingpostbackdatachangednotifications.asp
			// The difference is that this one populates them with our persisted post data instead of the
			// actual post data from Request.Form.
			if (IsRestoredPageState) {
				// Populate controls with PostData, saving a list of those that were modified:
				ArrayList modifiedControls=new ArrayList();
				LoadPostData(this,modifiedControls);
				// Raise PostDataChanged event on all modified controls:
				foreach (IPostBackDataHandler control in modifiedControls)
					control.RaisePostDataChangedEvent();
			}
			base.OnLoad(e);
		}

		/// <summary>
		/// This method performs depth-first recursion on all controls contained in the specified control,
		/// calling the framework's LoadPostData on each and adding those modified to the modifiedControls list.
		/// </summary>
		private void LoadPostData(Control control, ArrayList modifiedControls) {
			// Perform recursion of child controls:
			foreach (Control childControl in control.Controls)
				LoadPostData(childControl,modifiedControls);
			// Load the post data for this control:
			if (control is IPostBackDataHandler) {
				// Get the value of the control's name attribute, which is the GroupName of radio buttons,
				// or the same as the UniqueID attribute for all other controls:
				string nameAttribute=(control is RadioButton) ? ((RadioButton)control).GroupName : control.UniqueID;
				if (control is CheckBoxList) {
					// CheckBoxLists also require special handling:
					int i=0;
					foreach (ListItem listItem in ((ListControl)control).Items)
						if (PostData[nameAttribute+':'+(i++)]!=null) {
							listItem.Selected=true;
							modifiedControls.Add(control);
						}
				} else {
					// Don't process this control if its key isn't in the PostData, as the
					// LoadPostData implementation of some controls throws an exception in this case.
					if (PostData[nameAttribute]==null) return;
					// Call the framework's LoadPostData on this control using the name attribute as the post data key:
					if (((IPostBackDataHandler)control).LoadPostData(nameAttribute,PostData))
						modifiedControls.Add(control);
				}
			}
		}

		/// <summary>
		/// This method is called by the framework between the PreRender and Render events.
		/// It is only called if this page is to be redisplayed, not if Response.Redirect has been called.
		/// To ensure it is called before we redirect, we must postpone the Response.Redirect call until now.
		/// </summary>
		protected override void SavePageStateToPersistenceMedium(object viewState) {
			if (redirectSavingPageStateURL==null) {
				// default to normal behaviour
				base.SavePageStateToPersistenceMedium(viewState);
			} else {
				// persist the current state and redirect to the new page
				SavePageState(Request.Url,new PageState(viewState,Request.Form,Request.Url));
				Response.Redirect(redirectSavingPageStateURL);
			}
		}

		/// <summary>
		/// Override this method to load the state from a persistence medium other than the Session object.
		/// </summary>
		protected static PageState LoadPageState(Uri pageURL) {
			return (PageState)HttpContext.Current.Session[GetPageStateKey(pageURL)];
		}

		/// <summary>
		/// Override this method to save the state to a persistence medium other than the Session object.
		/// </summary>
		protected static void SavePageState(Uri pageURL, PageState pageState) {
			HttpContext.Current.Session[GetPageStateKey(pageURL)]=pageState;
		}

		/// <summary>
		/// Override this method to remove the state from a persistence medium other than the Session object.
		/// </summary>
		protected static void RemoveSavedPageState(Uri pageURL) {
			SavePageState(pageURL,null);
		}

		/// <summary>
		/// Returns a key which will uniquely identify a page in a global namespace based on its URL.
		/// </summary>
		private static string GetPageStateKey(Uri pageURL) {
			return "_PAGE_STATE_"+pageURL.AbsolutePath;
		}
	}

	/// <summary>
	/// This is the object stored in the persistence medium, containing the view state, post data, and URL.
	/// </summary>
	[Serializable]
	public class PageState {
		private SerializableViewState serializableViewState;
		public NameValueCollection PostData;
		public Uri Url;
		
		// PassBackData is used to store data that is passed back to the parent page from the sub-page:
		public NameValueCollection PassBackData;

		public PageState(object viewStateObject, NameValueCollection postData, Uri url) {
			serializableViewState=new SerializableViewState(viewStateObject);
			PostData=postData;
			Url=url;
		}

		public object ViewStateObject {
			get {
				return serializableViewState.ViewStateObject;
			}
		}
	}

	/// <summary>
	/// This is a simple wrapper around the view state object to make it serializable.
	/// </summary>
	[Serializable]
	public class SerializableViewState : ISerializable {
		public object ViewStateObject;

		private const string ViewStateStringKey="ViewStateString";
		
		public SerializableViewState(object viewStateObject) {
			ViewStateObject=viewStateObject;
		}

		public SerializableViewState(SerializationInfo info, StreamingContext context) {
			ViewStateObject=new LosFormatter().Deserialize(info.GetString(ViewStateStringKey));
		}
		
		public void GetObjectData(SerializationInfo info, StreamingContext context) {
			StringWriter stringWriter=new StringWriter();
			new LosFormatter().Serialize(stringWriter,ViewStateObject);
			info.AddValue(ViewStateStringKey,stringWriter.ToString());
		}
	}
}
