<%@ Page Title="" Language="C#" MasterPageFile="~/MultiUser AddressBook/Content/MultiUserAddressBook.Master" AutoEventWireup="true" CodeBehind="ContactCategoryAddEdit.aspx.cs" Inherits="WebApplication2.MultiUser_AddressBook.AdminPanel.ContactCategory.ContactCategoryAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="Container box-shadow" style="overflow: hidden; font-family: 'News706 BT'">
        <div class="row" style="padding-left: 5px;">
            <span style="font-family: News706 BT; font-size: larger;">ContactCategory :</span>
            <asp:Label CssClass="col-md  text align-left" ID="lblMessageMode" Font-Names="News706 BT" Font-Size="14px" runat="server"></asp:Label>
        </div>

        <hr />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px"><span style="color: red">*</span>ContactCategory Name</div>
            <div class="col-md-3">
                <asp:TextBox ID="txtContactCategoryName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-2" style="padding-top: 5px">
                <asp:RequiredFieldValidator ID="revContactCategory" runat="server" ControlToValidate="txtContactCategoryName" Display="Dynamic" ErrorMessage="*Please enter the Category" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <br />

        <div class="row">
            <div class="text-success text-center" style="padding-right: 100px;">
                <asp:Label runat="server" ID="lblMessage"></asp:Label>
            </div>
            <div class="text-danger text-center" style="padding-right: 100px;">
                <asp:Label runat="server" ID="lblMessageError"></asp:Label>
            </div>
        </div>

        <hr />

        <div class="row">


            <div class="offset-4" style="padding-left: 135px">
                <asp:Button runat="server" Text="Save" ID="btnSave" CssClass="btn btn-outline-success" OnClick="btnSave_Click" Width="85px" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink runat="server" NavigateUrl="~/MultiUser AddressBook/AdminPanel/ContactCategory/ContactCategory.aspx" Text="Cancel" ID="hlCancel" CssClass="btn btn-outline-danger" Width="85px" />
            </div>

        </div>

        <br />

    </div>


</asp:Content>
