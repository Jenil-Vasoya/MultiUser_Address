<%@ Page Title="" Language="C#" MasterPageFile="~/MultiUser AddressBook/Content/MultiUserAddressBook.Master" AutoEventWireup="true" CodeBehind="ContactAddEdit.aspx.cs" Inherits="WebApplication2.MultiUser_AddressBook.AdminPanel.Contact.ContactAddEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Container box-shadow" style="overflow: hidden">
        <hr />
         <div class="row">
      <div class="col-md-2 offset-3" style="font-weight: 500; padding-top: 5px">Country</div>
        <div class="col-md-2">
            <asp:DropDownList ID="ddlCountry" CssClass="form-select" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList>
        </div>
             
             <div class="col-md-3">
                 <asp:Label ID="lblCountry" runat="server" CssClass="text-danger"></asp:Label>
            <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ErrorMessage="*Please Select the Country" ControlToValidate="ddlCountry" Font-Size="Small" ForeColor="#FF3300" InitialValue="-1" Display="Dynamic" ValidationGroup="CountryForm"></asp:RequiredFieldValidator>
             </div>

    </div>
    <br />

    <div class="row">
      <div class="col-md-2 offset-3" style="font-weight: 500; padding-top: 5px">State</div>
        <div class="col-md-2">
            <asp:DropDownList ID="ddlState" CssClass="form-select" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
        </div>
        <div class="col-md">
                 <asp:Label ID="lblState" runat="server" CssClass="text-danger"></asp:Label>
            <asp:RequiredFieldValidator ID="rfvState1" runat="server" ErrorMessage="*First Select Country" ControlToValidate="ddlState" Font-Size="Small" ForeColor="#FF3300" InitialValue="" Display="Dynamic" ValidationGroup="CountryForm"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvState2" runat="server" ErrorMessage="*Please Select the  State" ControlToValidate="ddlState" Font-Size="Small" ForeColor="#FF3300" InitialValue="-1" Display="Dynamic" ValidationGroup="CountryForm"></asp:RequiredFieldValidator>
             </div>

    </div>
    <br />

         <div class="row">
      <div class="col-md-2 offset-3" style="font-weight: 500; padding-top: 5px">City</div>
        <div class="col-md-2">
            <asp:DropDownList ID="ddlCity" CssClass="form-select" runat="server"></asp:DropDownList>
        </div>
             <div class="col-md-4">
                 <asp:Label ID="lblCity" runat="server" CssClass="text-danger"></asp:Label>
            <asp:RequiredFieldValidator ID="rfvCity1" runat="server" ErrorMessage="*First select the State" ControlToValidate="ddlCity" Font-Size="Small" ValidationGroup="CountryForm" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvCity2" runat="server" ErrorMessage="*Please Select the City" ControlToValidate="ddlCity" Font-Size="Small" ValidationGroup="CountryForm" ForeColor="#FF3300" InitialValue="-1" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

    </div>
    <br />

         <div class="row">
      <div class="col-md-2 offset-3" style="font-weight: 500; padding-top: 5px">Contact Category</div>
        <div class="col-md-2">
            <asp:DropDownList ID="ddlContactCategory" CssClass="form-select" Width="230" runat="server"></asp:DropDownList>
        </div>
             <div class=" col-md" style="padding-left: 25px;">
                 <asp:Label ID="lblContactCategory" runat="server" CssClass="text-danger"></asp:Label>
            <asp:RequiredFieldValidator ID="rfvContactCategory" runat="server" ErrorMessage="*Please Select the ContactCategory" ValidationGroup="CountryForm" ControlToValidate="ddlContactCategory" Font-Size="Small" ForeColor="#FF3300" InitialValue="-1" Display="Dynamic"></asp:RequiredFieldValidator>
             </div>

    </div>
    <br />

    <div class="row">
        <div class="col-md-2 offset-3" style="font-weight: 500; padding-top: 5px">Contact Name</div>
        <div class="col-md-2">
            <asp:TextBox ID="txtContactName" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-2">
                 <asp:Label ID="lblContactName" runat="server" CssClass="text-danger"></asp:Label>
            <asp:RequiredFieldValidator ID="rfvContactName" runat="server" ErrorMessage="*Please enter the Name" ValidationGroup="CountryForm" ControlToValidate="txtContactName" Font-Size="Small" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
             </div>

    </div>
    <br />


    <div class="row">
        <div class="col-md-2 offset-3" style="font-weight: 500; padding-top: 5px">Contact No</div>
        <div class="col-md-2">
            <asp:TextBox ID="txtContactNo" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-2">
                <asp:Label ID="lblContactNo" runat="server" CssClass="text-danger"></asp:Label>
                <asp:RegularExpressionValidator ID="revContactNo" runat="server" ValidationGroup="CountryForm" ErrorMessage="*Please enter the valid number" ControlToValidate="txtContactNo" ValidationExpression="^([1-9]{1})([234789]{1})([0-9]{8})$" Display="Dynamic" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfvContactNo" runat="server" ValidationGroup="CountryForm" ErrorMessage="*Please enter the Contact No" ControlToValidate="txtContactNo" Font-Size="Small" ForeColor="#FF3300" ValidationExpression="^([1-9]{1})([234789]{1})([0-9]{8})$" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

    </div>
    <br />

    <div class="row">
       <div class="col-md-2 offset-3" style="font-weight: 500; padding-top: 5px">Whatsapp No</div>
        <div class="col-md-2">
            <asp:TextBox ID="txtWhatsappNo" CssClass="form-control" runat="server"></asp:TextBox>
        </div>

    </div>
    <br />

        <div class="row">
            <div class="col-md-2 offset-3" style="font-weight:500; padding-top:5px">Birth Date</div>
            <div class="col-md-2">
                <asp:TextBox ID="txtBirthDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                 <asp:CompareValidator ID="cvBirthDate" ValidationGroup="CountryForm" runat="server" ControlToValidate="txtBirthDate" ErrorMessage="*Please enter the vailidate BirthDate" Operator="DataTypeCheck" Type="Date" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
            </div>
        </div>
        <br />

         <div class="row">
            
            <div class="col-md-2 offset-3" style="font-weight:500; padding-top:5px">Email</div>
            <div class="col-md-2">
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
             <div class="col-md-2">
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ValidationGroup="CountryForm" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="*Please enter the valid email" ControlToValidate="txtEmail" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:Label ID="lblEmail" runat="server" CssClass="text-danger"></asp:Label>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ValidationGroup="CountryForm" ErrorMessage="*Please enter the Email" ControlToValidate="txtEmail" Font-Size="Small" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
             </div>

             </div>
        
        
        <br />

         <div class="row">
            <div class="col-md-2 offset-3" style="font-weight:500; padding-top:5px">Age</div>
            <div class="col-md-2">
                <asp:TextBox ID="txtAge" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />

         <div class="row">
            <div class="col-md-2 offset-3" style="font-weight:500; padding-top:5px">Address</div>
            <div class="col-md-2">
                <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
             <div class="col-md-2">
                 <asp:Label ID="lblAddress" runat="server" CssClass="text-danger"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ValidationGroup="CountryForm" ControlToValidate="txtAddress" ErrorMessage="*Please enter  your address" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
             </div>
        </div>
        <br />

         <div class="row">
            <div class="col-md-2 offset-3" style="font-weight:500; padding-top:5px">Blood Group</div>
            <div class="col-md-2">
                <asp:TextBox ID="txtBloodGroup" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />

         <div class="row">
            <div class="col-md-2 offset-3" style="font-weight:500; padding-top:5px">Facebook ID</div>
            <div class="col-md-2">
                <asp:TextBox ID="txtFacebook" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />

         <div class="row">
            <div class="col-md-2 offset-3" style="font-weight:500; padding-top:5px">LinkedIn ID</div>
            <div class="col-md-2">
                <asp:TextBox ID="txtLinkedIn" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <hr />

   <div class="row">


            <div class="offset-5">
                <asp:Button runat="server" Text="Save" ID="btnSave" CssClass="btn btn-success" OnClick="btnSave_Click" Width="85px" />
         
            
                <asp:HyperLink runat="server" NavigateUrl="~/MultiUser AddressBook/AdminPanel/Contact/Contact.aspx" Text="Cancel" ID="hlCancel" CssClass="btn btn-danger" Width="85px" />
            </div>

        </div>
    <div class="row">
       <div class="col-md text-danger text-center" style="padding-right: 100px;">
            <asp:Label runat="server" ID="lblMessage" EnableViewState="true"></asp:Label>
        </div>

        </div>
    </div><br />


</asp:Content>
