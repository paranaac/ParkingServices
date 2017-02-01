<%@ Page Language="C#" AutoEventWireup="true" CodeFile="/Faculty/ViewInfo.aspx.cs" Inherits="ViewInfo" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content10" ContentPlaceHolderID="MyContent" runat="server">
    <div id="menu2" style="margin: 0;">
        <ul>
            <li><a href="/Faculty.aspx">Home</a></li>
            <li><a href="/Faculty/AddNewVehicle.aspx">Add New Vehicle</a></li>
            <li><a href="/Faculty/Renew.aspx">Renew Registration</a></li>
            <li><a href="/Faculty/ViewInfo.aspx">View Information</a></li>
            <li><a href="/Faculty/PayCitation.aspx">Pay Citations</a></li>
            <li>
                <asp:LinkButton ID="SignOffButton" Text="Logout" runat="server" CausesValidation="False" OnCommand="LogoutButton_Click"></asp:LinkButton></li>
        </ul>
    </div>
    <br />
    <hr />
    <img src="/images/FacultyInfo.png" alt="" />
    <table class="tg">
        <tr>

            <th class="auto-style5">
                <h1 class="auto-style13">Personal Information</h1>
            </th>

        </tr>
        <tr>
            <th class="auto-style5">First Name: </th>
            <th class="auto-style11">
                <asp:TextBox ID="FirstNameTextBox" runat="server" ReadOnly="True" Width="167px" BackColor="#CCCCCC" EnableTheming="False"></asp:TextBox>
            </th>
            <th class="auto-style2"></th>
        </tr>
        <tr>
            <td class="auto-style4">Last Name: </td>
            <td class="auto-style11">
                <asp:TextBox ID="LastNameTextBox" runat="server" ReadOnly="True" Width="167px" BackColor="#CCCCCC"></asp:TextBox>
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style4">E-Mail:</td>
            <td class="auto-style11">
                <asp:TextBox ID="EmailTextBox" runat="server" ReadOnly="True" Width="167px" BackColor="#CCCCCC"></asp:TextBox>
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style6">Active:</td>
            <td class="auto-style7">
                <asp:TextBox ID="ActiveTextBox" runat="server" ReadOnly="True" Width="167px" BackColor="#CCCCCC"></asp:TextBox>
            </td>
            <td class="auto-style8">
                <asp:Label ID="RenewLabel" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Parking Type:</td>
            <td class="auto-style11">
                <asp:TextBox ID="ParkingTypeTextBox" runat="server" ReadOnly="True" Width="167px" BackColor="#CCCCCC"></asp:TextBox>
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style4">Address:</td>
            <td class="auto-style11">
                <asp:TextBox ID="AddressTextBox" runat="server" Width="167px"></asp:TextBox>
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style10">License #:</td>
            <td class="auto-style11">
                <asp:TextBox ID="LicenseTextBox" runat="server" Width="167px"></asp:TextBox>
            </td>
            <td class="auto-style12"></td>
        </tr>
        <tr>
            <td class="auto-style10">New Password:</td>
            <td class="auto-style11">
                <asp:TextBox ID="PasswordTextBox" runat="server" Width="167px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style12"></td>
        </tr>
        <tr>
            <td class="auto-style10">New Password Again:</td>
            <td class="auto-style11">
                <asp:TextBox ID="PasswordConfirmTextBox" runat="server" Width="167px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style12">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PasswordConfirmTextBox" ControlToValidate="PasswordTextBox" ErrorMessage="Passwords do not match!" Font-Bold="True" ForeColor="#990000"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="button">
                <asp:Button ID="UpdateButton" runat="server" Text="Update Information" Width="115px" OnClick="UpdateButton_Click" />
            </td>
            <td class="auto-style3">
                <asp:Label ID="StatusLabel" runat="server" ForeColor="#009900" Font-Bold="True"></asp:Label>
            </td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
    </table>


</asp:Content>
<asp:Content ID="Content11" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style type="text/css">
        .auto-style2 {
            width: 223px;
        }

        .button {
            text-align: center;
        }

        .auto-style3 {
            width: 202px;
        }

        .auto-style4 {
            text-align: right;
        }

        .auto-style5 {
            text-align: right;
            font-weight: normal;
        }

        .auto-style6 {
            text-align: right;
            height: 23px;
        }

        .auto-style7 {
            width: 202px;
            height: 23px;
            text-align: left;
        }

        .auto-style8 {
            width: 223px;
            height: 23px;
        }

        .auto-style10 {
            height: 22px;
            text-align: right;
        }

        .auto-style11 {
            width: 202px;
            text-align: left;
        }

        .auto-style12 {
            width: 223px;
            height: 22px;
        }

        .auto-style13 {
            font-size: medium;
        }
    </style>
</asp:Content>
