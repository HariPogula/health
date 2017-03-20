using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    aayurvedicDataContext _context = new aayurvedicDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
         

           // lbl_exists.Visible = false;
           
            
            //Adding Body type as Titles
            var btype = (from i in _context.bodytypes
                         select i).ToList();
            foreach(bodytype b in btype)
            {
                lbl_vata.Text = btype[0].bodyt_name.ToString().ToUpperInvariant();//Vata Name
                lbl_vataindex.Text= btype[0].bodyt_id.ToString();//Vata Index
                lbl_pitta.Text = btype[1].bodyt_name.ToString().ToUpperInvariant();//Pitta Name
                lbl_pittaindex.Text= btype[1].bodyt_id.ToString();//Pitta Index
                lbl_kapha.Text = btype[2].bodyt_name.ToString().ToUpperInvariant();
            }
           // btn_vatau.Visible = false;
            //btn_vatac.Visible = false;
            //Adding Categories
            var categories = (from i in _context.categories
                              select i).ToList();
            
            ddl_category.DataTextField = "category_name";
            ddl_category.DataValueField = "category_id";
            ddl_category.DataSource = categories;
            ddl_category.DataBind();
            lbl_cat.Text = "Adding ";
            ListItem category = new ListItem("Select a Category", "-1");
            ddl_category.Items.Insert(0, category);
            //Adding tastes
            var taste = (from i in _context.tastes
                         select i).ToList();
            ddl_taste.DataTextField = "taste_name";
            ddl_taste.DataValueField = "taste_id";
            ddl_taste.DataSource = taste;
            ddl_taste.DataBind();
            ListItem tasteitem = new ListItem("Select Taste", "-1");
            ddl_taste.Items.Insert(0, tasteitem);
            //Add temperature
            var temp= (from i in _context.temperatures
                       select i).ToList();
            ddl_temp.DataTextField = "temp_name";
            ddl_temp.DataValueField = "temp_id";
            ddl_temp.DataSource = temp;
            ddl_temp.DataBind();
            ListItem tempitem = new ListItem("Select Temperature", "-1");
            ddl_temp.Items.Insert(0, tempitem);
            //Adding Vipak
            var vipak= (from i in _context.vipaks
                        select i).ToList();
            ddl_vipak.DataTextField = "vipak_name";
            ddl_vipak.DataValueField = "vipak_id";
            ddl_vipak.DataSource = vipak;
            ddl_vipak.DataBind();
            ListItem vipakitem = new ListItem("Select Vipak", "-1");
            ddl_vipak.Items.Insert(0, vipakitem);
            //Adding Quality
            var quality = (from i in _context.qualities
                         select i).ToList();
            ddl_quality.DataTextField = "q_name";
            ddl_quality.DataValueField = "q_id";
            ddl_quality.DataSource = quality;
            ddl_quality.DataBind();
            ListItem qualityitem = new ListItem("Select Quality", "-1");
            ddl_quality.Items.Insert(0, qualityitem);

            //query for retrive effect
            var effect = (from i in _context.effects
                          select new
                          {
                              i.effect_name,
                              i.effect_id
                          }).ToList();
            //This is for Body Type-Vata
            ddl_season1vs.DataTextField = "effect_name";
            ddl_season1vs.DataValueField = "effect_id";
            ddl_season1vs.DataSource = effect;
            ddl_season1vs.DataBind();
            ListItem uni = new ListItem("Select Effect", "-1");
           ddl_season1vs.Items.Insert(0, uni);

            ddl_season1vsm.DataTextField = "effect_name";
            ddl_season1vsm.DataValueField = "effect_id";
            ddl_season1vsm.DataSource = effect;
            ddl_season1vsm.DataBind();
            ddl_season1vsm.Items.Insert(0, uni);

            ddl_season1vw.DataTextField = "effect_name";
            ddl_season1vw.DataValueField = "effect_id";
            ddl_season1vw.DataSource = effect;
            ddl_season1vw.DataBind();
            ddl_season1vw.Items.Insert(0, uni);

            ddl_season1vf.DataTextField = "effect_name";
            ddl_season1vf.DataValueField = "effect_id";
            ddl_season1vf.DataSource = effect;
            ddl_season1vf.DataBind();
            ddl_season1vf.Items.Insert(0, uni);
            //This is for Body Type-Pitta
            ddl_seasonps.DataTextField = "effect_name";
            ddl_seasonps.DataValueField = "effect_id";
            ddl_seasonps.DataSource = effect;
            ddl_seasonps.DataBind();
            ddl_seasonps.Items.Insert(0, uni);

            ddl_seasonpm.DataTextField = "effect_name";
            ddl_seasonpm.DataValueField = "effect_id";
            ddl_seasonpm.DataSource = effect;
            ddl_seasonpm.DataBind();
            ddl_seasonpm.Items.Insert(0, uni);

            ddl_seasonpf.DataTextField = "effect_name";
            ddl_seasonpf.DataValueField = "effect_id";
            ddl_seasonpf.DataSource = effect;
            ddl_seasonpf.DataBind();
            ddl_seasonpf.Items.Insert(0, uni);

            ddl_seasonpw.DataTextField = "effect_name";
            ddl_seasonpw.DataValueField = "effect_id";
            ddl_seasonpw.DataSource = effect;
            ddl_seasonpw.DataBind();
            ddl_seasonpw.Items.Insert(0, uni);
            //This is for Body Type-Kapha
            ddl_seasonks.DataTextField = "effect_name";
            ddl_seasonks.DataValueField = "effect_id";
            ddl_seasonks.DataSource = effect;
            ddl_seasonks.DataBind();
            ddl_seasonks.Items.Insert(0, uni);

            ddl_seasonkm.DataTextField = "effect_name";
            ddl_seasonkm.DataValueField = "effect_id";
            ddl_seasonkm.DataSource = effect;
            ddl_seasonkm.DataBind();
            ddl_seasonkm.Items.Insert(0, uni);

            ddl_seasonkw.DataTextField = "effect_name";
            ddl_seasonkw.DataValueField = "effect_id";
            ddl_seasonkw.DataSource = effect;
            ddl_seasonkw.DataBind();
            ddl_seasonkw.Items.Insert(0, uni);

            ddl_seasonkf.DataTextField = "effect_name";
            ddl_seasonkf.DataValueField = "effect_id";
            ddl_seasonkf.DataSource = effect;
            ddl_seasonkf.DataBind();
            ddl_seasonkf.Items.Insert(0, uni);

            //Adding Seasons
            var spring = (from i in _context.seasons  select i).ToList();
            foreach (season j in spring)
            {

                //This is for body type-Vata
                lbl_springindex.Text = spring[0].season_id.ToString();//Vata type
                lbl_springpitta.Text= spring[0].season_id.ToString();//Pitta type
                lbl_summerindex.Text = spring[1].season_id.ToString();//Vata Type
                lbl_summerpitta.Text = spring[1].season_id.ToString();//Pitta Type
                lbl_seasonv1.Text = spring[0].season_name.ToString().ToUpperInvariant();
                lbl_seasonv2.Text = spring[1].season_name.ToString().ToUpperInvariant();
                lbl_seasonv3.Text = spring[2].season_name.ToString().ToUpperInvariant();
                lbl_seasonv4.Text = spring[3].season_name.ToString().ToUpperInvariant();
                //This is for body type-Pitta
                lbl_seasonp1.Text = spring[0].season_name.ToString().ToUpperInvariant();
                lbl_seasonp2.Text = spring[1].season_name.ToString().ToUpperInvariant();
                lbl_seasonp3.Text = spring[2].season_name.ToString().ToUpperInvariant();
                lbl_seasonp4.Text = spring[3].season_name.ToString().ToUpperInvariant();
                //This is for body type-Kapha
                lbl_seasonk1.Text = spring[0].season_name.ToString().ToUpperInvariant();
                lbl_seasonk2.Text = spring[1].season_name.ToString().ToUpperInvariant();
                lbl_seasonk3.Text = spring[2].season_name.ToString().ToUpperInvariant();
                lbl_seasonk4.Text = spring[3].season_name.ToString().ToUpperInvariant();
            }

        }
    }

    protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddl_category.SelectedIndex == 0)
        {
            lbl_cat.Text = "Adding ";
        }
        else
        {
            // lbl_cat.Text ="Adding "+ ddl_category.SelectedItem.Text;

            string s = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(ddl_category.SelectedItem.Text);
            lbl_cat.Text = "Adding " + s;
            
            btn_submitfinal.Text = "Add to " + s +" table";
            btn_editfinal.Text = "Edit " + s + " table";
        }
        //Query to load the details from fruits into textboxes
        switch (ddl_category.SelectedIndex)
        {

            case 1:
                {
                    var fid = (from i in _context.fruits
                               select i);
                    int tempfid = fid.Count() + 1;
                    txt_id.Text = tempfid.ToString();
                    break;
                }
            case 2:
                {
                    var vid = (from i in _context.vegetables
                               select i);
                    int tempfid = vid.Count() + 1;
                    txt_id.Text = tempfid.ToString();
                    break;
                }
            case 6:
                {
                    var oid = (from i in _context.oilfats
                               select i);
                    int tempfid = oid.Count() + 1;
                    txt_id.Text = tempfid.ToString();
                    break;
                }

        }




    }

    protected void chv_CheckedChanged(object sender, EventArgs e)
    {
        //To Check/Uncheck all Items
        if (chv1.Checked == true)
        {
            foreach (ListItem li in CheckBoxList1.Items)
            {
                li.Selected = true;
            }
        }
        else if (chv1.Checked == false)
        {
            foreach (ListItem li in CheckBoxList1.Items)
            {
                li.Selected = false;
            }
        }



    }


    protected void btn_vatas_Click(object sender, EventArgs e)
    {
        //btn_vatau.Visible = false;
        //btn_vatac.Visible = false;
        if (ddl_season1vs.SelectedIndex!=0)
        {
            ddl_season1vs.Enabled = false;
        }
    }

    protected void btn_vatae_Click(object sender, EventArgs e)
    {
        
            ddl_season1vs.Enabled = true;
            //btn_vatau.Visible = true;
            //btn_vatac.Visible = true;
    }

    protected void btn_vatac_Click(object sender, EventArgs e)
    {
        ddl_season1vs.Enabled = false;
        //btn_vatau.Visible = false;
        //btn_vatac.Visible = false;
    }

    protected void btn_submitfinal_Click(object sender, EventArgs e)
    {
        //{   
        if (!IsPostBack)
        {
            //        if (txt_name.Text.Trim() == null)
            //        {
            //            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Name is Empty')", true);
            //            txt_name.Text = "hello";
            //        }
            //    }

            //   fruit f = new fruit();
            //    fruit upd = _context.fruits.Single(u => u.fruit_id == 4);
            //   // //f.fruit_id = 5;
            //   // //f.fruit_name = "aaa";
            //   // //f.category_id = "1";
            //   // //f.q_id = 1;
            //   // //f.taste_id = 1;
            //   // //f.temp_id = 1;
            //   // ////f.vipak_id = 1;

            //    upd.vipak_id = 2;
            //   //// _context.fruits.InsertOnSubmit(f);
            //    _context.SubmitChanges();

            _context.addfruitsample(Convert.ToInt32(ddl_category.SelectedItem.Value), Convert.ToInt32(txt_id.Text), txt_name.Text, Convert.ToInt32(ddl_taste.SelectedItem.Value), Convert.ToInt32(ddl_temp.SelectedItem.Value), Convert.ToInt32(ddl_vipak.SelectedItem.Value), Convert.ToInt32(ddl_quality.SelectedItem.Value));
            //For Vata Type-Spring Season
            _context.addtosuitability(Convert.ToInt32(txt_id.Text), Convert.ToInt32(lbl_springindex.Text), Convert.ToInt32(lbl_vataindex.Text), ddl_season1vs.SelectedItem.Text);
            //For Vata Type-Summer Season
            _context.addtosuitability(Convert.ToInt32(txt_id.Text), Convert.ToInt32(lbl_summerindex.Text), Convert.ToInt32(lbl_vataindex.Text), ddl_season1vsm.SelectedItem.Text);
            //For PittaType-Spring Season
            _context.addtosuitability(Convert.ToInt32(txt_id.Text), Convert.ToInt32(lbl_springpitta.Text), Convert.ToInt32(lbl_pittaindex.Text), ddl_seasonps.SelectedItem.Text);
            //For PittaType-Summer Season
            _context.addtosuitability(Convert.ToInt32(txt_id.Text), Convert.ToInt32(lbl_summerpitta.Text), Convert.ToInt32(lbl_pittaindex.Text), ddl_seasonpm.SelectedItem.Text);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
        }
        
    }

    protected void btn_editfinal_Click(object sender, EventArgs e)
    {
        var cat = (from i in _context.categories
                   select i);
        switch (ddl_category.SelectedIndex)
        {
            case 1:
                {
                    Response.Redirect("~/Admin/editfruit.aspx");
                    break;
                }
            case 2:
                {
                    Response.Redirect("~/Admin/editvegitable.aspx");
                    break;
                }
        }
    }

    protected void txt_name_TextChanged(object sender, EventArgs e)
    {


        if (IsPostBack)
        {
            var exists = (from i in _context.fruits
                          where txt_name.Text == i.fruit_name
                          select new

                          {
                              fruitname = i.fruit_name
                          }).ToList();


            if (exists.Count() == 1)
            {
                lbl_exists.Visible = true;
                lbl_exists.Text = "already exists";
                lbl_exists.ForeColor = System.Drawing.Color.Red;
                lbl_exists.Font.Bold = true;
              //  return;
            }
            else
            {
                lbl_exists.Visible = true;
                lbl_exists.Text = "proceed";
                lbl_exists.ForeColor = System.Drawing.Color.Green;
                lbl_exists.Font.Bold = true;
            }
        }

    }
}