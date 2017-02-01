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
using System.Net;
using System.Net.Mail;

public partial class AdminContactUser : System.Web.UI.Page
{
    // Static variable to hold current e-mail list
    public static System.Collections.ArrayList emailList = new System.Collections.ArrayList();


    protected void Page_Load(object sender, EventArgs e)
    {
        // Bind our grid to the screen
        if (!IsPostBack)
        {
            bind_adminGrid();
        }

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

    protected void chk_CheckedChanged(object sender, EventArgs e)
    {
        GetadminGridRows();
        bindgr2();
    }
    public void bind_adminGrid()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        string s = "select PersonalID, FirstName, LastName, Email, Active, ExpirationDate, UnpaidFines from Personal";
        SqlDataAdapter ad = new SqlDataAdapter(s, con);
        DataSet dt = new DataSet();
        ad.Fill(dt);
        adminGrid.DataSource = dt;
        adminGrid.DataBind();
    }
    protected void bindgr2()
    {
        DataTable dt = (DataTable)ViewState["Data"];
        gr2.DataSource = dt;
        gr2.DataBind();
    }
    private void GetadminGridRows()
    {
        DataTable dt;
        if (ViewState["Data"] != null)
            dt = (DataTable)ViewState["Data"];
        else
            dt = TempTable();
        for (int i = 0; i < adminGrid.Rows.Count; i++)
        {
            CheckBox chk = (CheckBox)adminGrid.Rows[i].Cells[0].FindControl("chk");
            if (chk.Checked)
            {
                dt = AddRow(adminGrid.Rows[i], dt);

                String result = string.Join(",", (string[])emailList.ToArray(Type.GetType("System.String")));
                TextBox1.Text = result;

            }
            else
            {
                dt = RemoveRow(adminGrid.Rows[i], dt);

                String result = string.Join(",", (string[])emailList.ToArray(Type.GetType("System.String")));
                TextBox1.Text = result;
            }
        }
        ViewState["Data"] = dt;
    }

