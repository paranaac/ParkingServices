<%@ Page Language="C#" AutoEventWireup="true" CodeFile="/Student/AddNewVehicle.aspx.cs" Inherits="AddNewVehicle" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content10" ContentPlaceHolderID="MyContent" runat="server">

    <div id="menu2" style="margin: 0;">
        <ul>
            <li><a href="/Students.aspx">Home</a></li>
            <li><a href="/Student/AddNewVehicle.aspx">Add New Vehicle</a></li>
            <li><a href="/Student/Renew.aspx">Renew Registration</a></li>
            <li><a href="/Student/ViewInfo.aspx">View Information</a></li>
            <li><a href="/Student/PayCitation.aspx">Pay Citations</a></li>
            <li>
                <asp:LinkButton ID="SignOffButton" Text="Logout" runat="server" CausesValidation="False" OnCommand="LogoutButton_Click"></asp:LinkButton></li>
        </ul>
    </div>
    <br />
    <hr />
    <img src="/images/StudentCars.png" alt="" />
    <div>
        <h1 class="auto-style14">Register New Vehicle</h1>
        <asp:Label ID="SessionLabel" runat="server" Visible="False"></asp:Label>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">Make:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="MakeTextBox" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="MakeTextBox" ErrorMessage="Please Insert A Make" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Model:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="ModelTextBox" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ModelTextBox" ErrorMessage="Please Insert A Model" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Color:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="ColorTextBox" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ColorTextBox" ErrorMessage="Please Insert A Color" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Year:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="YearTextBox" runat="server" TextMode="Number" Width="150px">2000</asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="YearTextBox" ErrorMessage="Please Insert A Year" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">License Plate:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="LicenseTextBox" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="LicenseTextBox" ErrorMessage="Please Insert A License" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style6">
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="AddButton" runat="server" OnClick="AddButton_Click" Text="Add New Vehicle" />
                </td>
                <td class="auto-style4">
                    <asp:Label ID="StatusLabel" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
                </td>
                <td class="auto-style4"></td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <h1 class="auto-style14">Registered Vehicles</h1>
    <asp:Label ID="NoVehiclesLabel" runat="server"></asp:Label>
    <br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style3">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content11" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style type="text/css">
        .auto-style3 {
            text-align: right;
        }

        .auto-style4 {
            height: 27px;
        }
    </style>
</asp:Content>
