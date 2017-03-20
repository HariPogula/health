using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    aayurvedicDataContext _context = new aayurvedicDataContext();
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            txt_sans1.ReadOnly = true;
            //Adding Security Questions.
            if (Session["user"] != null)
            {
                txt_email.Text = Session["user"].ToString();

            }
            //Retrieve the user basic info.
            var basic = (from i in _context.reg_temps
                         where i.email == txt_email.Text
                         select new
                         {
                             firstname = i.firstname,
                             lastname = i.lastname,
                           password=  i.password
                         }).Single();
            
            txt_fname.Text = basic.firstname;
            txt_lname.Text = basic.lastname;
            txt_pwd.Text = basic.password;
            
            //Retrieve the questions.
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


            var sec1 = (from i in _context.sec_questions
                        select i).ToList();
            ddl_sec1.DataTextField = "secq_name";
            ddl_sec1.DataValueField = "secq_id";

            ddl_sec2.DataTextField = "secq_name";
            ddl_sec2.DataValueField = "secq_id";

            ddl_sec3.DataTextField = "secq_name";
            ddl_sec3.DataValueField = "secq_id";


            ddl_sec1.DataSource = sec1;
            ddl_sec1.DataBind();

            ddl_sec2.DataSource = sec1;
            ddl_sec2.DataBind();

            ddl_sec3.DataSource = sec1;
            ddl_sec3.DataBind();

            //  ddl_sec1.SelectedItem.Text = questions[0].ques;
            //ddl_sec2.SelectedItem.Text = questions[1].ques;
            //ddl_sec3.SelectedItem.Text = questions[2].ques;


            ListItem question = new ListItem("Select a Question", "-1");
            ddl_sec1.Items.Insert(0, question);
            ddl_sec2.Items.Insert(0, question);
            ddl_sec3.Items.Insert(0, question);
            ddl_sec1.SelectedIndex = questions[0].id;
            ddl_sec2.SelectedIndex = questions[1].id;
            ddl_sec3.SelectedIndex = questions[2].id;
            //lbl_secq1.Text = questions[0].ques;
            //lbl_secq2.Text = questions[1].ques;
            //lbl_secq3.Text = questions[2].ques;
            txt_sans1.Text = questions[0].ans;
            txt_sans2.Text = questions[1].ans;
            txt_sans3.Text = questions[2].ans;



            // Image1.ImageUrl = img;
            txt_fname.ReadOnly = true;
            txt_lname.ReadOnly = true;
            txt_email.ReadOnly = true;
            txt_pwd.ReadOnly = true;
            txt_cpwd.ReadOnly = true;
            lbl_alert.Visible = false;
            if (Session["user"] != null)
            {
                lbl_user.Text = Session["user"].ToString();

            }
        }
    }

    protected void btn_regitser_Click(object sender, EventArgs e)
    {
        txt_fname.ReadOnly = false;
        txt_lname.ReadOnly = false;
        txt_email.ReadOnly = false;
        txt_pwd.ReadOnly = false;
        txt_cpwd.ReadOnly = false;
    }

    

    protected void btn_success_Click(object sender, EventArgs e)
    {
        lbl_alert.Visible = true;
        lbl_alert.Text = "Form Submitted Successfully";
        txt_fname.ReadOnly = true;
        txt_lname.ReadOnly = true;
        txt_email.ReadOnly = true;
        txt_pwd.ReadOnly = true;
        txt_cpwd.ReadOnly = true;

    }

    protected void btnSaveImage_Click(object sender, EventArgs e)
    {

    }

    protected void btn_reset_Click(object sender, EventArgs e)
    {
        txt_fname.ReadOnly = true;
        txt_lname.ReadOnly = true;
        txt_email.ReadOnly = true;
        txt_pwd.ReadOnly = true;
        txt_cpwd.ReadOnly = true;

    }

    protected void btn_upload_Click(object sender, EventArgs e)
    {

    }

    protected void ddl_sec1_SelectedIndexChanged(object sender, EventArgs e)
    {

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
        if (ddl_sec1.SelectedIndex != questions[0].id)
        {
            txt_sans1.ReadOnly = false;
        }
        else
        {
            txt_sans1.ReadOnly = true;
        }
    }
}