using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class AdminAddNewUser : System.Web.UI.Page
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

        SuccessLabel.Text = "";
        DuplicateUserLabel.Text = "";
    }


    protected void AddUserButton_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn.Open();
        String checkUser = "select count(*) from ALLOWEDIDS where AllowedID='" + UserIDTextBox.Text + "'";
        SqlCommand com = new SqlCommand(checkUser, conn);
        int check = Convert.ToInt32(com.ExecuteScalar().ToString());

        if (check == 1)
        {
            DuplicateUserLabel.Text = "The user already exists";
        }
        else
        {
            String insertUser = "insert into ALLOWEDIDS (AllowedID, ConfirmationPIN) values (@AID, @PIN)";
            SqlCommand com2 = new SqlCommand(insertUser, conn);
            com2.Parameters.AddWithValue("@AID", int.Parse(UserIDTextBox.Text));
            com2.Parameters.AddWithValue("@PIN", int.Parse(PINTextBox.Text));
            com2.ExecuteNonQuery();
            SuccessLabel.Text = "User Added Succesfully!";
            conn.Close();
        }
    }

    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        // End the current session, and redirect the user to the login page
        Session.Clear();
        Session["New"] = null;
        Response.Redirect("/Login.aspx");
    }
}