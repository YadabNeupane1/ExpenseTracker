<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="LoginSignup_ChangePassword1" %>

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
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-page1">
      <div class="container d-flex align-items-center">
         <div class="form-holder has-shadow">
                    <div class="form" style="width: 600px; margin-left: 300px;">
                        <h1>Account Recovery</h1>
                        <div style="height: 20px;"></div>
                        <div class="row">
                            <div class="col">
                                <asp:TextBox ID="txtUserName" Enabled="false" runat="server" CssClass="input-material"></asp:TextBox>
                                <label for="login-username" class="label-material">Username</label>
                            </div>                            
                        </div>
                        <div style="height: 40px;"></div>
                        <div class="row">
                            <div class="col">
                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="input-material" TextMode="Password"></asp:TextBox>
                                <label for="login-username" class="label-material">Password</label>
                            </div>
                        </div>
                        <div style="height: 40px;"></div>
                        <div class="row">
                            <div class="col">
                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="input-material" TextMode="Password"></asp:TextBox>
                                <label for="login-username" class="label-material">Re-Password</label>
                            </div>
                        </div>
                        <div style="height: 50px;"></div>
                        <div class="row">
                            <div class="col-md-3 offset-md-9">
                                <asp:Button ID="btnConfirm" OnClick="btnConfirm_Click" runat="server" CssClass="btn btn-primary" Text="Confirm" />
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