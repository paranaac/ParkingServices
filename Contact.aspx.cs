using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;


public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                // Gather all information from the user input
                string subject = SubjectTextBox.Text.ToString();
                string content = "From: " + NameTextBox.Text + "\n";
                content += "ID: " + UserIDTextBox.Text + "\n";
                content += "Email: " + EmailTextBox.Text + "\n";
                content += "Subject: " + SubjectTextBox.Text + "\n";
                content += "Question: \n" + ContentBox.Text;

                // Set up the e-mail address
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("###############################");
                mailMessage.To.Add("contactcsci540@gmail.com");
                mailMessage.Subject = subject;
                mailMessage.Body = content;
                mailMessage.IsBodyHtml = true;
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("######################", "#######################");
                smtpClient.Send(mailMessage);
                smtpClient.TargetName = "STARTTLS/smtp.gmail.com";

                // Display success message
                DisplayMessage.Text = "Your message has been sucessfully submitted.";
                DisplayMessage.Visible = true;
                SubjectTextBox.Text = "";
                EmailTextBox.Text = "";
                NameTextBox.Text = "";
                UserIDTextBox.Text = "";
                ContentBox.Text = "";
            }
        }
        catch (Exception)
        {
            Response.Write("The server is unavailable right now. Try again later.");
        }
    }
}