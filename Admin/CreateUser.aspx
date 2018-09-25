<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterAdmin.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="Admin_Admin" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
       <script>
        function onlyNumbers(event) {
            var charCode = (event.which) ? event.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdateGridView" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div>
                <p style="margin: 10px 15px">
                    <a href="Admin.aspx">Dashboard </a>/Create New User
                </p>
            </div>
           
            <div class="col-lg-12">
                <div class="block">
   
                       
      
            
                <div class="form-holder ">
                    <div class="form" style="width: 600px; margin-left: 300px;">
                        <h1>Create New User</h1>
                        <div style="height: 5px;"></div>
                        <div class="row">
                            <div class="col">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="txtFirstName" ValidationGroup="a"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-material"></asp:TextBox>                                
                                <label for="login-username" class="label-material">First Name</label>
                            </div>
                            <div class="col">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="txtLastName" ValidationGroup="a"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="input-material"></asp:TextBox>
                                <label for="login-username" class="label-material">Last Name</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="txtEmail" ValidationGroup="a"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ControlToValidate="txtEmail" ID="RegularExpressionValidator1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ErrorMessage="invalid email" Style="margin-top:5px;color:red;" ></asp:RegularExpressionValidator>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-material"></asp:TextBox>
                                <label for="login-username" class="label-material">Email</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="input-material" ></asp:TextBox>
                                <label for="login-username" class="label-material">Address</label>
                            </div>
                            <div class="col">
                                <asp:TextBox ID="txtPhone" MaxLength="10" onkeypress="return onlyNumbers(event)" runat="server" CssClass="input-material"></asp:TextBox>
                                <label for="login-username" class="label-material">Phone</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="txtUserName" ValidationGroup="a"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="input-material"></asp:TextBox>
                                <label for="login-username" class="label-material">Username</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="txtPassword" ValidationGroup="a"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtPassword" MinLength="6" TextMode="Password" runat="server" CssClass="input-material"></asp:TextBox>
                                <label for="login-username" class="label-material">Password</label>
                            </div>
                            <div class="col">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" runat="server" ErrorMessage="*" ControlToValidate="txtConfirmPassword" ValidationGroup="a"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" CssClass="input-material"></asp:TextBox>
                                <label for="login-username" class="label-material">Re-Password</label>
                            </div>
                        </div>
                        <div style="height: 15px;"></div>
                        <div class="row">
                            <div class="col-md-3 offset-md-9">
                                <asp:Button ID="btnCreateAccount"  OnClick="btnCreateAccount_Click" ValidationGroup="a" runat="server" CssClass="btn btn-primary" Text="Register" />
                            </div>
                        </div>
                    </div>
                </div>
          
        
        <!-- JavaScript files-->
        <script src="../DashBoardStyle/vendor/jquery/jquery.min.js"></script>
        <script src="../DashBoardStyle/vendor/popper.js/umd/popper.min.js"></script>
        <script src="../DashBoardStyle/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="../DashBoardStyle/vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="../DashBoardStyle/vendor/chart.js/Chart.min.js"></script>
        <script src="../DashBoardStyle/vendor/jquery-validation/jquery.validate.min.js"></script>
        <script src="../DashBoardStyle/js/front.js"></script>
    
                
            </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

