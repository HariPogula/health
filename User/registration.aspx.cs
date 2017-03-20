using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.IO;

public partial class registration : System.Web.UI.Page
{
    aayurvedicDataContext _context = new aayurvedicDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbl_msgr.Visible = false;
            //Generating random numbers.
             List<int> randomList = new List<int>();
            int _min = 1000;
            int _max = 9999;
            Random _rdm = new Random();
       int   rdm_num= _rdm.Next(_min, _max);
            while(true)
                {
                if (!randomList.Contains(rdm_num))
                    randomList.Add(rdm_num);
                lbl_random.Text =   rdm_num.ToString();
               // string r = lbl_random.Text;
               //string u=  r.TrimStart('u');
               // string un = u.TrimStart('_');
               // Label2.Text = un;
                break;
            }//End of Generating numbers

            //Load Security Questions
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
            ListItem question = new ListItem("Select a Question", "-1");
            ddl_sec1.Items.Insert(0, question);
            ddl_sec2.Items.Insert(0, question);
            ddl_sec3.Items.Insert(0, question);
            ///////
            lbl_img.Visible = false;
            lbl_emailex.Visible = false;
        }
        Image1.ImageUrl = "../Images/start.jpg";
    }
    
    protected void btn_regitser_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }

    protected void btn_success_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //Encrypted Password.
            var encrptpassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txt_pwd.Text,"SHA1");
            //To store user info.
            var result = _context.sp_reg_temp ( Convert.ToInt32( lbl_random.Text)  ,txt_fname.Text,txt_lname.Text,txt_email.Text,encrptpassword).Single();
            //To store security questions.
            _context.sp_secquestions(txt_email.Text, Convert.ToInt32( ddl_sec1.SelectedItem.Value),Convert.ToInt32( ddl_sec2.SelectedItem.Value),Convert.ToInt32( ddl_sec3.SelectedItem.Value),txt_sans1.Text,txt_sans2.Text,txt_sans3.Text);
            //HttpPostedFile postfile = FileUpload1.PostedFile;
            //string filename = Path.GetFileName(postfile.FileName);
            //string fileextension = Path.GetExtension(filename);
            //int filesize = postfile.ContentLength;
           
            //    Stream stream = postfile.InputStream;
            //    BinaryReader binaryreader = new BinaryReader(stream);
            //    byte[] bytes = binaryreader.ReadBytes((int)stream.Length);
            //string strbase64 = Convert.ToBase64String(bytes);
            //_context.sp_storeimages(  txt_email.Text ,filename, filesize, bytes);
            //    //string strbase64 = Convert.ToBase64String(bytes);
              //  Image1.ImageUrl = "data:Image/png;base64," + strbase64;

               
        
            int exists = (int)result.returnvalue;
            if (exists == -1)
            {
                lbl_msgr.Visible = true;
                lbl_msgr.Text = "User Already Exists";
                lbl_msgr.CssClass = "alert alert-danger";
               // Response.Write("<script>alert('User is already Exists');</script>");
                //foreach (Control c in Controls)
                //{
                //    if ((c.GetType() == typeof(TextBox)))  //Clear TextBox
                //    {
                //        ((TextBox)(c)).Text = "";
                //    }
                //}
                // txt_fname.Text = "";
                //Label1.Text = "user exists";
            }
            else
            {
                lbl_msgr.Visible = true;
                lbl_msgr.Text = "Congratulations";
                lbl_msgr.CssClass = "alert alert-success";
                //  Response.Write("<script>alert('Congratulations');</script>");
             //   Response.Redirect("login.aspx");
                // Label1.Text = "congrats";
            }
        }
    }

    protected void btn_upload_Click(object sender, EventArgs e)
    {
        HttpPostedFile postfile = FileUpload1.PostedFile;
        string filename = Path.GetFileName(postfile.FileName);
        string fileextension = Path.GetExtension(filename);
        int filesize = postfile.ContentLength;
        if (fileextension.ToLower() == ".jpg" || fileextension.ToLower() == ".png" || fileextension.ToLower() == ".gif" || fileextension.ToLower() == ".bmp")
        {
            Stream stream = postfile.InputStream;
            BinaryReader binaryreader = new BinaryReader(stream);
            byte[] bytes = binaryreader.ReadBytes((int)stream.Length);
         //   _context.sp_storeimages(  txt_email.Text ,filename, filesize, bytes);
            string strbase64 = Convert.ToBase64String(bytes);
            Image1.ImageUrl = "data:Image/png;base64," + strbase64;

            lbl_img.Visible = true;
            lbl_img.Text = "Uploaded";
        }
        else
        {
            lbl_img.Visible = true;
            lbl_img.Text = "Only Images";
        }
    }

    protected void txt_email_TextChanged(object sender, EventArgs e)
    {
        var email = (from i in _context.reg_temps
                     where i.email==txt_email.Text
                     select new
                     {
                         email = i.email
                     });
        if(email.Any())
        {
            lbl_emailex.Visible = true;
            lbl_emailex.Text = "Email alredy exists";
            lbl_emailex.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            lbl_emailex.Visible = true;
            lbl_emailex.Text = "proceed";
            lbl_emailex.ForeColor = System.Drawing.Color.Green;
        }
    }
}