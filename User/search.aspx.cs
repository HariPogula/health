using System;
using System.Collections.Generic;
using System.Linq;
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
            var result = (from i in _context.suitabilities
                             
                          join f in _context.fruits on i.fruit_id equals f.fruit_id 
                          join b in _context.bodytypes on i.bodyt_id equals b.bodyt_id
                          //join t in _context.tastes on i.fruit_id equals t.fruit_id
                         // join tp in _context.temperatures on i.fruit_id equals tp.fruit_id
                          join s in _context.seasons on i.season_id equals s.season_id
                         
                          select new
                          {
                              i.fruit_id,
                              fruit=f.fruit_name,
                             // t.taste_name,
                              //tp.temp_name,
                              i.effect,
                              s.season_name,
                              b.bodyt_name
                          }).Distinct().OrderBy(o => o.fruit_id);
            GridView1.DataSource = result;
            GridView1.DataBind();

        }

        }

    protected void txt_search_TextChanged(object sender, EventArgs e)
    {
        


           
      

    }
    private void search()
    {
        var search = (from i in _context.fruits
                          //where i.fruit_name like
                      where i.fruit_name.Contains(txt_search.Text)
                      //where txt_search.Text.Contains(i.fruit_name)
                      select new
                      {
                         
                          i.fruit_name
                      }).SingleOrDefault();
       // Label1.Text = search.fruit_name.ToString();
        //string text = ((TextBox)sender).Text;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        if(IsPostBack)
        { 
        this.bind();
        }

    }
    private void bind()
    {
    
            var result = (from i in _context.suitabilities
                         join f in _context.fruits on i.fruit_id equals f.fruit_id
                          join b in _context.bodytypes on i.bodyt_id equals b.bodyt_id
                          //join t in _context.tastes on i.fruit_id equals t.fruit_id
                          //join tp in _context.temperatures on i.fruit_id equals tp.fruit_id
                          join s in _context.seasons on i.season_id equals s.season_id
                          where b.bodyt_name.ToString() == txt_search.Text
                         select new
                         {
                             i.fruit_id,
                             fruit = f.fruit_name,
                            // t.taste_name,
                             //tp.temp_name,
                             i.effect,
                             s.season_name,
                             b.bodyt_name
                         }).Distinct();

            var count = result.Count();
            if (count != 0)
            {
                GridView1.Visible = true;
                Label2.Text = "";
                GridView1.DataSource = result;
                GridView1.DataBind();
            }
            else
            {
                GridView1.Visible = false;
                Label2.Text = "No Rows";
            }

      

    }
}