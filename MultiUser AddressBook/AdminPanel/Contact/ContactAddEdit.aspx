<%@ Page Title="" Language="C#" MasterPageFile="~/MultiUser AddressBook/Content/MultiUserAddressBook.Master" AutoEventWireup="true" CodeBehind="ContactAddEdit.aspx.cs" Inherits="WebApplication2.MultiUser_AddressBook.AdminPanel.Contact.ContactAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Container box-shadow" style="overflow: hidden; font-family: 'News706 BT';">
        <div class="row" style="padding-left: 5px">
            <span style="font-size: larger">Contact :</span>
            <asp:Label CssClass="col-md-4  text align-left" ID="lblMessageMode" Font-Names="News706 BT" Font-Size="14px" runat="server"></asp:Label>

        </div>
        <hr />
        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px"><span style="color: red">*</span>Country</div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlCountry" CssClass="form-select" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList>
            </div>

            <div class="col-md-3">
                <asp:Label ID="lblCountry" runat="server" CssClass="text-danger" Font-Size="X-Small"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ErrorMessage="*Please Select the Country" ControlToValidate="ddlCountry" Font-Size="X-Small" ForeColor="#FF3300" InitialValue="-1" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

        </div>
        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px"><span style="color: red">*</span>State</div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlState" CssClass="form-select" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col-md">
                <asp:Label ID="lblState" runat="server" CssClass="text-danger" Font-Size="X-Small"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvState1" runat="server" ErrorMessage="*First Select Country" ControlToValidate="ddlState" Font-Size="X-Small" ForeColor="#FF3300" InitialValue="" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvState2" runat="server" ErrorMessage="*Please Select the  State" ControlToValidate="ddlState" Font-Size="X-Small" ForeColor="#FF3300" InitialValue="-1" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

        </div>
        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px"><span style="color: red">*</span>City</div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlCity" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:Label ID="lblCity" runat="server" CssClass="text-danger" Font-Size="X-Small"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvCity1" runat="server" ErrorMessage="*First select the State" ControlToValidate="ddlCity" Font-Size="X-Small" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvCity2" runat="server" ErrorMessage="*Please Select the City" ControlToValidate="ddlCity" Font-Size="X-Small" ForeColor="#FF3300" InitialValue="-1" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

        </div>
        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px"><span style="color: red">*</span>Contact Category</div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlContactCategory" CssClass="form-select" runat="server"></asp:DropDownList>
            </div>
            <div class="col-md-3">
                <asp:Label ID="lblContactCategory" runat="server" CssClass="text-danger" Font-Size="X-Small"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvContactCategory" runat="server" ErrorMessage="*Please Select the ContactCategory" ControlToValidate="ddlContactCategory" Font-Size="X-Small" ForeColor="#FF3300" InitialValue="-1" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>

        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px"><span style="color: red">*</span>Contact Name</div>
            <div class="col-md-3">
                <asp:TextBox ID="txtContactName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:Label ID="lblContactName" runat="server" CssClass="text-danger" Font-Size="X-Small"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvContactName" runat="server" ErrorMessage="*Please enter the Name" ControlToValidate="txtContactName" Font-Size="X-Small" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

        </div>
        <br />


        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px"><span style="color: red">*</span>Contact No</div>
            <div class="col-md-3">
                <asp:TextBox ID="txtContactNo" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:Label ID="lblContactNo" runat="server" CssClass="text-danger" Font-Size="X-Small"></asp:Label>
                <asp:RegularExpressionValidator ID="revContactNo" runat="server" ErrorMessage="*Please enter the valid number" ControlToValidate="txtContactNo" ValidationExpression="^([1-9]{1})([234789]{1})([0-9]{8})$" Display="Dynamic" Font-Size="X-Small" ForeColor="Red"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfvContactNo" runat="server" ErrorMessage="*Please enter the Contact No" ControlToValidate="txtContactNo" Font-Size="X-Small" ForeColor="#FF3300" ValidationExpression="^([1-9]{1})([234789]{1})([0-9]{8})$" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

        </div>
        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px">Whatsapp No</div>
            <div class="col-md-3">
                <asp:TextBox ID="txtWhatsappNo" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

        </div>
        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px">Birth Date</div>
            <div class="col-md-3">
                <asp:TextBox ID="txtBirthDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                <asp:CompareValidator ID="cvBirthDate" runat="server" ControlToValidate="txtBirthDate" ErrorMessage="*Please enter the vailidate BirthDate" Operator="DataTypeCheck" Type="Date" Font-Size="X-Small" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
            </div>
        </div>
        <br />

        <div class="row">

            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px"><span style="color: red">*</span>Email</div>
            <div class="col-md-3">
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:Label ID="lblEmail" runat="server" CssClass="text-danger" Font-Size="X-Small"></asp:Label>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="*Please enter the valid email" ControlToValidate="txtEmail" Font-Size="X-Small" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="*Please enter the Email" ControlToValidate="txtEmail" Font-Size="X-Small" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

        </div>


        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px">Age</div>
            <div class="col-md-3">
                <asp:TextBox ID="txtAge" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px"><span style="color: red">*</span>Address</div>
            <div class="col-md-3">
                <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:Label ID="lblAddress" runat="server" CssClass="text-danger" Font-Size="X-Small"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="*Please enter  your address" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px">Blood Group</div>
            <div class="col-md-3">
                <asp:TextBox ID="txtBloodGroup" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px">Facebook ID</div>
            <div class="col-md-3">
                <asp:TextBox ID="txtFacebook" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px">LinkedIn ID</div>
            <div class="col-md-3">
                <asp:TextBox ID="txtLinkedIN" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; padding-top: 5px">Enter Document</div>
            <div class="col-md-3">
                <asp:FileUpload runat="server" ID="fuFile" CssClass="form-control" />
            </div>
             </div>     

            <br/>
            <asp:Panel runat="server" VerticalAlign="center">
            <div class="row">
            <div class="col-md-2 offset-4" style="font-weight: 500; vertical-align:middle">Old Document</div>
            <div class="col-md-3">
                    <asp:Image runat="server" ID="imgImage" Height="100" CssClass="img-fluid me-4" AlternateText="Not available old document" ImageUrl='<%# Eval("FilePath") %>' />
                </div>
            </div>
                </asp:Panel>

            <div class="row">
                <div class="col-md text-success text-center">
                    <asp:Label runat="server" ID="lblMessage" EnableViewState="true"></asp:Label>
                </div>

            </div>

            <hr />

            <div class="row">
                <div class="offset-4" style="padding-left: 132px">
                    <asp:Button runat="server" Text="Save" ID="btnSave" CssClass="btn btn-outline-success" OnClick="btnSave_Click" Width="85px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink runat="server" NavigateUrl="~/MultiUser AddressBook/AdminPanel/Contact/Contact.aspx" Text="Cancel" ID="hlCancel" CssClass="btn btn-outline-danger" Width="85px" />
                </div>

            </div>

            <br />
       
    </div>
       
</asp:Content>
