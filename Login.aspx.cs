using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        // Gather User ID
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn.Open();
        String checkUser = "select count(*) from Login where USERID='" + UserIDLoginTextBox.Text + "'";
        SqlCommand com = new SqlCommand(checkUser, conn);
        int check = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();

        // Check if the user exists
        if (check == 1)
        {
            conn.Open();
            string checkPW = "select Password from Login where USERID='" + UserIDLoginTextBox.Text + "'";
            SqlCommand pass = new SqlCommand(checkPW, conn);
            string password = pass.ExecuteScalar().ToString().Replace(" ", "");

            // Check if the password matches, create a new session
            if (password == PasswordLoginTextBox.Text)
            {
                // Redirect the user to their corresponding page
                string checkUserType = "select UserType from Login where USERID='" + UserIDLoginTextBox.Text + "'";
                SqlCommand utype = new SqlCommand(checkUserType, conn);
                string usertype = utype.ExecuteScalar().ToString().Replace(" ", "");
                Session["New"] = UserIDLoginTextBox.Text;

                // 1 = Admin, 2 = Student, 3 = Faculty
                if (usertype.Equals("1"))
                {
                    Response.Redirect("Admin.aspx");
                }
                else if (usertype.Equals("2"))
                {
                    Response.Redirect("Students.aspx");
                }
                else if (usertype.Equals("3"))
                {
                    Response.Redirect("Faculty.aspx");
                }
            }
            else
            {
                NoUserLabel.Text = "Invalid Password.";
            }
        }
        else
        {
            NoUserLabel.Text = "The user does not exist.";
        }

        conn.Close();
    }
    protected void UserIDLoginTextBox_TextChanged(object sender, EventArgs e)
    {
        NoUserLabel.Text = "";
    }
}