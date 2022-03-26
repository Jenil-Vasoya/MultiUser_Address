<%@ Page Title="" Language="C#" MasterPageFile="~/MultiUser AddressBook/Content/MultiUserAddressBook.Master" AutoEventWireup="true" CodeBehind="City.aspx.cs" Inherits="WebApplication2.MultiUser_AddressBook.AdminPanel.City.City" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="Container box-shadow"  style="font-family:News706 BT;">
       <div class="row">
           <div class="col-md-12">
             <h2>City List</h2>
           </div>
       </div>
       <div class="row">
         <div class="col-md-2">
               <asp:HyperLink ID="hlAddCity" runat="server" Font-Names="News706 BT"  Text="Add City" CssClass="btn btn-outline-dark btn-align-content-center" NavigateUrl="~/MultiUser AddressBook/AdminPanel/City/CityAddEdit.aspx"></asp:HyperLink></div>
            <div style="padding-left:10px">
                <asp:Label ID="lblMessage" ForeColor="Red" Font-Names="News706 BT" runat="server" Text=""></asp:Label>
          </div>
        </div>
      <div class="row">
        <div class="col-md-12" style="overflow-x:auto">
            <asp:GridView runat="server" ID="gvCity" RowStyle-Font-Size="Small" HeaderStyle-CssClass="Colour" CssClass="table table-striped table-hover" AlternatingRowStyle-BackColor="#efecec" AutoGenerateColumns="false" OnRowCommand="gvCity_RowCommand">
                <Columns>
                    <asp:BoundField DataField="CityID" HeaderText="ID" Visible="false"/>
                    <asp:BoundField DataField="StateName" HeaderText="State"/>
                    <asp:BoundField DataField="CityName" HeaderText="City" />
                    <asp:BoundField DataField="PinCode" HeaderText="Pin Code" />
                    <asp:BoundField DataField="STDCode" HeaderText="STD Code" />
                    <asp:TemplateField HeaderStyle-Font-Names="News706 BT" HeaderText="Delete" ControlStyle-Font-Size="X-Small">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Font-Names="News706 BT" Text="Delete" CssClass="btn btn-outline-danger" CommandName="DeleteRecord" CommandArgument='<%# Eval("CityID").ToString() %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Font-Names="News706 BT" HeaderText="Edit" ControlStyle-Font-Size="X-Small">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEdit" runat="server" Font-Names="News706 BT"    Text="Edit" CssClass="btn btn-outline-success" NavigateUrl='<%#"~/MultiUser AddressBook/AdminPanel/City/CityAddEdit.aspx?CityID=" +Eval("CityID").ToString().Trim()%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</div>

</asp:Content>
