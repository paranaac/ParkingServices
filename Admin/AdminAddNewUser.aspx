<%@ Page Language="C#" AutoEventWireup="true" CodeFile="/Admin/AdminAddNewUser.aspx.cs" Inherits="AdminAddNewUser" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content17" ContentPlaceHolderID="MyContent" runat="server">
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
    <img src="/images/AdminAdd.png" alt="" />
    <asp:Panel ID="Panel1" runat="server" GroupingText="Add New Users" Width="552px">
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">User ID:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="UserIDTextBox" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserIDTextBox" ErrorMessage="Enter A Valid ID*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer"
                        ControlToValidate="UserIDTextBox" ErrorMessage="User ID must be a whole number." ForeColor="Red" /></td>
            </tr>
            <tr>
                <td class="auto-style3">PIN:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="PINTextBox" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PINTextBox" ErrorMessage="PIN Required*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer"
                        ControlToValidate="PINTextBox" ErrorMessage="PIN must be a whole number." ForeColor="Red" /></td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style6">
                    <asp:Button ID="AddUserButton" runat="server" OnClick="AddUserButton_Click" Text="Add User" Width="88px" />
                </td>
                <td class="auto-style4">
                    <asp:Label ID="DuplicateUserLabel" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style3">
                    <asp:Label ID="SuccessLabel" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
                </td>
                <td></td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT * FROM [ALLOWEDIDS]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" PageSize="5" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="AllowedID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <Columns>
            <asp:BoundField DataField="AllowedID" HeaderText="AllowedID" ReadOnly="True" SortExpression="AllowedID" />
            <asp:BoundField DataField="ConfirmationPIN" HeaderText="ConfirmationPIN" SortExpression="ConfirmationPIN" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
</asp:Content>
