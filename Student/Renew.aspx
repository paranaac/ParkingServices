<%@ Page Language="C#" AutoEventWireup="true" CodeFile="/Student/Renew.aspx.cs" Inherits="Renew" MasterPageFile="~/Master.master" %>

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
    <img src="/images/StudentRenew.png" alt="" />
    <h2>Account Renewal</h2>
    <table>
        <tr>
            <td>Current Status</td>
            <td>
                <asp:TextBox ID="ActiveTextBox" runat="server" Width="175px" BackColor="#CCCCCC" Font-Bold="True" ReadOnly="True"></asp:TextBox>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>Expiration Date:</td>
            <td>
                <asp:TextBox ID="ExpDateTextBox" runat="server" Width="174px" BackColor="#CCCCCC" ReadOnly="True"></asp:TextBox>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="RenewAccountButton" runat="server" Text="Renew Account Registration" OnClick="RenewAccountButton_Click" />
            </td>
            <td>
                <asp:Label ID="AccountStatusLabel" runat="server" Font-Bold="True"></asp:Label>
            </td>
            <td></td>
        </tr>
    </table>
    <br />
    <h2>Decal Renewal</h2>
    <table>
        <tr>
            <td>
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
    <table>
        <tr>
            <td>Decal ID:</td>
            <td>
                <asp:TextBox ID="DecalIDTextBox" runat="server" Width="167px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="RenewDecalButton" runat="server" Text="Renew Decal" Width="77px" OnClick="RenewDecalButton_Click" />
            </td>
            <td>
                <asp:Label ID="StatusLabel" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>
