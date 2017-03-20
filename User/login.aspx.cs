using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    aayurvedicDataContext _context = new aayurvedicDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    protected void btn_regitser_Click(object sender, EventArgs e)
    {
        Response.Redirect("registration.aspx");
    }

    protected void btn_success_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            var encrptpassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txt_password.Text, "SHA1");
            var result = (from i in _context.reg_temps
                          where i.email == txt_email.Text && i.password == encrptpassword
                          select i);
            if (result.Any())
            {
                Session["user"] = txt_email.Text;
                Response.Redirect("home.aspx", true);

            }
            else
            {
                Response.Write("Failure");
                // return false;
            }
        }
    }

    protected void btn_forgot_Click(object sender, EventArgs e)
    {
        Session["user"] = txt_email.Text;
        Response.Redirect("forgotpwd.aspx", true);
    }
}