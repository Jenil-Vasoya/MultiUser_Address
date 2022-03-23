<%@ Page Title="" Language="C#" MasterPageFile="~/MultiUser AddressBook/Content/MultiUserAddressBook.Master" AutoEventWireup="true" CodeBehind="CountryAddEdit.aspx.cs" Inherits="WebApplication2.MultiUser_AddressBook.AdminPanel.Country.CountryAddEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="Container box-shadow" style="overflow: hidden; font-family:'News706 BT'">
       <div class="row" style=" padding-left:5px;">
           <span style="font-family:News706 BT; font-size:larger; ">Country :</span>
           <asp:Label CssClass="col-md-2  text align-left" ID="lblMessageMode" Font-Names="News706 BT" Font-Size="14px" runat="server"></asp:Label>
       </div>        
         <hr />
    <div class="row">
         <div class="col-md-2 offset-4" style="font-weight:500; padding-top:5px; font-family: 'News706 BT'; font-size: large;"><span style="color:red">*</span>Country Name</div>
       <div class="col-md-3">
            <asp:TextBox ID="txtCountryName" Font-Names="News706 BT" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
        <div class="col-md-3">
           <asp:RequiredFieldValidator ID="rfvCountryName" runat="server" ErrorMessage="*Please enter the Country Name" ControlToValidate="txtCountryName" Font-Names="News706 BT" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
       </div>
        
   </div>
         <br />

       <div class="row">
         <div class="col-md-2 offset-4" style="font-weight:500; padding-top:5px; font-family: 'News706 BT'; font-size: large;"><span style="color:red">*</span>Country Code</div>
       <div class="col-md-3">
            <asp:TextBox ID="txtCountryCode" Font-Names="News706 BT" CssClass="form-control" runat="server"></asp:TextBox>
           </div>
        <div class="col-md-3">
           <asp:RequiredFieldValidator ID="rfvCountryCode" runat="server" ErrorMessage="*Please enter the Country Code" ControlToValidate="txtCountryCode" Font-Names="News706 BT" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
       </div>
        
   </div>
           
    <br /> 
          <div class="row text-center">
            <asp:label Font-Names="News706 BT" runat="server" ID="lblMessage" ></asp:label>
          </div>
        <hr />
  
   <div class="row">

            <div class="offset-5" style="font-family:News706 BT; padding-left:10px;">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-outline-success" Width="85px" OnClick="btnSave_Click" /> &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink runat="server" NavigateUrl="~/MultiUser AddressBook/AdminPanel/Country/Country.aspx" Text="Cancel" ID="hlCancel" CssClass="btn btn-outline-danger" Width="85px" />
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
