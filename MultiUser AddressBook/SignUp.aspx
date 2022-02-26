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
        <div class="box">
        <h2 style="text-align: center; font-family:Berlin Sans FB;">Sign Up</h2>
        <hr />
        <div class="row" style="font-family: Berlin Sans FB; padding-inline-start: 15px;">
            <div class="col-md-6">
                UserName:
            </div>
            <div class="col-md-6 text-end" style="padding-inline-end:32px">
                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="*Please enter the UserName" ControlToValidate="txtUserName" Display="Dynamic" Font-Names="Berlin Sans FB" Font-Size="Small" ForeColor="#003300"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="padding-inline-start: 5px;" class="col-md">
            <asp:TextBox runat="server" Font-Names="Berlin Sans FB" CssClass="form-control" ID="txtUserName" Width="425px"></asp:TextBox>
            <asp:Label ID="lblUserName" Font-Names="Berlin Sans FB" runat="server" Font-Size="Small" ForeColor="#003300" Visible="False"></asp:Label>
        </div>

        <br />

        <div class="row" style="font-family: Berlin Sans FB; padding-inline-start: 15px;">
            <div class="col-md-6">Password :</div>
            <div class="col-md-6 text-end" style="padding-right:32px">
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="*Please enter the Password" ControlToValidate="txtPassword" Display="Dynamic" Font-Names="Berlin Sans FB" Font-Size="Small" ForeColor="#003300"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="padding-inline-start: 5px;" class="col-md">
            <asp:TextBox ID="txtPassword" CssClass="form-control" type="password" runat="server" Width="425px"></asp:TextBox>
            <asp:Label ID="lblPassword" runat="server" Font-Names="Berlin Sans FB" Font-Size="Small" ForeColor="#003300"></asp:Label>

        </div>
        <br />

        <div class="row" style="font-family: Berlin Sans FB; padding-inline-start: 15px;">
            <div class="col-md-6">DisplayName :</div>
            <div class="col-md-6 text-end" style="padding-right:32px">
                <asp:RequiredFieldValidator ID="rfvDisplayName" runat="server" ErrorMessage="*Please enter the DisplayName" ControlToValidate="txtDisplayName" Display="Dynamic" Font-Names="Berlin Sans FB" Font-Size="Small" ForeColor="#003300"></asp:RequiredFieldValidator>
            </div>
            <div style="padding-inline-start: 2px;" class="col-md">
                <asp:TextBox ID="txtDisplayName" CssClass="form-control" runat="server" Width="425px"></asp:TextBox>
                <asp:Label ID="lblDisplayName" runat="server" Font-Names="Berlin Sans FB" Font-Size="Small" ForeColor="#003300"></asp:Label>
            </div>
        </div>
        <br />

        <div class="row" style="font-family: Berlin Sans FB; padding-inline-start: 15px;">
            <div class="col-md-6">Mobile No :</div>
            <div class="col-md-6 text-end" style="padding-right:32px">
                <asp:RegularExpressionValidator ID="revMobileNo" runat="server" ErrorMessage="*Please enter the valid number" ControlToValidate="txtMobileNo" ValidationExpression="^([1-9]{1})([234789]{1})([0-9]{8})$" Display="Dynamic" Font-Size="Small" ForeColor="#003300" Font-Names="Berlin Sans FB"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server" ErrorMessage="*Please enter the Contact No" ControlToValidate="txtMobileNo" Font-Size="Small" ForeColor="#003300" ValidationExpression="^([1-9]{1})([234789]{1})([0-9]{8})$" Display="Dynamic" Font-Names="Berlin Sans FB"></asp:RequiredFieldValidator>
            </div>
            <div style="padding-inline-start: 2px;" class="col-md">
                <asp:TextBox ID="txtMobileNo" CssClass="form-control" runat="server" Width="425px"></asp:TextBox>
                <asp:Label ID="lblMobileNo" runat="server" CssClass="text-danger" Font-Names="Berlin Sans FB" ForeColor="#003300" Visible="False" Font-Size="Small"></asp:Label>
            </div>
        </div>
        <br />

        <div class="row" style="font-family: Berlin Sans FB; padding-inline-start: 15px;">
            <div class="col-md-6">Email :</div>
            <div class="col-md-6  text-end" style="padding-right:32px">
                <asp:RegularExpressionValidator CssClass="justify-content-end" ID="revEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="*Please enter the valid email" ControlToValidate="txtEmail" Font-Size="Small" ForeColor="#003300" Display="Dynamic" Font-Names="Berlin Sans FB"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator CssClass="align-content-end" ID="rfvEmail" runat="server" ErrorMessage="*Please enter the Email" ControlToValidate="txtEmail" Font-Size="Small" ForeColor="#003300" Display="Dynamic" Font-Names="Berlin Sans FB"></asp:RequiredFieldValidator>
            </div>
            <div style="padding-inline-start: 2px;" class="col-md">
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" Width="425px"></asp:TextBox>
                <asp:Label ID="lblEmail" runat="server" CssClass="text-danger" ForeColor="#003300" Visible="False" Font-Names="Berlin Sans FB" Font-Size="Small"></asp:Label>
                <br />
            </div>
            </div>
            <div style="text-align: center">
                <asp:Label ID="lblMessage" Font-Names="Berlin Sans FB" runat="server" Font-Size="Small" ForeColor="Black"></asp:Label>
            </div>
            <hr />
            <div class="row">
                <div class="btn justify-content-center">
                    <asp:Button ID="btnSignUp" BackColor="Black" Font-Names="Berlin Sans FB" CssClass="btn btn-outline-dark" runat="server" Text="Sign Up" Width="100px" OnClick="btnSignUp_Click" />
                </div>
            </div>
         <div class="row" style="justify-content:center">
            <asp:HyperLink ID="hlLogIn" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/MultiUser AddressBook/LogIn.aspx" CssClass="btn btn-sm" Width="300px">Already have Account</asp:HyperLink>
        </div>
            </div>
    </form>

</body>
</html>
