using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Members : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["New"] != null)
        {
            // If the user is not the administrator, redirect them to the home page
            if ((Session["New"].ToString().StartsWith("1")))
            {
                Response.Redirect("Admin.aspx");
            }
            else if ((Session["New"].ToString().StartsWith("2")))
            {
                Response.Redirect("Students.aspx");
            }
            else
            {
                Response.Redirect("Faculty.aspx");
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
}