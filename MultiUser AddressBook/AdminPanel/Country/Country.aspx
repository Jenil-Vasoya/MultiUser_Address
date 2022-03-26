﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MultiUser AddressBook/Content/MultiUserAddressBook.Master" AutoEventWireup="true" CodeBehind="Country.aspx.cs" Inherits="WebApplication2.MultiUser_AddressBook.AdminPanel.Country.Country" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="Container box-shadow" style="overflow: hidden; font-family: 'News706 BT';">
        <div class="row">
            <div class="col-md-12">
                <h2>Country List</h2>
            </div>
        </div>

        <div class="row" style="overflow-x: auto">
            <div class="col-md-2">
                <asp:HyperLink ID="hlAddCountry" Font-Names="News706 BT" runat="server" Text="Add Country" CssClass="btn btn-outline-dark btn-align-content-center" NavigateUrl="~/MultiUser AddressBook/AdminPanel/Country/CountryAddEdit.aspx"></asp:HyperLink>
            </div>
            <div style="padding-left: 12px">
                <asp:Label ID="lblMessage" Font-Names="News706 BT" runat="server" Text=""></asp:Label>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <asp:GridView runat="server" ID="gvCountry" RowStyle-Font-Size="Small" HeaderStyle-CssClass="Colour" CssClass="table table-striped table-hover" AlternatingRowStyle-BackColor="#efecec" AutoGenerateColumns="false" OnRowCommand="gvCountry_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="CountryID" HeaderStyle-Font-Names="News706 BT" HeaderText="ID" Visible="false" />
                        <asp:BoundField DataField="CountryName" HeaderStyle-Font-Names="News706 BT" HeaderText="Country" />
                        <asp:BoundField DataField="CountryCode" HeaderStyle-Font-Names="News706 BT" HeaderText="Country Code" />
                        <asp:TemplateField HeaderStyle-Font-Names="News706 BT" HeaderText="Delete" ControlStyle-Font-Size="X-Small">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Font-Names="News706 BT" Text="Delete" CssClass="btn btn-outline-danger" CommandName="DeleteRecord" CommandArgument='<%# Eval("CountryID").ToString() %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Font-Names="News706 BT" HeaderText="Edit" ControlStyle-Font-Size="X-Small">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlEdit" runat="server" Font-Names="News706 BT" Text="Edit" CssClass="btn btn-outline-success" CommandName="EditRecord" NavigateUrl='<%# "~/MultiUser AddressBook/AdminPanel/Country/CountryAddEdit.aspx?CountryID=" +  Eval("CountryID").ToString() %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>


</asp:Content>
