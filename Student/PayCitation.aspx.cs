using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class PayCitation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["New"] != null)
        {
            if ((Session["New"].ToString().StartsWith("1")) || (Session["New"].ToString().StartsWith("3")))
            {
                Response.Redirect("/Members.aspx");
            }
        }
        else
        {
            Response.Redirect("/Login.aspx");
        }



        if (!IsPostBack)
        {
            SqlDataSource SqlDataSource1 = new SqlDataSource();
            SqlDataSource1.ID = "SqlDataSource1";
            this.Page.Controls.Add(SqlDataSource1);
            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
            SqlDataSource1.SelectCommand = "select pt.PersonalID, vt.ViolationName, vt.ViolationPrice, pt.Paid from ParkingTickets pt, ViolationType vt where pt.ViolationID = vt.ViolationID and PersonalID = " + Session["New"];
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }


        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn.Open();
        string violationsQuery = "SELECT COUNT(ViolationID) FROM ParkingTickets where PersonalID='" + Session["New"] + "'";
        SqlCommand pass4 = new SqlCommand(violationsQuery, conn);
        string vCount = pass4.ExecuteScalar().ToString().Replace(" ", "");
        if (Int32.Parse(vCount) == 0)
        {
            NoCitationsLabel.Text = "You do not have any citations!";
            PayButton.Enabled = false;
        }
        conn.Close();

    }

    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        // End the current session, and redirect the user to the login page
        Session.Clear();
        Session["New"] = null;
        Response.Redirect("/Login.aspx");
    }
    protected void PayButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn.Open();

        String insert2 = "update ParkingTickets set Paid='" + 1 + "' where PersonalID ='" + Session["New"] + "'";
        SqlCommand com3 = new SqlCommand(insert2, conn);

        com3.ExecuteNonQuery();
        SqlDataSource SqlDataSource1 = new SqlDataSource();
        SqlDataSource1.ID = "SqlDataSource1";
        this.Page.Controls.Add(SqlDataSource1);
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
        SqlDataSource1.SelectCommand = "select pt.PersonalID, vt.ViolationName, vt.ViolationPrice, pt.Paid from ParkingTickets pt, ViolationType vt where pt.ViolationID = vt.ViolationID and PersonalID = " + Session["New"];
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();

        StatusLabel.Text = "All fines have been paid.";

        updatePaidStatus();
    }

    public void updatePaidStatus()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn.Open();
        string violationsQuery = "SELECT COUNT(ViolationID) FROM ParkingTickets where PersonalID='" + Session["New"] + "' and Paid='" + 0 + "'";
        SqlCommand pass4 = new SqlCommand(violationsQuery, conn);
        string vCount = pass4.ExecuteScalar().ToString().Replace(" ", "");


        if (Int32.Parse(vCount) > 0)
        {
            String query2 = "update Personal set UnpaidFines='" + 1 + "' where PersonalID='" + Session["New"] + "'";
            SqlCommand com3 = new SqlCommand(query2, conn);
            com3.ExecuteNonQuery();
        }
        else
        {
            String query2 = "update Personal set UnpaidFines='" + 0 + "' where PersonalID='" + Session["New"] + "'";
            SqlCommand com3 = new SqlCommand(query2, conn);
            com3.ExecuteNonQuery();
        }
    }
}