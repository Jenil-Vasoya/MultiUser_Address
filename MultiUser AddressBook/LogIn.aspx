<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="WebApplication2.MultiUser_AddressBook.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/1Themes.css" rel="stylesheet" />
    <script src="Content/js/bootstrap.bundle.min.js"></script>
    <title>Log In</title>

</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h1 style="text-align: center; font-family: Berlin Sans FB; color:aliceblue">Log In</h1>
            <hr style="color:aliceblue" />
            <div class="row" style="font-family: Berlin Sans FB; color:aliceblue">
                <div class="col-md-4 text-start" style="padding-inline-start: 15px">UserName:</div>
                <div class="col-md-8 text-end" style="padding-inline-end: 16px">
                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="*Please enter UserName" ControlToValidate="txtUserName" Display="Dynamic" Font-Names="Berlin Sans FB" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblUserName" Font-Names="Berlin Sans FB" runat="server" Font-Size="Small" ForeColor="#003300"></asp:Label>

                </div>
            </div>

            <div style="padding-inline-start: 2px; padding-inline-end: 2px;" class="col-md-12">
                <asp:TextBox runat="server" Font-Names="Berlin Sans FB" CssClass="form-control" ID="txtUserName"></asp:TextBox>
            </div>

            <br />

            <div class="row" style="font-family: Berlin Sans FB; color:aliceblue">
                <div class="col-md-4 text-start" style="padding-inline-start: 15px">Password :</div>
                <div class="col-md-8 text-end" style="padding-inline-end: 16px">
                    <asp:RequiredFieldValidator ID="rfvUserName0" runat="server" ErrorMessage="*Please enter Password" ControlToValidate="txtPassword" Display="Dynamic" Font-Names="Berlin Sans FB" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div style="padding-inline-start: 2px; padding-inline-end: 2px;" class="col-md-12">
                <asp:TextBox ID="txtPassword" CssClass="form-control" type="password" runat="server"></asp:TextBox>
                <asp:Label ID="lblPassword" runat="server" Font-Names="Berlin Sans FB" Font-Size="Small" ForeColor="#003300"></asp:Label>
            </div>

            <br />

            <div style="text-align: center">
                <asp:Label ID="lblMessage" Font-Names="Berlin Sans FB" runat="server" Font-Size="Small" ForeColor="#003300"></asp:Label>
            </div>

            <br />
            <hr style="color:aliceblue" />

            <div class="row">
                <div class="btn justify-content-center">
                    <asp:Button ID="btnLogIn"  Font-Names="Berlin Sans FB" CssClass="btn btn-outline-light" runat="server" Text="Log In" OnClick="btnLogIn_Click" Width="100px" />
                </div>
            </div>
            <div class="row" style="justify-content: center">
                <asp:HyperLink ID="hlSignUp" runat="server" Font-Names="Berlin Sans FB" NavigateUrl="~/MultiUser AddressBook/SignUp.aspx" CssClass="btn btn-sm" Width="300px">Create Account</asp:HyperLink>
            </div>
        </div>
    </form>

</body>
</html>
