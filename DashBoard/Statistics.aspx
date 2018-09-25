<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/DashBoard/MasterDashboard.master" AutoEventWireup="true" CodeFile="Statistics.aspx.cs" Inherits="DashBoard_Statistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../DashBoardStyle/vendor/chart.js/Chart.js"></script>
    <script src="../DashBoardStyle/vendor/jquery/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p style="margin: 10px 15px;">
            <a href="Dashboard.aspx">Dashboard </a> / Statistics 
        </p>
    </div>
    <div class="col-lg">
        <div class="block">
            <div class="row">
                <div class="col-sm-1">
                    Year
                </div>
                <div class="col">
                    <asp:DropDownList ID="ddlYear" CssClass="form-control" runat="server">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem Value="15">2015</asp:ListItem>
                        <asp:ListItem Value="16">2016</asp:ListItem>
                        <asp:ListItem Value="17">2017</asp:ListItem>
                        <asp:ListItem Value="18">2018</asp:ListItem>
                        <asp:ListItem Value="19">2019</asp:ListItem>
                        <asp:ListItem Value="20">2020</asp:ListItem>
                        <asp:ListItem Value="21">2021</asp:ListItem>
                        <asp:ListItem Value="22">2022</asp:ListItem>
                        <asp:ListItem Value="23">2023</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-1">
                    Month
                </div>
                <div class="col">
                    <asp:DropDownList ID="ddlMonth" CssClass="form-control" runat="server">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem Value="1">January</asp:ListItem>
                        <asp:ListItem Value="2">February</asp:ListItem>
                        <asp:ListItem Value="3">March</asp:ListItem>
                        <asp:ListItem Value="4">April</asp:ListItem>
                        <asp:ListItem Value="5">May</asp:ListItem>
                        <asp:ListItem Value="6">June</asp:ListItem>
                        <asp:ListItem Value="7">July</asp:ListItem>
                        <asp:ListItem Value="8">August</asp:ListItem>
                        <asp:ListItem Value="9">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="11">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-1">
                    Day
                </div>
                <div class="col">
                    <asp:DropDownList ID="ddlDay" CssClass="form-control" runat="server">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem Value="1">01</asp:ListItem>
                        <asp:ListItem Value="2">02</asp:ListItem>
                        <asp:ListItem Value="3">03</asp:ListItem>
                        <asp:ListItem Value="4">04</asp:ListItem>
                        <asp:ListItem Value="5">05</asp:ListItem>
                        <asp:ListItem Value="6">06</asp:ListItem>
                        <asp:ListItem Value="7">07</asp:ListItem>
                        <asp:ListItem Value="8">08</asp:ListItem>
                        <asp:ListItem Value="9">09</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                        <asp:ListItem Value="13">13</asp:ListItem>
                        <asp:ListItem Value="14">14</asp:ListItem>
                        <asp:ListItem Value="15">15</asp:ListItem>
                        <asp:ListItem Value="16">16</asp:ListItem>
                        <asp:ListItem Value="17">17</asp:ListItem>
                        <asp:ListItem Value="18">18</asp:ListItem>
                        <asp:ListItem Value="19">19</asp:ListItem>
                        <asp:ListItem Value="20">20</asp:ListItem>
                        <asp:ListItem Value="21">21</asp:ListItem>
                        <asp:ListItem Value="22">22</asp:ListItem>
                        <asp:ListItem Value="23">23</asp:ListItem>
                        <asp:ListItem Value="24">24</asp:ListItem>
                        <asp:ListItem Value="25">25</asp:ListItem>
                        <asp:ListItem Value="26">26</asp:ListItem>
                        <asp:ListItem Value="27">27</asp:ListItem>
                        <asp:ListItem Value="28">28</asp:ListItem>
                        <asp:ListItem Value="29">29</asp:ListItem>
                        <asp:ListItem Value="30">30</asp:ListItem>                        
                    </asp:DropDownList>
                </div>
                <div class="col">
                    <asp:Button ID="btnShow" runat="server" Text="Show" CssClass="btn btn-secondary" OnClick="btnShow_Click" />
                </div>
            </div>
            <canvas id="barChart"></canvas>
            <canvas id="pieChart"></canvas>
            <canvas id="lineChart"></canvas>
        </div>
    </div>
    <script type="text/javascript">
        var jsonarray = new Array();
        var expensename = [];
        var expenseamount = [];
        var expensedate = [];
        var date;

        $.getJSON('../data.json', function (data) {
            jsonarray = data;

        }).then(function () {

            for (var i = 0; i < jsonarray.length; i++) {
                expenseamount[i] = +jsonarray[i].expenseAmount;
                expensename[i] = jsonarray[i].expenseName;
                date = eval(jsonarray[i].expenseDate.replace(/\/Date\((\d+)\)\//gi, "new Date($1)"));
                jsonarray[i].expenseDate = date;
                expensedate[i] = jsonarray[i].expenseDate;
            }

            //change date from json format to original
            //for (var i = 0; i < jsonarray.length; i++) {
            //    ((i) => {
                    //date = eval(jsonarray[i].expenseDate.replace(/\/Date\((\d+)\)\//gi, "new Date($1)"));
                    //jsonarray[i].expenseDate = date;
            //    })(i);
            //}

            var myChart = document.getElementById('barChart').getContext('2d');

            var chart = new Chart(myChart, {
                type: 'bar',
                data: {
                    labels: expensename,
                    datasets: [{
                        label: 'Amount',
                        data: expenseamount,
                        backgroundColor: poolColors(expenseamount.length)
                    }]
                },
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: 'Expense Bar Chart',
                        fontSize: 30
                    },
                    legend: {
                        display: true,
                        position: 'right',
                        labels: {
                            fonsSize: 50
                        }
                    }
                }
            });

            var dognutChart = document.getElementById('pieChart').getContext('2d');

            var chart2 = new Chart(dognutChart, {
                type: 'doughnut',
                data: {
                    labels: expensename,
                    datasets: [{
                        label: 'Amount',
                        data: expenseamount,
                        backgroundColor: poolColors(expenseamount.length)
                    }]
                },
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: 'Expense Doughnut Chart',
                        fontSize: 30
                    },
                    legend: {
                        display: true,
                        position: 'right',
                        labels: {
                            fonsSize: 50
                        }
                    }
                }
            });

            var mylineChart = document.getElementById('lineChart').getContext('2d');

            var chart = new Chart(mylineChart, {
                type: 'line',
                data: {
                    labels: expensename,
                    datasets: [{
                        label: 'Amount',
                        data: expenseamount,
                        backgroundColor: poolColors(expenseamount.length)
                    }]
                },
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: 'Expense Line Chart',
                        fontSize: 30
                    },
                    legend: {
                        display: true,
                        position: 'right',
                        labels: {
                            fonsSize: 50
                        }
                    }
                }
            });

        });


        function dynamicColors() {
            var r = Math.floor(Math.random() * 255);
            var g = Math.floor(Math.random() * 255);
            var b = Math.floor(Math.random() * 255);
            return "rgba(" + r + "," + g + "," + b + ", 0.5)";
        }
        function poolColors(a) {
            var pool = [];
            for (i = 0; i < a; i++) {
                pool.push(dynamicColors());
            }
            return pool;
        }

    </script>
</asp:Content>

