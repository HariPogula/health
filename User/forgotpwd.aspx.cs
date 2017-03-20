using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class forgotpwd : System.Web.UI.Page
{
    aayurvedicDataContext _context = new aayurvedicDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            txt_email.Text = Session["user"].ToString();
        }
        var questions = (from i in _context.user_secques
                         join u in _context.reg_temps on i.email equals u.email
                         join q in _context.sec_questions on i.q_id equals q.secq_id
                         where i.email == txt_email.Text
                         select new
                         {
                             ques = q.secq_name,
                             ans = i.ans,
                             id = q.secq_id
                         }).ToArray();
        lbl_sec1.Text = questions[0].ques;
        lbl_sec2.Text = questions[1].ques;
        lbl_sec3.Text = questions[2].ques;
    }
}