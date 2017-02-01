<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MyContent" runat="server">
    <div>
        <h1 class="auto-style14">Register New Account</h1>
        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="UserIDTextBox" ErrorMessage="User ID must be a whole number" ForeColor="Red" /><br />
        <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red"></asp:Label>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">User ID:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="UserIDTextBox" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserIDTextBox" ErrorMessage="ID is not valid*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">First Name:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="FirstNameTextBox" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FirstNameTextBox" ErrorMessage="Name is required*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Last Name:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="LastNameTextBox" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="LastNameTextBox" ErrorMessage="Last Name is required*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="Please reenter password*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Re-Enter Password:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="ReEnterPasswordTextBox" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ReEnterPasswordTextBox" ErrorMessage="Please reenter password*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PasswordTextBox" ControlToValidate="ReEnterPasswordTextBox" ErrorMessage="Passwords do not match!" ForeColor="#CC0000"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">E-Mail:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="EmailTextBox" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="E-Mail is required*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="Please enter a valid E-mail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Validation-PIN:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="ValidationPINTextBox" runat="server" Width="148px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ValidationPINTextBox" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Please enter your 4-Digit PIN</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="RegisterButton" runat="server" OnClick="RegisterButton_Click" Text="Register" />
                </td>
                <td class="auto-style9">
                    <asp:Button ID="ResetButton" runat="server" Text="Reset" UseSubmitBehavior="false" CausesValidation="false" OnClick="ResetButton_Click" />
                </td>
                <td class="auto-style10">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="/Info/Help.aspx">Need Help? Click Here</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style type="text/css">
        .auto-style3 {
            text-align: right;
        }

        .auto-style4 {
            text-align: left;
        }

        .auto-style5 {
            text-align: right;
            height: 48px;
        }

        .auto-style6 {
            text-align: left;
            height: 48px;
        }
    </style>
</asp:Content>

