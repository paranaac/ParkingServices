<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MyContent" runat="server">
    <h2>Contact Us</h2>
    <p>
        If you have any other questions/concerns or you want to report a bug, please contact us and we will respond within 2-3 business days.
    </p>
    <p>
        Name:
        <asp:RequiredFieldValidator ID="RequiredName" runat="server" ErrorMessage="Please enter your name*" ControlToValidate="NameTextbox" ValidationGroup="save" ForeColor="Red" /><br />
        <asp:TextBox ID="NameTextBox" runat="server" Width="400px" /><br />

        User ID:
        <asp:RequiredFieldValidator ID="RequiredUserID" runat="server" ErrorMessage="Please enter your user ID*" ControlToValidate="UserIDTextBox" ValidationGroup="save" ForeColor="Red" /><br />
        <asp:TextBox ID="UserIDTextBox" runat="server" Width="400px" /><br />

        E-Mail:
        <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ErrorMessage="Please enter your e-mail*"
            ControlToValidate="EmailTextBox" ValidationGroup="save" ForeColor="Red" /><br />
        <asp:TextBox ID="EmailTextBox" runat="server" Width="400px" /><br />

        Subject:
        <asp:RequiredFieldValidator ID="RequiredSubject" runat="server" ErrorMessage="Subject must be included*"
            ControlToValidate="SubjectTextBox" ValidationGroup="save" ForeColor="Red" /><br />
        <asp:TextBox ID="SubjectTextBox" runat="server" Width="400px" /><br />

        Content:
        <asp:RequiredFieldValidator ID="RequiredContent" runat="server" ErrorMessage="Content must be included*"
            ControlToValidate="ContentBox" ValidationGroup="save" ForeColor="Red" /><br />
        <asp:TextBox ID="ContentBox" runat="server"
            TextMode="MultiLine" Rows="10" Width="400px" Height="250px" />
    </p>
    <p>
        <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" ValidationGroup="save" Width="100%" />
    </p>
    <p>
        <asp:Label ID="DisplayMessage" runat="server" Visible="False" Font-Bold="True" ForeColor="#009900" />
    </p>
</asp:Content>