    private DataTable TempTable()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("PersonalID");
        dt.Columns.Add("FirstName");
        dt.Columns.Add("LastName");
        dt.Columns.Add("Email");
        dt.AcceptChanges();
        return dt;
    }
    private DataTable AddRow(GridViewRow gvRow, DataTable dt)
    {
        DataRow[] dr = dt.Select("PersonalID = '" + gvRow.Cells[1].Text + "'");
        if (dr.Length <= 0)
        {
            dt.Rows.Add();
            int rowscount = dt.Rows.Count - 1;
            dt.Rows[rowscount]["PersonalID"] = gvRow.Cells[1].Text;
            dt.Rows[rowscount]["FirstName"] = gvRow.Cells[2].Text;
            dt.Rows[rowscount]["LastName"] = gvRow.Cells[3].Text;
            dt.Rows[rowscount]["Email"] = gvRow.Cells[4].Text;

            emailList.Add(gvRow.Cells[4].Text.Trim());


            dt.AcceptChanges();
        }



        return dt;
    }
    private DataTable RemoveRow(GridViewRow gvRow, DataTable dt)
    {
        DataRow[] dr = dt.Select("PersonalID = '" + gvRow.Cells[1].Text + "'");
        emailList.Remove(gvRow.Cells[4].Text.Trim());
        if (dr.Length > 0)
        {
            dt.Rows.Remove(dr[0]);
            dt.AcceptChanges();
        }


        return dt;
    }
    protected void adminGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        adminGrid.PageIndex = e.NewPageIndex;
        bind_adminGrid();
    }
    protected void adminGrid_Sorting(object sender, GridViewSortEventArgs e)
    {
        SortDirection sortDirection = SortDirection.Ascending;
        string sortField = string.Empty;

        SortGridview((GridView)sender, e, out sortDirection, out sortField);
        string strSortDirection = sortDirection == SortDirection.Ascending ? "ASC" : "DESC";

        adminGrid.DataSource = UserDataAccessLayer.GetAllUsers(e.SortExpression + " " + strSortDirection);
        adminGrid.DataBind();
    }


    // Custom Sorting
    private void SortGridview(GridView adminGrid, GridViewSortEventArgs e, out SortDirection sortDirection, out string sortField)
    {
        sortField = e.SortExpression;
        sortDirection = e.SortDirection;

        if (adminGrid.Attributes["CurrentSortField"] != null && adminGrid.Attributes["CurrentSortDirection"] != null)
        {
            if (sortField == adminGrid.Attributes["CurrentSortField"])
            {
                if (adminGrid.Attributes["CurrentSortDirection"] == "ASC")
                {
                    sortDirection = SortDirection.Descending;
                }
                else
                {
                    sortDirection = SortDirection.Ascending;
                }
            }
            adminGrid.Attributes["CurrentSortField"] = sortField;
            adminGrid.Attributes["CurrentSortDirection"] = (sortDirection == SortDirection.Ascending ? "ASC" : "DESC");
        }
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                // Set up the e-mail address
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("contactcsci540@gmail.com");
                String[] Emails = TextBox1.Text.Split(',');
                foreach (string emailID in Emails)
                {
                    mailMessage.To.Add(new MailAddress(emailID));
                }
                mailMessage.To.Add("contactcsci540@gmail.com");
                mailMessage.Subject = SubjectTextBox.Text;
                mailMessage.Body = ContentBox.Text.Trim();
                mailMessage.IsBodyHtml = true;
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("contactcsci540@gmail.com", "upstatesc");
                smtpClient.Send(mailMessage);
                smtpClient.TargetName = "STARTTLS/smtp.gmail.com";

                // Display success message
                DisplayMessage.Text = "Your message has been sucessfully submitted.";

                TextBox1.Text = "";
                SubjectTextBox.Text = "";
                ContentBox.Text = "";
                DropDownList1.SelectedIndex = 0;
            }
        }
        catch (Exception)
        {
            Response.Write("The server is unavailable right now. Try again later.");
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (DropDownList1.SelectedValue == "Expiring Registration")
        {
            SubjectTextBox.Text = "Reminder: Your registration is about to expire!";
            ContentBox.Text = "You should update your registration status for the new semester.\nRemember that all fines must be paid for you to be able to update your registration.";
        }
        else if (DropDownList1.SelectedValue == "Unpaid Citations")
        {
            SubjectTextBox.Text = "Reminder: You have unpaid citations which need immediate attention!";
            ContentBox.Text = "You must pay your fines in order to register for the new semester!\nAny disputes must be made within a week of the infraction.\nCome by the parking services building if you need assistance.";
        }
        else if (DropDownList1.SelectedValue == "Missing Information")
        {
            SubjectTextBox.Text = "Notice: You have missing or incorrect information which needs to be updated!";
            ContentBox.Text = "Please come by the parking services building to correct your information.\nFailure to update information will disable your ability to renew your status.";
        }
    }
}
public class Users
{
    public int PersonalID { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Email { get; set; }
    public string Active { get; set; }
    public string ExpirationDate { get; set; }
    public string UnpaidFines { get; set; }
}

public class UserDataAccessLayer
{
    public static List<Users> GetAllUsers(string sortColumn)
    {
        List<Users> listUsers = new List<Users>();
        string CS = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            string sqlQuery = "select PersonalID, FirstName, LastName, Email, Active, ExpirationDate, UnpaidFines from Personal";
            if (!string.IsNullOrEmpty(sortColumn))
            {
                sqlQuery += " order by " + sortColumn;
            }
            SqlCommand cmd = new SqlCommand(sqlQuery, con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                Users us = new Users();
                us.PersonalID = Convert.ToInt32(rdr["PersonalID"]);
                us.FirstName = rdr["FirstName"].ToString();
                us.LastName = rdr["LastName"].ToString();
                us.Email = rdr["Email"].ToString();
                us.Active = rdr["Active"].ToString();
                us.ExpirationDate = rdr["ExpirationDate"].ToString();
                us.UnpaidFines = rdr["UnpaidFines"].ToString();
                listUsers.Add(us);
            }
        }
        return listUsers;
    }
}