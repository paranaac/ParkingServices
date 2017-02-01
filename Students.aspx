<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Students.aspx.cs" Inherits="Students" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content4" ContentPlaceHolderID="MyContent" runat="server">
    <div id="menu2" style="margin: 0;">
        <ul>
            <li><a href="/Students.aspx">Home</a></li>
            <li><a href="/Student/AddNewVehicle.aspx">Add New Vehicle</a></li>
            <li><a href="/Student/Renew.aspx">Renew Registration</a></li>
            <li><a href="/Student/ViewInfo.aspx">View Information</a></li>
            <li><a href="/Student/PayCitation.aspx">Pay Citations</a></li>
            <li>
                <asp:LinkButton ID="SignOffButton" Text="Logout" runat="server" OnCommand="LogoutButton_Click"></asp:LinkButton></li>
        </ul>
    </div>
    <br />
    <hr />

    <img src="/images/StudentHome.png" alt="" />

    <div style="height: 100%">
        <h2>
            <asp:Label ID="WelcomeLabel" runat="server" Text="Welcome, "></asp:Label></h2>
        <h4>
            <p id="Date"></p>
        </h4>
        <script type="text/javascript">
            var today = new Date();
            var d = (today.getMonth() + 1 + "/" + today.getDate() + "/" + today.getFullYear());
            document.getElementById("Date").innerHTML = "Today is: " + d;
        </script>

        <blockquote>
            <h2>Account Information</h2>

            Your registration status is:
            <asp:Label ID="StatusLabel" runat="server" Font-Bold="True"></asp:Label>.<br />
            Expiration date:
            <asp:Label ID="ExpLabel" runat="server" Font-Bold="True"></asp:Label>.<br />
            You have
            <asp:Label ID="CountLabel" runat="server" Font-Bold="True"></asp:Label>&nbsp;vehicles registered.<br />
            You have
            <asp:Label ID="CitationLabel" runat="server" Font-Bold="True"></asp:Label>&nbsp;unpaid citations.<br />

            <br />
        </blockquote>
        <asp:Button ID="LogoutButton" runat="server" OnClick="LogoutButton_Click" Text="Logout" />
    </div>
</asp:Content>
