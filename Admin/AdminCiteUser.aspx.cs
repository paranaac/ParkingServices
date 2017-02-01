using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminCiteUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // If the user is not logged in, redirect them to the login page
        if (Session["New"] != null)
        {
            // If the user is not the administrator, redirect them to the home page
            if ((Session["New"].ToString().StartsWith("2")) || (Session["New"].ToString().StartsWith("3")))
            {
                Response.Redirect("/Default.aspx");
            }
        }
        else
        {
            Response.Redirect("/Login.aspx");
        }


    }

    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        // End the current session, and redirect the user to the login page
        Session.Clear();
        Session["New"] = null;
        Response.Redirect("/Login.aspx");
    }
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn.Open();

        String userID = UserTextBox.Text.Trim();
        int type = DropDownList1.SelectedIndex + 1;

        String insert2 = "insert into ParkingTickets (ViolationID, PersonalID, Paid) values (@VID, @PID, @PAID)";
        SqlCommand com3 = new SqlCommand(insert2, conn);
        com3.Parameters.AddWithValue("@VID", type);
        com3.Parameters.AddWithValue("@PID", userID);
        com3.Parameters.AddWithValue("@PAID", 0);

        com3.ExecuteNonQuery();

        String query2 = "update Personal set UnpaidFines='" + 1 + "' where PersonalID='" + userID + "'";
        SqlCommand com4 = new SqlCommand(query2, conn);
        com4.ExecuteNonQuery();

        StatusLabel.Text = "Violation added sucessfully.";
    }
}