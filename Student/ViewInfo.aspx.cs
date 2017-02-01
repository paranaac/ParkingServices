using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewInfo : System.Web.UI.Page
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


        if (!(IsPostBack))
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            String query = "select * from Personal where PersonalID = " + Session["New"];
            SqlCommand cd = new SqlCommand(query, conn);
            SqlDataReader rd = cd.ExecuteReader();
            if (rd.Read())
            {
                FirstNameTextBox.Text = rd["FirstName"].ToString().Trim();
                LastNameTextBox.Text = rd["LastName"].ToString().Trim();
                EmailTextBox.Text = rd["Email"].ToString().Trim();
                ActiveTextBox.Text = rd["Active"].ToString().Trim();
                if (rd["ParkingTypeID"].ToString().Trim() == "2")
                {
                    ParkingTypeTextBox.Text = "Student (Commuter)";
                }
                else
                {
                    ParkingTypeTextBox.Text = "Not specified";
                }
                LicenseTextBox.Text = rd["License"].ToString().Trim();
                AddressTextBox.Text = rd["Address"].ToString().Trim();

                if (ActiveTextBox.Text == "N")
                    RenewLabel.Text = "You must renew your registration!";
            }



        }

    }

    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        // End the current session, and redirect the user to the login page
        Session.Clear();
        Session["New"] = null;
        Response.Redirect("/Login.aspx");
    }
    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();

            String lice = LicenseTextBox.Text.Trim();
            String addr = AddressTextBox.Text.Trim();

            String insert2 = "update Personal set Address='" + addr + "',License='" + lice + "' where PersonalID ='" + Session["New"] + "'";
            SqlCommand com3 = new SqlCommand(insert2, conn);
            com3.ExecuteNonQuery();

            if (PasswordTextBox.Text.Trim() != "")
            {
                String insert3 = "update Login set Password='" + PasswordTextBox.Text.Trim() + "' where PersonalID = '" + Session["New"] + "'";
                SqlCommand com2 = new SqlCommand(insert3, conn);
                com2.ExecuteNonQuery();
            }
            StatusLabel.Text = "Information updated sucessfully.";
        }
        catch (Exception em)
        {
            Response.Write(em);
            StatusLabel.Text = "An error occurred. Try again.";
        }



    }
}