<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style>
.container {
    position: absolute;
    width: 1350px;
    height:645px;
   
}

.container img {
    width: 100%;
    height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

.container .btn {
    position: absolute;
    top: 10%;
    left: 10%;
    transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    background-color: #f1f1f1;
    color: grey;
    font-size: 20px;
    padding: 16px 30px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    text-align: center;
}

.container .btn:hover {
    background-color: cadetblue;
    color: white;
}
</style>
    <title>Error</title>
</head>
<body>
    <div class="container">
  <img src="../DashBoardStyle/img/error404.png" alt="Snow" style="width:100%" />
  <a href="../Website/Home.aspx" class="btn">Home</a>
</div>

</body>
</html>