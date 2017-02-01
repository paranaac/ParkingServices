using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Set the focus on the User ID Textbox
        UserIDTextBox.Focus();

        if (IsPostBack)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();

            try
            {
                String checkUserID = "select count(*) from Login where USERID ='" + UserIDTextBox.Text + "'";
                SqlCommand com = new SqlCommand(checkUserID, conn);
                int checkID = Convert.ToInt32(com.ExecuteScalar().ToString());

                // Check if the user already exists
                if (checkID == 1)
                {
                    ErrorLabel.Text = "The user already exists.";
                }
            }
            catch (Exception)
            {

            }
            conn.Close();
        }
    }

    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        try
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();

            String checkValidID = "select count(*) from ALLOWEDIDS where AllowedID ='" + UserIDTextBox.Text + "'";
            SqlCommand com2 = new SqlCommand(checkValidID, conn);
            int validID = Convert.ToInt32(com2.ExecuteScalar().ToString());

            if (!(validID == 1))
            {
                ErrorLabel.Text = "The ID is not registered in our system. Please contact Parking Services to validate your ID";
            }
            else
            {
                // Check if the PIN number matches the User ID
                string checkPIN = "select ConfirmationPIN from ALLOWEDIDS where AllowedID='" + UserIDTextBox.Text + "'";
                SqlCommand pin = new SqlCommand(checkPIN, conn);
                string dbPIN = pin.ExecuteScalar().ToString().Replace(" ", "");

                if (dbPIN != ValidationPINTextBox.Text)
                {
                    ErrorLabel.Text = "The PIN you entered is incorrect.";
                }
                else
                {
                    String insert2 = "insert into Personal (PersonalID, FirstName, LastName, Email,ParkingTypeID,Active,ExpirationDate,UnpaidFines) values (@PID, @FName,@LName,@Email,@ParkingTypeID,@Active,@ExpirationDate,@UnpaidFines)";
                    SqlCommand com3 = new SqlCommand(insert2, conn);
                    com3.Parameters.AddWithValue("@PID", int.Parse(UserIDTextBox.Text));
                    com3.Parameters.AddWithValue("@FName", FirstNameTextBox.Text);
                    com3.Parameters.AddWithValue("@LName", LastNameTextBox.Text);
                    com3.Parameters.AddWithValue("@Email", EmailTextBox.Text);
                    com3.Parameters.AddWithValue("@Active", 0);
                    com3.Parameters.AddWithValue("@ExpirationDate", DateTime.Now);
                    com3.Parameters.AddWithValue("@UnpaidFines", 0);

                    int usertype;
                    if (UserIDTextBox.Text.StartsWith("1"))
                    {
                        com3.Parameters.AddWithValue("@ParkingTypeID", 1);
                        usertype = 1;
                    }
                    else if (UserIDTextBox.Text.StartsWith("2"))
                    {
                        com3.Parameters.AddWithValue("@ParkingTypeID", 2);
                        usertype = 2;
                    }
                    else
                    {
                        com3.Parameters.AddWithValue("@ParkingTypeID", 3);
                        usertype = 3;
                    }

                    com3.ExecuteNonQuery();


                    String insert = "insert into Login (USERID, Password, PersonalID, UserType) values (@UID,@Password,@PID, @UTYPE)";
                    SqlCommand com = new SqlCommand(insert, conn);
                    com.Parameters.AddWithValue("@UID", int.Parse(UserIDTextBox.Text));
                    com.Parameters.AddWithValue("@Password", PasswordTextBox.Text);
                    com.Parameters.AddWithValue("@PID", int.Parse(UserIDTextBox.Text));
                    com.Parameters.AddWithValue("@UTYPE", usertype);
                    com.ExecuteNonQuery();


                    // Take us to the login page if the user was sucessfully registered
                    Response.Write("Account created sucessfully");
                    Response.Redirect("/Login.aspx");
                }
            }

            // Close the connection
            conn.Close();
        }
        catch (Exception)
        {

        }
    }

    protected void ResetButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
}