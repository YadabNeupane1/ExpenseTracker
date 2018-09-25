<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="LoginSignup_Signin" %>

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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,700" />
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
</head>
<body>
    <form id="form1" runat="server">

        <div class="login-page">
            <div class="container d-flex align-items-center">
                <div class="form-holder has-shadow">
                    <div class="row">
                        <!-- Logo & Information Panel-->
                        <div class="col-lg-6">
                            <div class="info d-flex align-items-center">
                                <div class="content">
                                    <div class="logo">
                                        <h1><a href="../Website/Home.aspx"><strong style="color:white;">Expense Tracking System</strong></a></h1>
                                    </div>
                                    <p><%--text--%></p>
                                </div>
                            </div>
                        </div>
                        <!-- Form Panel    -->
                        <div class="col-lg-6 bg-white">
                            <div class="form d-flex align-items-center">
                                <div class="content">
                                    <div class="form-validate">
                                        <div class="form-group">
                                            <asp:RequiredFieldValidator ControlToValidate="txtUserName" ValidationGroup="a" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtUserName" AutoComplete="False" runat="server" CssClass="input-material"></asp:TextBox>
                                            <label for="login-username" class="label-material">User Name</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:RequiredFieldValidator ControlToValidate="txtPassword" ValidationGroup="a" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="input-material"></asp:TextBox>
                                            <label for="login-password" class="label-material">Password</label>
                                        </div>
                                        <asp:Button ID="btnLogin" ValidationGroup="a" runat="server" OnClick="btnLogin_Click" Text="Login" CssClass="btn btn-primary" />
                                        <!-- This should be submit button but I replaced it with <a> for demo purposes-->
                                    </div><br />
                                    <a href="AccountRecovery.aspx" class="forgot-pass">Forgot Password?</a><br />
                                    <small>Do not have an account? </small>
                                    <a href="Signup.aspx" class="signup">Signup</a>
                                </div>
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
