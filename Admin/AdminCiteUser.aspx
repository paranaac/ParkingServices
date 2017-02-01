<%@ Page Language="C#" AutoEventWireup="true" CodeFile="/Admin/AdminCiteUser.aspx.cs" Inherits="AdminCiteUser" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content10" ContentPlaceHolderID="MyContent" runat="server">

    <div id="menu2" style="margin: 0;">
        <ul>
            <li><a href="/Admin.aspx">Home</a></li>
            <li><a href="/Admin/AdminAddNewUser.aspx">Add New User</a></li>
            <li><a href="/Admin/AdminSearch.aspx">Search Users</a></li>
            <li><a href="/Admin/AdminSearchCars.aspx">Search Cars</a></li>
            <li><a href="/Admin/AdminCiteUser.aspx">Cite Users</a></li>
            <li><a href="/Admin/AdminContactUser.aspx">Contact Users</a></li>
            <li>
                <asp:LinkButton ID="SignOffButton" Text="Logout" runat="server" CausesValidation="False" OnCommand="LogoutButton_Click"></asp:LinkButton></li>
        </ul>
    </div>
    <br />
    <hr />
    <img src="/images/AdminCite.png" alt="" />
    <table>
        <tr>
            <td rowspan="2" class="auto-style3">
                <img src="/images/parkingicon.png" alt="" style="height: 83px; width: 82px" />
            </td>
            <td>User:</td>
            <td>
                <asp:TextBox ID="UserTextBox" runat="server" Width="272px"></asp:TextBox>
            </td>
            <td class="auto-style2">

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserTextBox" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Please Enter A Valid ID</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer"
                    ControlToValidate="UserTextBox" ErrorMessage="User ID must be a whole number." ForeColor="Red" /></td>
        </tr>
        <tr>
            <td>Violation:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Parking Improperly ($25.00)</asp:ListItem>
                    <asp:ListItem>Parking Permit Not Displayed ($25.00)</asp:ListItem>
                    <asp:ListItem Value="Parking in Handicapped Space ($400.00)">Parking in Handicapped Space ($400.00)</asp:ListItem>
                    <asp:ListItem>Backing In or Pulling Through Space ($50.00)</asp:ListItem>
                    <asp:ListItem>Parking in Reserved Spaces ($25.00)</asp:ListItem>
                    <asp:ListItem>Vehicle Immobilization ($75.00)</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style2">
                <asp:Button ID="SubmitButton" Width="100%" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
            </td>
            <td class="auto-style4">

                <asp:Label ID="StatusLabel" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>

            </td>
        </tr>

    </table>


</asp:Content>

<asp:Content ID="Content11" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style type="text/css">
        .auto-style2 {
            width: 159px;
        }

        .auto-style3 {
            width: 102px;
        }

        .auto-style4 {
            width: 195px;
        }
    </style>
</asp:Content>


