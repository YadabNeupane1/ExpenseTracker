<%@ Page Title="" Language="C#" MasterPageFile="~/DashBoard/MasterDashboard.master" AutoEventWireup="true" CodeFile="Analysis.aspx.cs" Inherits="DashBoard_Analysis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .mar {
            margin-left: 5px;
        }

        .fontself {
            font: bold 25px Times New Roman, serif;
        }

        .middletext {
            font-size: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p style="margin: 10px 15px;">
            <a href="Dashboard.aspx">Dashboard </a>&nbsp/ Analysis
        </p>
    </div>
    <section class="no-padding-bottom">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="user-block block text-center">
                        <h3 class="h3">
                            <asp:Label ID="label3" CssClass="title" runat="server"></asp:Label></h3>
                        <div class="contributions">
                            <p class="h3">
                                <asp:Label ID="lblMonthlyIncome" ForeColor="#3C7A89" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div class="details d-flex">
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="user-block block text-center">
                        <h3 class="h3">
                            <asp:Label CssClass="title" ID="label2" runat="server"></asp:Label></h3>
                        <div class="contributions">
                            <p class="h3">
                                <asp:Label ID="lblMonthlyExpense" ForeColor="#c0504e" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div class="details d-flex">
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="user-block block text-center">
                        <h3 class="h3">
                            <asp:Label CssClass="title" ID="label" runat="server"></asp:Label></h3>
                        <div class="contributions">
                            <p class="h3">
                                <asp:Label ForeColor="#41c572" ID="lblMonthlySaving" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div class="details d-flex">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="no-padding-bottom">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6">
                    <div class="messages-block block">
                        <div class="title"><strong>Previous months Expenses</strong></div>
                        <div class="messages">
                            <table class="table table-responsive-md">
                                <tr>
                                    <th>Month</th>
                                    <th>Expense</th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblM1" runat="server"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblE1" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblM2" runat="server"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblE2" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblM3" runat="server"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblE3" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblM4" runat="server"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblE4" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="messages-block block">
                        <div class="title"><strong>Predicted Expense</strong></div>
                        <div class="messages">
                            <table class="table table-responsive-md">
                                <tr>
                                    <th>Month</th>
                                    <th>Expense</th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblP1" runat="server"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblPE1" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

