<%@ Page Language="C#" AutoEventWireup="true" CodeFile="/Faculty/PayCitation.aspx.cs" Inherits="PayCitation" MasterPageFile="~/Master.master" %>

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
    <img src="/images/StudentCitation.png" alt="" /><br />
    <h2>Parking Citations
    </h2>
    <asp:Label ID="NoCitationsLabel" runat="server"></asp:Label>
    <br />

    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="496px" Style="margin-right: 0px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <asp:Button ID="PayButton" runat="server" Text="Pay Citations" Width="77px" OnClick="PayButton_Click" />
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="StatusLabel" runat="server" Font-Bold="True" ForeColor="#006600"></asp:Label>
    <br />
    <hr />



</asp:Content>
