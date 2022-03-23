<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebApplication2.MultiUser_AddressBook.SignUp" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/1Themes.css" rel="stylesheet" />
    <script src="Content/js/bootstrap.bundle.min.js"></script>
    <title>Sign Up</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box" style="font-family:'News706 BT'">
        <h2 style="text-align: center;">Sign Up</h2>
        <hr />
            <div class="container">
                <div class="row">
                <div class="col-md-4 text-start" style="padding-inline-start: 15px">UserName</div>
                <div class="col-md-8 text-end" style="padding-inline-end: 16px">
                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="*Please enter UserName" ControlToValidate="txtUserName" Display="Dynamic" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblUserName" runat="server" Font-Size="X-Small" ForeColor="red"></asp:Label>

                </div>
            </div>
            <div style="padding-inline-start: 2px; padding-inline-end: 2px;" class="col-md-12">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtUserName"></asp:TextBox>
            </div>

        <br />

        <div class="row">
                <div class="col-md-4 text-start" style="padding-inline-start: 15px">Password </div>
                <div class="col-md-8 text-end" style="padding-inline-end: 16px">
                    <asp:RequiredFieldValidator ID="rfvUserName0" runat="server" ErrorMessage="*Please enter Password" ControlToValidate="txtPassword" Display="Dynamic" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>                    
                    <asp:Label ID="lblPassword" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
                </div>
            </div>
            <div style="padding-inline-start: 2px; padding-inline-end: 2px;" class="col-md-12">
                <asp:TextBox ID="txtPassword" CssClass="form-control" type="password" runat="server"></asp:TextBox>
            </div>
        <br />

        <div class="row">
                <div class="col-md-4 text-start" style="padding-inline-start: 15px">DisplayName </div>
                <div class="col-md-8 text-end" style="padding-inline-end: 16px">
                    <asp:RequiredFieldValidator ID="rfvDisplayName" runat="server" ErrorMessage="*Please enter DisplayName" ControlToValidate="txtDisplayName" Display="Dynamic" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblDisplayName" runat="server" Font-Size="X-Small" ForeColor="red"></asp:Label>                    
                </div>
            </div>
            <div style="padding-inline-start: 2px; padding-inline-end: 2px;" class="col-md-12">
                <asp:TextBox ID="txtDisplayName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        <br />

        <div class="row">
            <div class="col-md-4 text-start" style="padding-inline-start: 15px">Mobile No. </div>
                <div class="col-md-8 text-end" style="padding-inline-end: 16px">
                    <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server" ErrorMessage="*Please enter MobileNo" ControlToValidate="txtMobileNo" Display="Dynamic" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revMobileNo" runat="server" ErrorMessage="*Please enter the valid number" ControlToValidate="txtMobileNo" ValidationExpression="^([1-9]{1})([234789]{1})([0-9]{8})$" Display="Dynamic" Font-Size="X-Small" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:Label ID="lblMobileNo" runat="server"  Font-Size="X-Small" ForeColor="red"></asp:Label>                 
                </div>
            </div>
            <div style="padding-inline-start: 2px; padding-inline-end: 2px;" class="col-md-12">
                <asp:TextBox ID="txtMobileNo" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        <br />

        <div class="row">
            <div class="col-md-4 text-start" style="padding-inline-start: 15px">Email </div>
                <div class="col-md-8 text-end" style="padding-inline-end: 16px">
                <asp:RegularExpressionValidator CssClass="justify-content-end" ID="revEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="*Please enter the valid email" ControlToValidate="txtEmail" Font-Size="X-Small" ForeColor="red" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator CssClass="align-content-end" ID="rfvEmail" runat="server" ErrorMessage="*Please enter the Email" ControlToValidate="txtEmail" Font-Size="X-Small" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Label ID="lblEmail" runat="server" CssClass="text-danger" ForeColor="red" Visible="False" Font-Size="X-Small"></asp:Label>                
            </div>
          </div>
            <div style="padding-inline-start: 2px; padding-inline-end: 2px;" class="col-md-12">
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                <br />
            </div>
            <div style="text-align: center">
                <asp:Label ID="lblMessage" runat="server" Font-Size="X-Small" ForeColor="red"></asp:Label>
            </div>
                </div>
            <hr />
            <div class="row">
                <div class="btn justify-content-center">
                    <asp:Button ID="btnSignUp" CssClass="btn btn-outline-dark" runat="server" Text="Sign Up" Width="100px" OnClick="btnSignUp_Click" />
                </div>
            </div>
         <div class="row" style="justify-content:center">
            <asp:HyperLink ID="hlLogIn" runat="server" NavigateUrl="~/MultiUser AddressBook/LogIn.aspx" CssClass="btn btn-sm" Width="300px">Already have Account</asp:HyperLink>
        </div>
            </div>
    </form>

</body>
</html>
