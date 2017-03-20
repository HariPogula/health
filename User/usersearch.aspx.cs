using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    aayurvedicDataContext _context = new aayurvedicDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            //Add Seasons
            var season1 = (from i in _context.seasons
                          select i).ToList();
           
            ddl_season.DataTextField = "season_name";
            ddl_season.DataValueField = "season_id";
            ddl_season.DataSource = season1;
            ddl_season.DataBind();
            ListItem sea = new ListItem("Select a Season", "-1");
            ddl_season.Items.Insert(0, sea);
            //Add Body Types
            var body = (from i in _context.bodytypes
                        select i).ToList();
            ddl_bodytype.DataTextField = "bodyt_name";
            ddl_bodytype.DataValueField = "bodyt_id";
            ddl_bodytype.DataSource = body;
            ddl_bodytype.DataBind();
            ListItem bod = new ListItem("Select a Body Type", "-1");
            ddl_bodytype.Items.Insert(0, bod);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        var vipak = from i in _context.fruits
                    join v in _context.vipaks on i.vipak_id equals v.vipak_id
                    select new
                    {
                        i.fruit_name,
                        v.vipak_name
                    };
        //var join = (from i in _context.fruits
        //            join s in _context.suitabilities on i.fruit_id equals s.fruit_id into r
        //            from s1 in r 
        //            where i.fruit_name==txt_search.Text &&
        //            ddl_season.SelectedItem.Value==
        //            select new
        //            {
        //                i.fruit_name,
        //                s.effect
        //            }
                    
        //            ).Distinct();

        var result = (from i in _context.suitabilities
                      from t in _context.tastes
                     //from v in _context.vipaks
                      
                      join f in _context.fruits on i.fruit_id equals f.fruit_id 
                      join s in _context.seasons on i.season_id equals s.season_id
                      join b in _context.bodytypes on i.bodyt_id equals b.bodyt_id
                      join f1 in _context.fruits on t.taste_id equals f1.taste_id 
                     // join f2 in _context.fruits on v.vipak_id equals f2.vipak_id
                          where f.fruit_name.ToString() == txt_search.Text &&
                          i.season_id == Convert.ToInt32(ddl_season.SelectedItem.Value) &&
                          i.bodyt_id == Convert.ToInt32(ddl_bodytype.SelectedItem.Value)

                          select new
                          {
                              Fruit = f.fruit_name,
                              Effect=i.effect,
                              Season=s.season_name,
                              BodyType=b.bodyt_name,
                              Taste=t.taste_name
                             //Vipak=v.vipak_name
                          }).Distinct();
            //Label2.Text = result.fruit.ToString();
            //Label3.Text = result.effect;
            //Label4.Text = result.season_name;
            //Label5.Text = result.bodyt_name;
             GridView1.DataSource =result;
            GridView1.DataBind();
        
    }
}