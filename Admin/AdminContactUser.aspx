<%@ Page Language="C#" AutoEventWireup="true" CodeFile="/Admin/AdminContactUser.aspx.cs" Inherits="AdminContactUser" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content19" ContentPlaceHolderID="MyContent" runat="server">
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
    <img src="/images/AdminContact.png" alt="" />
    <asp:Panel ID="Panel1" runat="server" GroupingText="Contact Users">
        <table>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <tr style="color: black; font-weight: 600">
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <div style="width: 100%; height: 250px; overflow: scroll">
                                <asp:GridView ID="adminGrid" HeaderStyle-CssClass=".FixedHeader {position: absolute;font-weight: bold;}" runat="server" AutoGenerateColumns="False" AllowSorting="True" OnSorting="adminGrid_Sorting" CurrentSortField="Active" CurrentSortDirection="ASC" CellPadding="4" ForeColor="#333333" GridLines="None">

                                    <Columns>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chk" runat="server" OnCheckedChanged="chk_CheckedChanged" AutoPostBack="true" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="PersonalID" HeaderText="ID" HeaderStyle-Wrap="false" SortExpression="PersonalID" />
                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" HeaderStyle-Wrap="false" SortExpression="FirstName" />
                                        <asp:BoundField DataField="LastName" HeaderText="Last Name" HeaderStyle-Wrap="false" SortExpression="LastName" />
                                        <asp:BoundField DataField="Email" HeaderText="E-Mail" HeaderStyle-Wrap="false" SortExpression="Email" />
                                        <asp:BoundField DataField="Active" HeaderText="Active" HeaderStyle-Wrap="false" SortExpression="Active" />
                                        <asp:BoundField DataField="ExpirationDate" HeaderText="Expiration Date" HeaderStyle-Wrap="false" SortExpression="ExpirationDate" />
                                        <asp:BoundField DataField="UnpaidFines" HeaderText="Unpaid Fines" HeaderStyle-Wrap="false" SortExpression="UnpaidFines" />
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
                    </div>
        <tr style="color: black; font-weight: 600">
            <td>Inactive Users
            </td>
        </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="gr2" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                <Columns>
                                    <asp:BoundField DataField="PersonalID" HeaderText="ID" />
                                    <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                                    <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                                    <asp:BoundField DataField="Email" HeaderText="E-Mail" />
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
                </ContentTemplate>
            </asp:UpdatePanel>
        </table>
    </asp:Panel>
    <br />

    <asp:Panel ID="Panel2" runat="server" GroupingText="E-Mail Form">


        <table>
            <tr>
                <td>Message Type:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>Expiring Registration</asp:ListItem>
                        <asp:ListItem>Unpaid Citations</asp:ListItem>
                        <asp:ListItem>Missing Information</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td>To:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="400px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Recipient(s) must be included*" ControlToValidate="SubjectTextBox" ValidationGroup="save" ForeColor="Red" /></td>
            </tr>
            <tr>
                <td>Subject:</td>
                <td>
                    <asp:TextBox ID="SubjectTextBox" runat="server" Width="400px" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredSubject" runat="server" ErrorMessage="Subject must be included*"
                        ControlToValidate="SubjectTextBox" ValidationGroup="save" ForeColor="Red" /></td>
            </tr>
            <tr>
                <td>Content:</td>
                <td>
                    <asp:TextBox ID="ContentBox" runat="server"
                        TextMode="MultiLine" Rows="10" Width="400px" Height="150px" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredContent" runat="server" ErrorMessage="Content must be included*"
                        ControlToValidate="ContentBox" ValidationGroup="save" ForeColor="Red" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" ValidationGroup="save" Width="140px" /></td>
                <td>
                    <asp:Label ID="DisplayMessage" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
