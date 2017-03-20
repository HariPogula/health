using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class HomeMaster : System.Web.UI.MasterPage
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            lbl_user.Text = Session["user"].ToString();
            signin.Visible = false;
        }
        else
        {
            signin.Visible = true;
            hide.Visible = false;
        }
          
    }
}
