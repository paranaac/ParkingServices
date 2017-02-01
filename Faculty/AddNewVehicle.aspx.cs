using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddNewVehicle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["New"] != null)
        {
            if ((Session["New"].ToString().StartsWith("1")) || (Session["New"].ToString().StartsWith("2")))
            {
                Response.Redirect("/Members.aspx");
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }

        SessionLabel.Text = Session["New"].ToString();

        if (!IsPostBack)
        {
            SqlDataSource SqlDataSource1 = new SqlDataSource();
            SqlDataSource1.ID = "SqlDataSource1";
            this.Page.Controls.Add(SqlDataSource1);
            SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
            SqlDataSource1.SelectCommand = "select vl.VehicleID, v.Make, v.Model, v.Color, v.Year from VehicleList vl, Vehicle v where v.LicensePlate = vl.VehicleID and PersonalID = " + SessionLabel.Text.Trim();
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }


        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn.Open();
        string vehiclesQuery = "SELECT COUNT(VehicleID) FROM VehicleList where PersonalID='" + Session["New"] + "'";
        SqlCommand pass4 = new SqlCommand(vehiclesQuery, conn);
        string vCount = pass4.ExecuteScalar().ToString().Replace(" ", "");
        if (Int32.Parse(vCount) == 0)
        {
            NoVehiclesLabel.Text = "You do not have any vehicles registered!";
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
    protected void AddButton_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            String insert = "insert into Vehicle (Make, Model, Color, Year, LicensePlate, Valid) VALUES(@Make, @Model, @Color, @Year, @LicensePlate, @Valid)";
            SqlCommand com3 = new SqlCommand(insert, conn);
            com3.Parameters.AddWithValue("@Make", MakeTextBox.Text.Trim());
            com3.Parameters.AddWithValue("@Model", ModelTextBox.Text.Trim());
            com3.Parameters.AddWithValue("@Color", ColorTextBox.Text.Trim());
            com3.Parameters.AddWithValue("@Year", YearTextBox.Text.Trim());
            com3.Parameters.AddWithValue("@LicensePlate", LicenseTextBox.Text.Trim());
            com3.Parameters.AddWithValue("@Valid", 1);
            com3.ExecuteNonQuery();
            String insert2 = "insert into VehicleList (VehicleID, PersonalID) VALUES(@LicensePlate, " + Session["New"] + ")";
            SqlCommand com = new SqlCommand(insert2, conn);
            com.Parameters.AddWithValue("@LicensePlate", LicenseTextBox.Text.Trim());
            com.ExecuteNonQuery();
            StatusLabel.ForeColor = System.Drawing.Color.Green;
            StatusLabel.Text = "Vehicle registered sucessfully";
            String insert3 = "insert into Decal (VehicleID, ExpirationDate, PersonalID) VALUES(@LicensePlate, @Date, @PID)";
            SqlCommand com2 = new SqlCommand(insert3, conn);
            com2.Parameters.AddWithValue("@LicensePlate", LicenseTextBox.Text.Trim());
            com2.Parameters.Add("@Date", DateTime.Now);
            com2.Parameters.Add("@PID", Session["New"]);
            com2.ExecuteNonQuery();
        }
        catch (Exception)
        {
            StatusLabel.ForeColor = System.Drawing.Color.Red;
            StatusLabel.Text = "The vehicle is already registered";
        }
    }


}