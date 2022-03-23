<%@ Page Title="" Language="C#" MasterPageFile="~/MultiUser AddressBook/Content/MultiUserAddressBook.Master" AutoEventWireup="true" CodeBehind="StateAddEdit.aspx.cs" Inherits="WebApplication2.MultiUser_AddressBook.AdminPanel.State.StateAddEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="Container box-shadow" style="overflow: hidden">
         <div class="row" style="padding-left:5px">
           <span style="font-family:News706 BT; font-size:larger">State :</span>
           <asp:Label CssClass="col-md  text align-left" ID="lblMessageMode" Font-Names="News706 BT" Font-Size="14px" runat="server"></asp:Label>
       </div> 
         <hr />
        <div class="row" style="font-family:'News706 BT';">
            <div class="col-md-2 offset-4" style="font-family:News706 BT; font-weight: 500; padding-top: 5px">
               <span style="color:red">*</span> Country
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlCountryID" CssClass="form-select" Font-Names="News706 BT" runat="server"></asp:DropDownList>
                </div>
        <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ErrorMessage="*Please select the Country" ControlToValidate="ddlCountryID" Font-Names="News706 BT" Font-Size="X-Small" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
            </div>


        </div>
        <br />

        <div class="row" style="font-family:'News706 BT';">
            <div class="col-md-2 offset-4" style="font-family:News706 BT; font-weight: 500; padding-top: 5px">
               <span style="color:red">*</span> State Name
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="txtStateName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
        <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvStateName" runat="server" ErrorMessage="*Please enter the State Name" ControlToValidate="txtStateName" Font-Names="News706 BT" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>


        </div>
        <br />


        <div class="row" style="font-family:'News706 BT';">
            <div class="col-md-2 offset-4" style="font-family:News706 BT; font-weight: 500; padding-top: 5px">
               <span style="color:red">*</span> State Code
            </div>

            <div class="col-md-3">
                <asp:TextBox ID="txtStateCode" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
        <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvStateCode" runat="server" ErrorMessage="*Please enter the State Code" ControlToValidate="txtStateCode" Font-Names="News706 BT" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>


        </div>
         <div class="text-center">
         <asp:Label runat="server" ID="lblMessage" EnableViewState="true"></asp:Label>
         </div>
         <hr />

        <div class="row">


            <div class="offset-5" style="font-family:News706 BT; padding-left:14px;">
                <asp:Button runat="server" Text="Save" ID="btnSave" CssClass="btn btn-outline-success" OnClick="btnSave_Click" Width="85px" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink runat="server" NavigateUrl="~/MultiUser AddressBook/AdminPanel/State/State.aspx" Text="Cancel" ID="hlCancel" CssClass="btn btn-outline-danger" Width="85px" />
            </div>

        </div>
        <div class="row">
            <div class="col-md-6 text-danger">
                <asp:Label runat="server" ID="lblMessageError" EnableViewState="true"></asp:Label>
            </div>

        </div>

    <br />

    </div>


</asp:Content>
