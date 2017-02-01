<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content6" ContentPlaceHolderID="MyContent" runat="server">
    <div>
        <h1>Welcome to Parking Services!</h1>
        <div id="main" style="width: 100%; height: 100%;">
            <blockquote>
                <img src="images/parking.png" alt="" /><br />
                <br />
                <p>
                    Welcome!
            <br />
                    Today is:
                </p>
                <p id="Date"></p>
                <br />
                <br />

                <script type="text/javascript">
                    var d = new Date();
                    document.getElementById("Date").innerHTML = d.toString();
                </script>
                Please <a href="Login.aspx">login</a> or <a href="Register.aspx">register</a>.
                <br />
              If you need help, check the <a href="/Info/FAQ.aspx"">FAQ</a>.<br /><br /></blockquote>
            <hr />
            <h2>About Us:</h2>
            <blockquote>
                Parking Services is responsible for encforcing the university's parking policies and managing it's resources.
                <br />
                Our parking managers are committed to keeping the parking lots safe and clear of any unathorized vehicles.
                <br />
                Our services are available to all registered students and faculty here at Software University.<br />
            </blockquote>
            <hr />
            <h2>Business Hours: </h2>
            <blockquote>
                Parking Services hours of operation are Monday-Friday, 9:00 a.m. to 8:00 p.m.<br />
                Parking Services Building: <b><strong>(555)-555-5555</strong></b><br />
                You can also contact us <a href="Contact.aspx">here</a> or send an e-mail to contactcsci540@gmail.com<br />
            </blockquote>
        </div>
    </div>
</asp:Content>

