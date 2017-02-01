<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MyContent" runat="server">
    <div class="style1">
        <h1 class="auto-style2" style="text-align: left"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Login Page</strong></h1>
        <table class="auto-style1">
            <tr>
                <td class="auto-style6">User ID:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="UserIDLoginTextBox" runat="server" Width="170px" OnTextChanged="UserIDLoginTextBox_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserIDLoginTextBox" ErrorMessage="Enter your ID*" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;&nbsp;
                    <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer"
                        ControlToValidate="UserIDLoginTextBox" ErrorMessage="User ID must be a whole number  " ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Password:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="PasswordLoginTextBox" runat="server" Width="170px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PasswordLoginTextBox" ErrorMessage="Enter your password*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style5">
                    <asp:Label ID="NoUserLabel" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="LoginButton" runat="server" OnClick="LoginButton_Click" Style="text-align: center" Text="Login" Width="110px" />
                </td>
                <td class="auto-style5">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx" Style="text-align: left">New User? Register Here</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style type="text/css">
        .auto-style3 {
            text-align: left;
        }

        .auto-style4 {
            text-align: right;
        }

        .auto-style5 {
            text-align: left;
            height: 27px;
        }

        .auto-style6 {
            text-align: right;
            height: 25px;
        }

        .auto-style7 {
            text-align: left;
            height: 25px;
        }
    </style>
</asp:Content>
