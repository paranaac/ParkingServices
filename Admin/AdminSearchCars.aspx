<%@ Page Language="C#" AutoEventWireup="true" CodeFile="/Admin/AdminSearchCars.aspx.cs" Inherits="AdminSearchCars" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MyContent" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script type="text/javascript" src="/Admin/TableSorter.js"></script>
    <script type="text/javascript">
        qjQuery(document).ready(function () {
            $("#Gridview2").tablesorter({ debug: false, widgets: [''], sortList: [[0, 0]] });
        });
    </script>

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

    <img src="/images/AdminSearchCars.png" alt="" />

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div id="Content" style="min-height: 440px; overflow: auto">
        <table width="100%" cellpadding="0" cellspacing="0" frame="void">
            <tr>
                <td>Search:
                    <asp:TextBox ID="txtSearch" runat="server" OnTextChanged="txtSearch_TextChanged" Height="15px" Width="200px" />
                </td>
                <td></td>
            </tr>
            <tr>
                <td valign="top">
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <asp:GridView ID="Gridview2" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataSourceID="dsGridview" Width="740px" CssClass="yui" PageSize="5" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                <Columns>
                                    <asp:BoundField DataField="PersonalID" HeaderText="Owner" SortExpression="PersonalID" ReadOnly="True" />
                                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                                    <asp:BoundField DataField="Email" HeaderText="E-Mail" SortExpression="Email" />
                                    <asp:BoundField DataField="DecalId" HeaderText="Decal" InsertVisible="False" ReadOnly="True" SortExpression="DecalId" />
                                    <asp:BoundField DataField="LicensePlate" HeaderText="Vehicle" SortExpression="LicensePlate" ReadOnly="True" />
                                    <asp:BoundField DataField="Make" HeaderText="Car Make" SortExpression="Make" />
                                    <asp:BoundField DataField="Model" HeaderText="Car Model" SortExpression="Model" />
                                    <asp:BoundField DataField="Color" HeaderText="Car Color" SortExpression="Color" />
                                    <asp:BoundField DataField="Year" HeaderText="Car Year" SortExpression="Year" />
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
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="txtSearch" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:SqlDataSource ID="dsGridview" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>"
                        SelectCommand="SELECT Personal.PersonalID, Personal.FirstName, Personal.LastName, VehicleList.VehicleID, Vehicle.Make, Vehicle.Model, Vehicle.Color, Vehicle.LicensePlate, Vehicle.Year, Vehicle.Valid, Personal.Email, Personal.License, Decal.DecalId, Decal.VehicleID AS Expr1, Decal.ExpirationDate FROM Personal INNER JOIN VehicleList ON Personal.PersonalID = VehicleList.PersonalID INNER JOIN Vehicle ON VehicleList.VehicleID = Vehicle.LicensePlate INNER JOIN Decal ON VehicleList.VehicleID = Decal.VehicleID GROUP BY Personal.PersonalID, Personal.FirstName, Personal.LastName, VehicleList.VehicleID, Vehicle.Make, Vehicle.Model, Vehicle.Color, Vehicle.LicensePlate, Vehicle.Year, Vehicle.Valid, Personal.Email, Personal.License, Decal.DecalId, Decal.VehicleID, Decal.ExpirationDate order by Personal.PersonalID"
                        FilterExpression="FirstName like '%{0}%' or LastName like '%{1}%' or Email like '%{2}%' or LicensePlate like '%{3}%'  or Make like '%{4}%' or Model like '%{5}%'" OnSelecting="dsGridview_Selecting">
                        <FilterParameters>
                            <asp:ControlParameter Name="FirstName" ControlID="txtSearch" PropertyName="Text" />
                            <asp:ControlParameter Name="LastName" ControlID="txtSearch" PropertyName="Text" />
                            <asp:ControlParameter Name="Email" ControlID="txtSearch" PropertyName="Text" />
                            <asp:ControlParameter Name="PersonalID" ControlID="txtSearch" PropertyName="Text" />
                            <asp:ControlParameter Name="LicensePlate" ControlID="txtSearch" PropertyName="Text" />
                            <asp:ControlParameter Name="Make" ControlID="txtSearch" PropertyName="Text" />
                            <asp:ControlParameter Name="Model" ControlID="txtSearch" PropertyName="Text" />
                        </FilterParameters>
                    </asp:SqlDataSource>
                </td>
                <td></td>
            </tr>
        </table>
    </div>
</asp:Content>
