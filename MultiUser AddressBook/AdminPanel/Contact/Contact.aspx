<%@ Page Title="" Language="C#" MasterPageFile="~/MultiUser AddressBook/Content/MultiUserAddressBook.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication2.MultiUser_AddressBook.AdminPanel.Contact.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="Container box-shadow overflow-auto" style="font-family: 'News706 BT';">
        <div class="row">
            <div class="col-md-12">
                <h2 style="font-family: News706 BT;">Contact List</h2>
            </div>
        </div>
        <div class="row" style="font-family: 'News706 BT';">
            <div class="col-md-2">
                <asp:HyperLink ID="hlAddContact" runat="server" Text="Add Contact" CssClass="btn btn-outline-dark" NavigateUrl="~/MultiUser AddressBook/AdminPanel/Contact/ContactAddEdit.aspx"></asp:HyperLink>
            </div>
            <div style="padding-left: 10px">
                <asp:Label ID="lblMessage" ForeColor="Red" runat="server" Text=""></asp:Label>

            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView runat="server" ID="gvContact" RowStyle-Font-Size="Small" AutoGenerateColumns="false" HeaderStyle-CssClass="Colour" CssClass="table table-striped table-hover" AlternatingRowStyle-BackColor="#efecec" OnRowCommand="gvContact_RowCommand">
                    <Columns>

                        <asp:TemplateField HeaderText="Delete" ControlStyle-Font-Size="X-Small">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" Font-Names="News706 BT" runat="server" ToolTip="Delete Contact" Text="Delete" CssClass="btn btn-outline-danger" CommandName="DeleteRecord" CommandArgument='<%# Eval("ContactID").ToString() %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Edit" ControlStyle-Font-Size="X-Small">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlEdit" Font-Names="News706 BT" ToolTip="Edit Contact" runat="server" Text="Edit" CssClass="btn btn-outline-success" NavigateUrl='<%# "~/MultiUser AddressBook/AdminPanel/Contact/ContactAddEdit.aspx?ContactID=" +Eval("ContactID").ToString() %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Delete Image" ControlStyle-Font-Size="X-Small">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDeleteImage" Font-Names="News706 BT" ToolTip="Delete Image" runat="server" CssClass="btn btn-outline-danger" CommandName="DeleteImage" CommandArgument='<%# Eval("ContactID").ToString() %>'>
                                    <i class="fa-solid fa-trash-can" role="button"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image runat="server" ID="imgImage" CssClass="img-fluid me-4" ImageUrl='<%# Eval("FilePath") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ContactID" HeaderText="ID" Visible="false" />
                        <asp:BoundField DataField="ContactName" HeaderStyle-Font-Names="News706 BT" HeaderText="Contact" />
                        <asp:BoundField DataField="CountryName" HeaderStyle-Font-Names="News706 BT" HeaderText="Country" />
                        <asp:BoundField DataField="StateName" HeaderStyle-Font-Names="News706 BT" HeaderText="State" />
                        <asp:BoundField DataField="ContactCategoryName" HeaderStyle-Font-Names="News706 BT" HeaderText="ContactCategory" />
                        <asp:BoundField DataField="ContactNo" HeaderStyle-Font-Names="News706 BT" HeaderText="Contact No" />
                        <asp:BoundField DataField="WhatsappNo" HeaderStyle-Font-Names="News706 BT" HeaderText="Whatsapp No" />
                        <asp:TemplateField HeaderText="BirthDate">
                            <ItemTemplate>
                                <%# Convert.ToDateTime(Eval("BirthDate").ToString()).ToShortDateString() %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Age" HeaderStyle-Font-Names="News706 BT" HeaderText="Age" />
                        <asp:BoundField DataField="Email" HeaderStyle-Font-Names="News706 BT" HeaderText="Email" />
                        <asp:BoundField DataField="Address" HeaderStyle-Font-Names="News706 BT" HeaderText="Address" />
                        <asp:BoundField DataField="BloodGroup" HeaderStyle-Font-Names="News706 BT" HeaderText="BloodGroup" />
                        <asp:BoundField DataField="FacebookID" HeaderStyle-Font-Names="News706 BT" HeaderText="Facebook ID" />
                        <asp:BoundField DataField="LinkedINID" HeaderStyle-Font-Names="News706 BT" HeaderText="LinkedINID" />
                        <asp:BoundField DataField="FileType" HeaderText="File Type" />
                        <asp:BoundField DataField="FileSize" HeaderText="File Size(Bit)" />


                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>


</asp:Content>
