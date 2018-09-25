<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="LoginSignup_Signup1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Bootstrap CSS-->
    <link href="../DashBoardStyle/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome CSS-->
    <link href="../DashBoardStyle/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom Font Icons CSS-->
    <link href="../DashBoardStyle/css/font.css" rel="stylesheet" />
    <!-- Google fonts - Muli-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,700">
    <!-- theme stylesheet-->
    <link href="../DashBoardStyle/css/style.blue.css" rel="stylesheet" />
    <%--<link href="../DashBoardStyle/css/style.default.css" rel="stylesheet" />--%>
    <%--<link href="../DashBoardStyle/css/style.violet.css" rel="stylesheet" />--%>
    <%--<link href="../DashBoardStyle/css/style.sea.css" rel="stylesheet" />--%>
    <%--<link href="../DashBoardStyle/css/style.green.css" rel="stylesheet" />--%>
    <!-- Custom stylesheet - for your changes-->
    <link href="../DashBoardStyle/css/custom.css" rel="stylesheet" />
    <!-- Favicon-->
    <link rel="shortcut icon" href="../DashBoardStyle/img/favicon.ico" />
    <script>
        function onlyNumbers(event) {
            var charCode = (event.which) ? event.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-page">
            <div class="container d-flex align-items-center">
                <div class="form-holder has-shadow">
                    <div class="form" style="width: 600px; margin-left: 300px;">
                        <h1>Sign Up</h1>
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
                                <asp:RegularExpressionValidator ControlToValidate="txtEmail" ID="RegularExpressionValidator1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ErrorMessage="invalid email" Style="margin-top: 5px; color: red;" ValidationGroup="a"></asp:RegularExpressionValidator>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-material"></asp:TextBox>
                                <label for="login-username" class="label-material">Email</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="input-material"></asp:TextBox>
                                <label for="login-username" class="label-material">Address</label>
                                <%--<script>
                                    var input = document.getElementById('txtAddress');
                                    var autocomplete = new google.maps.places.Autocomplete(input);
                                </script>--%>
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
                                <asp:CompareValidator ValidationGroup="a" ForeColor="Red" ID="CompareValidator1" runat="server" ErrorMessage="Password mismatch" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
                            </div>
                        </div>
                        <div style="height: 15px;"></div>
                        <div class="row">
                            <div class="col-md-3 offset-md-9">
                                <asp:Button ID="btnCreateAccount" OnClick="btnSignup_Click" ValidationGroup="a" runat="server" CssClass="btn btn-primary" Text="Register" />
                            </div>
                        </div>
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
    </form>
</body>
</html>
