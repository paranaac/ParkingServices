using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // If the user is not logged in, redirect them to the login page
        if (Session["New"] != null)
        {
            // If the user is not the administrator, redirect them to the home page
            if ((Session["New"].ToString().StartsWith("2")) || (Session["New"].ToString().StartsWith("3")))
            {
                Response.Redirect("Default.aspx");
            }
            // Get the name of the administrator to greet him
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            string firstNameQuery = "select FirstName from Personal where PersonalID='" + Session["New"] + "'";
            SqlCommand pass = new SqlCommand(firstNameQuery, conn);
            string name = pass.ExecuteScalar().ToString().Replace(" ", "");
            AdminWelcomeLabel.Text = "Welcome " + name + "!";

            updateTable();

            MergeRows(GridView2, 4);
            MergeRows(GridView3, 3);

        }

        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    public static void MergeRows(GridView gridView, int number)
    {
        for (int rowIndex = gridView.Rows.Count - 2; rowIndex >= 0; rowIndex--)
        {
            GridViewRow row = gridView.Rows[rowIndex];
            GridViewRow previousRow = gridView.Rows[rowIndex + 1];

            for (int i = 0; i < number; i++)
            {
                if (row.Cells[i].Text == previousRow.Cells[i].Text)
                {
                    row.Cells[i].RowSpan = previousRow.Cells[i].RowSpan < 2 ? 2 :
                                           previousRow.Cells[i].RowSpan + 1;
                    previousRow.Cells[i].Visible = false;
                }
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

    public void updateTable()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn.Open();
        string updateDB = " update Personal set Active = 0 where ExpirationDate <= CURRENT_TIMESTAMP";
        SqlCommand com3 = new SqlCommand(updateDB, conn);
        com3.ExecuteNonQuery();

        string updateDB2 = " update Personal set Active = 1 where ExpirationDate > CURRENT_TIMESTAMP";
        SqlCommand com2 = new SqlCommand(updateDB2, conn);
        com2.ExecuteNonQuery();
        conn.Close();
    }
}