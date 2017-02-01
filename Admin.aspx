<%@ Page Language="C#" AutoEventWireup="true" CodeFile="/Admin.aspx.cs" Inherits="Admin" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MyContent" runat="server">
    <div id="menu2" style="margin: 0;">
        <ul>
            <li><a href="/Admin.aspx">Home</a></li>
            <li><a href="/Admin/AdminAddNewUser.aspx">Add New User</a></li>
            <li><a href="/Admin/AdminSearch.aspx">Search Users</a></li>
            <li><a href="/Admin/AdminSearchCars.aspx">Search Cars</a></li>
            <li><a href="/Admin/AdminCiteUser.aspx">Cite Users</a></li>
            <li><a href="/Admin/AdminContactUser.aspx">Contact Users</a></li>
            <li>
                <asp:LinkButton ID="SignOffButton" Text="Logout" runat="server" OnCommand="LogoutButton_Click"></asp:LinkButton></li>
        </ul>
    </div>
    <br />
    <hr />
    <img src="/images/AdminHome.png" alt="" />
    <blockquote>
        <h3>
            <asp:Label ID="AdminWelcomeLabel" runat="server" Text="Welcome ..."></asp:Label><br />
        </h3>
        <div style="height: 100%">
            <h4>
                <p id="Date"></p>
            </h4>
            <script type="text/javascript">
                var today = new Date();
                var d = (today.getMonth() + 1 + "/" + today.getDate() + "/" + today.getFullYear());
                document.getElementById("Date").innerHTML = "Today is: " + d;
            </script>
        </div>
        <br />
    </blockquote>

    <table>
        <tr>
            <th>
                <h1>Account Information</h1>
            </th>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT ParkingType.TypeName, Login.USERID, Personal.Address, Personal.License, Personal.Email, Personal.FirstName, Personal.LastName, Personal.Active, Personal.ExpirationDate FROM Login INNER JOIN Personal ON Login.PersonalID = Personal.PersonalID INNER JOIN ParkingType ON Login.UserType = ParkingType.ParkingTypeID"></asp:SqlDataSource>
                <br />


                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" PageSize="6" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="USERID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="USERID" HeaderText="ID" SortExpression="USERID" ReadOnly="True" />
                        <asp:BoundField DataField="TypeName" HeaderText="Type" SortExpression="TypeName" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                        <asp:BoundField DataField="Email" HeaderText="E-Mail" SortExpression="Email" />
                        <asp:BoundField DataField="License" HeaderText="License #" SortExpression="License" />
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        <asp:BoundField DataField="ExpirationDate" HeaderText="Expiration Date" SortExpression="ExpirationDate" />
                        <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
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
            </td>
        </tr>
        <tr>
            <th>
                <h1>Vehicle Information</h1>
            </th>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT Personal.PersonalID, Personal.FirstName, Personal.LastName, VehicleList.VehicleID, Vehicle.Make, Vehicle.Model, Vehicle.Color, Vehicle.LicensePlate, Vehicle.Year, Vehicle.Valid, Personal.Email, Personal.License, Decal.DecalId, Decal.VehicleID AS Expr1, Decal.ExpirationDate FROM Personal INNER JOIN VehicleList ON Personal.PersonalID = VehicleList.PersonalID INNER JOIN Vehicle ON VehicleList.VehicleID = Vehicle.LicensePlate INNER JOIN Decal ON VehicleList.VehicleID = Decal.VehicleID GROUP BY Personal.PersonalID, Personal.FirstName, Personal.LastName, VehicleList.VehicleID, Vehicle.Make, Vehicle.Model, Vehicle.Color, Vehicle.LicensePlate, Vehicle.Year, Vehicle.Valid, Personal.Email, Personal.License, Decal.DecalId, Decal.VehicleID, Decal.ExpirationDate order by Personal.PersonalID"></asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" DataKeyNames="PersonalID,LicensePlate,DecalId">
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
                <br />
            </td>
        </tr>
        <tr>
            <th>
                <h1>Citations Information</h1>
            </th>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT Personal.PersonalID, Personal.FirstName, Personal.LastName, Personal.Active, Personal.ExpirationDate, ViolationType.ViolationName, ViolationType.ViolationPrice, ParkingTickets.Paid FROM Personal INNER JOIN ParkingTickets ON Personal.PersonalID = ParkingTickets.PersonalID INNER JOIN ViolationType ON ParkingTickets.ViolationID = ViolationType.ViolationID  order by Personal.PersonalID"></asp:SqlDataSource>
                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="PersonalID" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="Horizontal">
                    <Columns>
                        <asp:BoundField DataField="PersonalID" HeaderText="ID" ReadOnly="True" SortExpression="PersonalID" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                        <asp:CheckBoxField DataField="Active" HeaderText="Active Status" SortExpression="Active" />
                        <asp:BoundField DataField="ExpirationDate" HeaderText="Expiration Date" SortExpression="ExpirationDate" />
                        <asp:BoundField DataField="ViolationName" HeaderText="Violation Name" SortExpression="ViolationName" />
                        <asp:BoundField DataField="ViolationPrice" HeaderText="ViolationPrice" SortExpression="ViolationPrice" />
                        <asp:CheckBoxField DataField="Paid" HeaderText="Paid" SortExpression="Paid" />
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
            </td>
        </tr>
    </table>
    <br />
    <hr />
    <asp:Button ID="LogoutButton" runat="server" OnClick="LogoutButton_Click" Text="Logout" Width="100px" />
</asp:Content>
