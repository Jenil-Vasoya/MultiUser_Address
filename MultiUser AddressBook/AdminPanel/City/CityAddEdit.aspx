<%@ Page Title="" Language="C#" MasterPageFile="~/MultiUser AddressBook/Content/MultiUserAddressBook.Master" AutoEventWireup="true" CodeBehind="CityAddEdit.aspx.cs" Inherits="WebApplication2.MultiUser_AddressBook.AdminPanel.City.CityAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="Container box-shadow" style="overflow: hidden; font-family: 'News706 BT'">
        <div class="row" style="padding-left: 5px">
            <span style="font-size: larger">City :</span>
            <asp:Label CssClass="col-md  text align-left" ID="lblMessageMode" Font-Names="News706 BT" Font-Size="14px" runat="server"></asp:Label>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px"><span style="color: red">*</span>State</div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlState" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="*Please select the State" ControlToValidate="ddlState" Font-Names="News706 BT" Font-Size="X-Small" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
            </div>
        </div>

        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px"><span style="color: red">*</span>City Name</div>
            <div class="col-md-3">
                <asp:TextBox ID="txtCityName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvCityName" runat="server" ErrorMessage="*Please enter the City Name" ControlToValidate="txtCityName" Font-Names="News706 BT" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px"><span style="color: red">*</span>STD Code</div>
            <div class="col-md-3">
                <asp:TextBox ID="txtSTDCode" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvSTDCode" runat="server" ErrorMessage="*Please enter STD Code" ControlToValidate="txtSTDCode" Font-Names="News706 BT" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px"><span style="color: red">*</span>PIN Code</div>
            <div class="col-md-3">
                <asp:TextBox ID="txtPINCode" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvPINCode" runat="server" ErrorMessage="*Please enter PIN Code" ControlToValidate="txtPINCode" Font-Names="News706 BT" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <br />

        <div class="row text-center">
            <asp:Label runat="server" Font-Names="News706 BT" ForeColor="Green" ID="lblMessage" EnableViewState="true"></asp:Label>
        </div>

        <hr />

        <div class="row">
            <div class="offset-5" style="font-family: 'News706 BT';">
                <asp:Button runat="server" Text="Save" ID="btnSave" CssClass="btn btn-outline-success" OnClick="btnSave_Click" Width="85px" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink runat="server" NavigateUrl="~/MultiUser AddressBook/AdminPanel/City/City.aspx" Text="Cancel" ID="hlCancel" CssClass="btn btn-outline-danger" Width="85px" />
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 offset-4 text-danger">
                <asp:Label runat="server" ID="lblMessageError" EnableViewState="true"></asp:Label>
            </div>
        </div>

        <br />

    </div>


</asp:Content>
