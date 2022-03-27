<%@ Page Title="" Language="C#" MasterPageFile="~/MultiUser AddressBook/Content/MultiUserAddressBook.Master" AutoEventWireup="true" CodeBehind="ContactCategory.aspx.cs" Inherits="WebApplication2.MultiUser_AddressBook.AdminPanel.ContactCategory.ContactCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="Container box-shadow" style="font-family: 'News706 BT';">
        <div class="row">
            <div class="col-md-12">
                <h2>ContactCategory List</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <asp:HyperLink ID="hlAddContactCategory" runat="server" Text="Add ContactCategory" CssClass="btn btn-outline-dark" NavigateUrl="~/MultiUser AddressBook/AdminPanel/ContactCategory/ContactCategoryAddEdit.aspx"></asp:HyperLink>
            </div>
            <div style="padding-left: 12px">
                <asp:Label ID="lblMessage" CssClass="text-danger" runat="server" Text=""></asp:Label>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12" style="overflow-x: auto">
                <asp:GridView runat="server" ID="gvContactCategory" RowStyle-Font-Size="Small" HeaderStyle-CssClass="Colour" CssClass="table table-striped table-hover" AlternatingRowStyle-BackColor="#efecec" AutoGenerateColumns="false" OnRowCommand="gvContactCategory_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="ContactCategoryID" HeaderText="ID" Visible="false" />
                        <asp:BoundField DataField="ContactCategoryName" HeaderText="ContactCategory" />
                        <asp:TemplateField HeaderText="Delete" ControlStyle-Font-Size="X-Small">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-outline-danger" CommandName="DeleteRecord" CommandArgument='<%# Eval("ContactCategoryID").ToString() %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit" ControlStyle-Font-Size="X-Small">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlEdit" runat="server" Text="Edit" CssClass="btn btn-outline-success" NavigateUrl='<%#"~/MultiUser AddressBook/AdminPanel/ContactCategory/ContactCategoryAddEdit.aspx?ContactCategoryID=" +Eval("ContactCategoryID").ToString() %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>


</asp:Content>
