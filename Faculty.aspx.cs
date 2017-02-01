using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class Faculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["New"] != null)
        {
            if ((Session["New"].ToString().StartsWith("1")) || (Session["New"].ToString().StartsWith("2")))
            {
                Response.Redirect("/Members.aspx");
            }
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            string firstNameQuery = "select LastName from Personal where PersonalID='" + Session["New"] + "'";
            SqlCommand pass = new SqlCommand(firstNameQuery, conn);
            string name = pass.ExecuteScalar().ToString().Replace(" ", "");
            WelcomeLabel.Text = "Welcome Professor " + name + "!";

            string regQuery = "select Active from Personal where PersonalID='" + Session["New"] + "'";
            SqlCommand pass2 = new SqlCommand(regQuery, conn);
            string status = pass2.ExecuteScalar().ToString().Replace(" ", "");
            if (status == "False")
            {
                StatusLabel.Text = "EXPIRED";
                StatusLabel.ForeColor = System.Drawing.Color.Red;
            }

            else
            {
                StatusLabel.Text = "ACTIVE";
                StatusLabel.ForeColor = System.Drawing.Color.Green;
            }

            string regQueryExp = "select ExpirationDate from Personal where PersonalID='" + Session["New"] + "'";
            SqlCommand passExp = new SqlCommand(regQueryExp, conn);
            string date = passExp.ExecuteScalar().ToString().Trim();
            ExpLabel.Text = date;

            string vehiclesQuery = "SELECT COUNT(VehicleID) FROM VehicleList where PersonalID='" + Session["New"] + "'";
            SqlCommand pass3 = new SqlCommand(vehiclesQuery, conn);
            string count = pass3.ExecuteScalar().ToString().Replace(" ", "");

            CountLabel.Text = count.Trim();


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


            CitationLabel.Text = vCount.Trim();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }

        isExpired();

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
    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        Session["New"] = null;
        Response.Redirect("Login.aspx");
    }
}