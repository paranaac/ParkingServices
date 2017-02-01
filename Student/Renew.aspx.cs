using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Renew : System.Web.UI.Page
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

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn.Open();
        String query = "select Active, ExpirationDate from Personal where PersonalID = " + Session["New"];
        SqlCommand cd = new SqlCommand(query, conn);
        SqlDataReader rd = cd.ExecuteReader();
        if (rd.Read())
        {
            ActiveTextBox.Text = rd["Active"].ToString().Trim();
            ExpDateTextBox.Text = rd["ExpirationDate"].ToString().Trim();
            if (rd["Active"].ToString().Trim() == "False")
            {
                ActiveTextBox.Text = "Inactive";
            }
            else
            {
                ActiveTextBox.Text = "Active";
            }


        }

        isExpired();


        SqlDataSource SqlDataSource1 = new SqlDataSource();
        SqlDataSource1.ID = "SqlDataSource1";
        this.Page.Controls.Add(SqlDataSource1);
        SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
        SqlDataSource1.SelectCommand = "select * from Decal where PersonalID = " + Session["New"];
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();




    }

    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        // End the current session, and redirect the user to the login page
        Session.Clear();
        Session["New"] = null;
        Response.Redirect("/Login.aspx");
    }
    protected void RenewDecalButton_Click(object sender, EventArgs e)
    {
        String expDate = "1/1/2000";
        DateTime dt = Convert.ToDateTime(expDate);
        Boolean allowRenew = false;


        try
        {


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            String query = "select ExpirationDate from Decal where DecalID = " + Int32.Parse(DecalIDTextBox.Text.Trim()) + " and PersonalID = " + Session["New"];
            SqlCommand cd = new SqlCommand(query, conn);
            SqlDataReader rd = cd.ExecuteReader();
            if (rd.Read())
            {
                expDate = rd["ExpirationDate"].ToString();
                dt = Convert.ToDateTime(expDate);

                if ((dt - DateTime.Now).TotalDays < 30)
                    allowRenew = true;
            }
            conn.Close();

            SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn2.Open();
            if (allowRenew)
            {
                dt = dt.AddMonths(3);
                String query2 = "update Decal set ExpirationDate='" + dt.ToString() + "' where DecalID ='" + DecalIDTextBox.Text.ToString() + "' and PersonalID ='" + Session["New"] + "'";
                SqlCommand com3 = new SqlCommand(query2, conn2);
                com3.ExecuteNonQuery();
                StatusLabel.ForeColor = System.Drawing.Color.Green;
                StatusLabel.Text = "Your decal has been renewed until: " + dt.ToString();

                SqlDataSource SqlDataSource1 = new SqlDataSource();
                SqlDataSource1.ID = "SqlDataSource1";
                this.Page.Controls.Add(SqlDataSource1);
                SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
                SqlDataSource1.SelectCommand = "select * from Decal where PersonalID = " + Session["New"];
                GridView1.DataSource = SqlDataSource1;
                GridView1.DataBind();
            }
            else
            {
                StatusLabel.ForeColor = System.Drawing.Color.Red;
                StatusLabel.Text = "You cannot renew at this time.";
            }

        }
        catch (Exception)
        {
            StatusLabel.ForeColor = System.Drawing.Color.Red;
            StatusLabel.Text = "The ID you entered is not valid.";
        }

    }
    protected void RenewAccountButton_Click(object sender, EventArgs e)
    {

        SqlConnection myCon = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        myCon.Open();
        string violationsQuery = "SELECT COUNT(ViolationID) FROM ParkingTickets where PersonalID='" + Session["New"] + "' and Paid='" + 0 + "'";
        SqlCommand pass4 = new SqlCommand(violationsQuery, myCon);
        string vCount = pass4.ExecuteScalar().ToString().Replace(" ", "");

        if (Int32.Parse(vCount) <= 0)
        {
            String expDate = "1/1/2000";
            DateTime dt = Convert.ToDateTime(expDate);
            Boolean allowRenew = false;

            try
            {


                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                conn.Open();
                String query = "select ExpirationDate from Personal where PersonalID = " + Session["New"];
                SqlCommand cd = new SqlCommand(query, conn);
                SqlDataReader rd = cd.ExecuteReader();
                if (rd.Read())
                {
                    expDate = rd["ExpirationDate"].ToString();
                    dt = Convert.ToDateTime(expDate);

                    if ((dt - DateTime.Now).TotalDays < 30)
                        allowRenew = true;
                }
                conn.Close();

                SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                conn2.Open();
                if (allowRenew)
                {
                    dt = dt.AddMonths(3);
                    String query2 = "update Personal set ExpirationDate='" + dt.ToString() + "' where PersonalID = " + Session["New"];
                    SqlCommand com3 = new SqlCommand(query2, conn2);
                    com3.ExecuteNonQuery();
                    AccountStatusLabel.ForeColor = System.Drawing.Color.Green;
                    AccountStatusLabel.Text = "Your account has been renewed until: " + dt.ToString() + ". Please wait a few minutes for the change to take effect.";

                    SqlConnection conn3 = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                    conn.Open();
                    String query1 = "select Active, ExpirationDate from Personal where PersonalID = " + Session["New"];
                    SqlCommand cd2 = new SqlCommand(query1, conn);
                    SqlDataReader rd2 = cd2.ExecuteReader();
                    if (rd2.Read())
                    {
                        ActiveTextBox.Text = rd2["Active"].ToString().Trim();
                        ExpDateTextBox.Text = rd2["ExpirationDate"].ToString().Trim();
                        if (rd2["Active"].ToString().Trim() == "False")
                        {
                            ActiveTextBox.Text = "Inactive";
                        }
                        else
                        {
                            ActiveTextBox.Text = "Active";
                        }
                    }
                }
                else
                {
                    AccountStatusLabel.ForeColor = System.Drawing.Color.Red;
                    AccountStatusLabel.Text = "You cannot renew at this time because your account is not expiring soon.";
                }

            }
            catch (Exception)
            {
                AccountStatusLabel.ForeColor = System.Drawing.Color.Red;
                AccountStatusLabel.Text = "The ID you entered is not valid.";
            }

        }

        else
        {
            AccountStatusLabel.ForeColor = System.Drawing.Color.Red;
            AccountStatusLabel.Text = "You must pay your citations before you can renew your registration!";
        }
    }

    public void isExpired()
    {

        String expDate = "1/1/2000";
        DateTime dt = Convert.ToDateTime(expDate);
        Boolean isExpired = false;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        con.Open();
        String query = "select ExpirationDate from Personal where PersonalID = " + Session["New"];
        SqlCommand cd = new SqlCommand(query, con);
        SqlDataReader rd = cd.ExecuteReader();
        if (rd.Read())
        {
            expDate = rd["ExpirationDate"].ToString();
            dt = Convert.ToDateTime(expDate);

            if ((dt - DateTime.Now).TotalDays <= 0)
                isExpired = true;
        }
        con.Close();


        SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn2.Open();
        if (!isExpired)
        {
            String query2 = "update Personal set Active='" + 1 + "' where PersonalID = " + Session["New"];
            SqlCommand com3 = new SqlCommand(query2, conn2);
            com3.ExecuteNonQuery();
        }
        else
        {
            String query2 = "update Personal set Active='" + 0 + "' where PersonalID = " + Session["New"];
            SqlCommand com3 = new SqlCommand(query2, conn2);
            com3.ExecuteNonQuery();
        }
    }
}