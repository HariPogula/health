using System;
using System.Collections;
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







            //Loading the details in GridView1(Applicants)
            var result = (from i in _context.reg_temps
                          select i).ToList();
            GridView1.DataSource = result;
            GridView1.DataBind();

            //Label1.Text = "OK";
            //Loading the details in GridView2(Confirmed Users)
            var final1 = (from i in _context.reg_finals
                          select new
                          {
                              firstname = i.firstname,
                              lastname = i.lastname,
                              email = i.email
                          });
            GridView2.DataSource = final1;
            GridView2.DataBind();

            var final2 = (from i in _context.reg_rejects
                          select new
                          {
                              firstname = i.firstname,
                              lastname = i.lastname,
                              email = i.email
                          }).ToList();

            //    //Label1.Text = email.Text;
            GridView3.DataSource = final2;
            GridView3.DataBind();

        }
    }
    protected void insertclick(object sender, EventArgs e)
    {
        //For the Insert Button
        Button btn_insert = sender as Button;
        GridViewRow row = btn_insert.NamingContainer as GridViewRow;
        Label status = row.FindControl("lbl_status") as Label;
        status.CssClass = "glyphicon glyphicon-ok";
        status.ForeColor = System.Drawing.Color.Green;
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {


    }





    protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
    {

        //Its is for ddl1(Applicants)
        DropDownList ddl_status = sender as DropDownList;
        string selected = ddl_status.SelectedValue;
        GridViewRow row = ddl_status.NamingContainer as GridViewRow;
        Label status = row.FindControl("lbl_status") as Label;
        Label email = row.FindControl("Label5") as Label;
        string email1 = email.Text;
        if (selected == "Approve")
        {
            //To change the staus value to 1 in the database of paricular record .
           // _context.sp_updatestatus(selected, email1);

                 status.CssClass = "glyphicon glyphicon-ok";
                 status.ForeColor = System.Drawing.Color.Green;
           var present= _context.sp_insertintofinal(email1,selected).Single();
            int p = Convert.ToInt32(present.returnvalue);
            if(p==-1)
            {
                Label1.Text = "Already approved";
                
            }
            else
            {
                Label1.Text = "OK";
            }
            var final1 = (from i in _context.reg_finals
                          select new
                          {
                              firstname = i.firstname,
                              lastname = i.lastname,
                              email = i.email
                          }).ToList();

            //    //Label1.Text = email.Text;
            GridView2.DataSource = final1;
            GridView2.DataBind();

           
        }
        if (selected == "Reject")
        {
            status.CssClass = "glyphicon glyphicon-remove";
            status.ForeColor = System.Drawing.Color.Red;
            var present = _context.sp_insertintoreject(email1, selected).Single();
            int p = Convert.ToInt32(present.returnvalue);
            if (p == -1)
            {
                Label1.Text = "Already rejected";

            }
            else
            {
                Label1.Text = "OK";
            }
            var final2 = (from i in _context.reg_rejects
                          select new
                          {
                              firstname = i.firstname,
                              lastname = i.lastname,
                              email = i.email
                          }).ToList();

            //    //Label1.Text = email.Text;
            GridView3.DataSource = final2;
            GridView3.DataBind();

        }
        if (selected == "Pending")
        {
            //var present = _context.sp_insertintofinal(email1, selected).Single();
            //int p = Convert.ToInt32(present.returnvalue);
            //if (p == -1)
            //{
            //    Label1.Text = "Already pending";
            //}
            //else
            //{
            //    Label1.Text = "OK";
            //}

            status.CssClass = "glyphicon glyphicon-pencil";
            status.ForeColor = System.Drawing.Color.Blue;
        }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ddl_status_Init(object sender, EventArgs e)
    {
        var result = (from i in _context.reg_temps
                      select i).ToList();
        DropDownList ddl_statusl = sender as DropDownList;
        GridViewRow row = ddl_statusl.NamingContainer as GridViewRow;
        Label lbl_status = row.FindControl("lbl_status") as Label;

      
        foreach(reg_temp j in result)
        {

            if (j.status == 1)
            {
                
                lbl_status.CssClass = "glyphicon glyphicon-ok";
                lbl_status.ForeColor = System.Drawing.Color.Green;
            }
            if (j.status == 2)
            {
                lbl_status.CssClass = "glyphicon glyphicon-pencil";
                lbl_status.ForeColor = System.Drawing.Color.Blue;
            }
            if (j.status == 3)
            {
                lbl_status.CssClass = "glyphicon glyphicon-remove";
                lbl_status.ForeColor = System.Drawing.Color.Red;
            }
        }
           

        
    }
}
