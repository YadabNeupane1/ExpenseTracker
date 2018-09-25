<%@ Page Title="" Language="C#" MasterPageFile="~/DashBoard/MasterDashboard.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="DashBoard_Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../DashBoardStyle/vendor/chart.js/Chart.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p style="margin: 10px 15px; color: #40d0dd">
            Dashboard 
        </p>
    </div>
    <section class="no-padding-top no-padding-bottom">
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <div class="statistic-block block">
                        <div class="progress-details d-flex align-items-end justify-content-between">
                            <div class="title">
                                <div class="icon">
                                    <asp:Image ID="imgIncome" ImageUrl="../DashBoardStyle/img/MoneyIN.png" CssClass="img-fluid rounded-circle" runat="server" />
                                </div>
                                <strong style="color: #3C7A89">Incomes</strong>
                            </div>
                            <div class="number dashtext-1">
                                <asp:Label ID="lblIncomeAmount" runat="server" Text="" Font-Size="28px"></asp:Label>
                            </div>
                        </div>
                        <%--<div class="progress progress-template">
                            <div role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template dashbg-1"></div>
                        </div>--%>
                    </div>
                </div>
                <div class="col">
                    <div class="statistic-block block">
                        <div class="progress-details d-flex align-items-end justify-content-between">
                            <div class="title">
                                <div class="icon">
                                    <asp:Image ID="Image1" ImageUrl="../DashBoardStyle/img/MoneyOUT.png" runat="server" />
                                </div>
                                <strong style="color: #c0504e">Expenses</strong>
                            </div>
                            <div class="number dashtext-2">
                                <asp:Label ID="lblExpenseAmount" runat="server" Text="" Font-Size="28px"></asp:Label>
                            </div>
                        </div>
                        <%--<div class="progress progress-template">
                            <div role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template dashbg-2"></div>
                        </div>--%>
                    </div>
                </div>
                <div class="col">
                    <div class="statistic-block block">
                        <div class="progress-details d-flex align-items-end justify-content-between">
                            <div class="title">
                                <div class="icon">
                                    <asp:Image ID="Image2" ImageUrl="../DashBoardStyle/img/Money.png" runat="server" />
                                </div>
                                <strong style="color: #41c572;">Balance</strong>
                            </div>
                            <div class="number dashtext-3">
                                <asp:Label ID="lblBalanceAmount" runat="server" Text="" Font-Size="28px"></asp:Label>
                            </div>
                        </div>
                        <%--<div class="progress progress-template">
                            <div role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar-template dashbg-3"></div>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="col-lg-12">
        <div class="block">
            <%--<div class="row">
                <div class="col">
                    <div class="bar-chart block chart">
                        <div class="title"><strong>Income Graph</strong></div>
                        <div class="bar-chart chart">
                            <asp:Chart ID="barChartCustom3" BackColor="34, 37, 42" runat="server" DataSourceID="SqlDataSource1">
                                <Series>
                                    <asp:Series Name="Series1" XValueMember="incomeDate" YValueMembers="incomeAmount"></asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BackColor="#22252a"></asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ExpenseSystemConnectionString %>' SelectCommand="SELECT etsIncome.incomeAmount, etsIncome.incomeDate, etsExpense.expenseAmount, etsExpense.expenseDate FROM etsIncome CROSS JOIN etsExpense"></asp:SqlDataSource>
                        </div>

                    </div>
                </div>
                <div class="col">
                    <div class="bar-chart block chart">
                        <div class="title"><strong>Expense Graph</strong></div>
                        <div class="bar-chart chart">
                            <asp:Chart ID="Chart1" BackColor="#22252a" runat="server" DataSourceID="SqlDataSource1">
                                <Series>
                                    <asp:Series Name="Series1" XValueMember="expenseDate" YValueMembers="expenseAmount"></asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BackColor="#22252a"></asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ExpenseSystemConnectionString %>' SelectCommand="SELECT * FROM [etsExpense]"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>--%>
            <div class="row">
                <div class="col-lg-6">
                    <div class="pie-chart chart block">
                        <div class="title"><strong>Bar Chart</strong></div>
                        <div class="pie-chart chart margin-bottom-sm">
                            <canvas id="barChart"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="doughnut-chart chart block">
                        <div class="title"><strong>Pie Chart</strong></div>
                        <div class="doughnut-chart chart margin-bottom-sm">
                            <canvas id="pieChart"></canvas>
                        </div>
                    </div>
                </div>
                <%--<div class="col">
                    <canvas id="barChart" class="chartjs-render-monitor" height="300" width="449"></canvas>
                </div>
                <div class="col">
                    <canvas id="pieChart" height="300" width="449">

                    </canvas>
                </div>--%>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="line-chart block chart">
                        <div class="title"><strong>Line Chart</strong></div>
                        <canvas id="lineChart"></canvas>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="polar-chart chart block">
                        <div class="title"><strong>Polar Chart</strong></div>
                        <div class="polar-chart chart margin-bottom-sm">
                            <canvas id="polarChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        var inc = document.getElementById('<%=lblIncomeAmount.ClientID%>').innerText;
        inc = parseInt(inc.replace('Rs. ', ''));
        var exp = document.getElementById('<%=lblExpenseAmount.ClientID%>').innerText;
        exp = parseInt(exp.replace('Rs. ', ''));
        var bal = document.getElementById('<%=lblBalanceAmount.ClientID%>').innerText;
        bal = parseInt(bal.replace('Rs. ', ''));

        var barChart = document.getElementById('barChart').getContext('2d');
        var bar = new Chart(barChart, {
            type: 'bar',
            options: {
                scales: {
                    xAxes: [{
                        display: true,
                        gridLines: {
                            color: 'transparent'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        gridLines: {
                            color: 'transparent'
                        }
                    }]
                },
            },
            data: {
                labels: ["Income", "Expense", "Balance"],
                datasets: [
                    {
                        label: "Amount",
                        backgroundColor: [
                            "#26a2ed",
                            "#c0504e",
                            "#41c572"
                        ],
                        hoverBackgroundColor: [
                            "#864DD9",
                            "#864DD9",
                            "#864DD9"
                        ],
                        borderColor: [
                            "#fff",
                            "#fff",
                            "#fff"
                        ],
                        borderWidth: 0.8,
                        data: [inc, exp, bal],
                    }

                ]
            }
        });

        var pieChart = document.getElementById('pieChart').getContext('2d');
        var myDoughnutChart = new Chart(pieChart, {
            type: 'doughnut',
            options: {
                cutoutPercentage: 50,
                legend: {
                    display: true,
                    position: "left"
                }
            },
            data: {
                labels: [
                    "Income",
                    "Expense",
                    "Balance"
                ],
                datasets: [
                    {
                        data: [inc, exp, bal],
                        borderWidth: [0, 0, 0, 0],
                        backgroundColor: [
                            "#26a2ed",
                            "#c0504e",
                            "#41c572"
                        ],
                        hoverBackgroundColor: [
                            '#b53dde',
                            "#CF53F9",
                            "#d06cf2"
                        ],
                        borderColor: [
                            "#fff",
                            "#fff",
                            "#fff"
                        ],
                        borderWidth: 0.8,
                    }]
            }
        });

        var lineChart = document.getElementById('lineChart').getContext('2d');
        var lineChartExample = new Chart(lineChart, {
            type: 'line',
            options: {
                legend: { labels: { fontColor: "#777", fontSize: 12 } },
                scales: {
                    xAxes: [{
                        display: false,
                        gridLines: {
                            color: 'transparent'
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            max: 80,
                            min: 0
                        },
                        display: true,
                        gridLines: {
                            color: 'transparent'
                        }
                    }]
                },
            },
            data: {
                labels: ["Expense", "Income", "Balance"],
                datasets: [
                    {
                        label: "Data / 1000",
                        fill: true,
                        lineTension: 0,
                        backgroundColor: "#26a2ed",
                        borderColor: "rgba(134, 77, 217, 088)",
                        borderCapStyle: 'butt',
                        borderDash: [],
                        borderDashOffset: 0.0,
                        borderJoinStyle: 'miter',
                        borderWidth: 1,
                        pointBorderColor: "rgba(134, 77, 217, 0.88)",
                        pointBackgroundColor: "#fff",
                        pointBorderWidth: 1,
                        pointHoverRadius: 5,
                        pointHoverBackgroundColor: "rgba(134, 77, 217, 0.88)",
                        pointHoverBorderColor: "rgba(134, 77, 217, 0.88)",
                        pointHoverBorderWidth: 2,
                        pointRadius: 1,
                        pointHitRadius: 10,
                        data: [exp / 1000, inc / 1000, bal / 1000],
                        spanGaps: false
                    }
                ]
            }
        });

        // ------------------------------------------------------- //
        // Polar Chart
        // ------------------------------------------------------ //
        var chartOptions = {
            scale: {
                gridLines: {
                    color: '#3f414'
                },
                ticks: {
                    beginAtZero: true,
                    min: 0,
                    max: 1000,
                    stepSize: 200
                },
                pointLabels: {
                    fontSize: 12
                }
            },
            legend: {
                position: 'left'
            },
            elements: {
                arc: {
                    borderWidth: 0,
                    borderColor: 'transparent'
                }
            }
        };
        var POLARCHARTEXMPLE = document.getElementById('polarChart').getContext('2d');
        var polarChartExample = new Chart(POLARCHARTEXMPLE, {
            type: 'polarArea',
            options: chartOptions,
            data: {
                datasets: [{
                    data: [inc / 100, exp / 100, bal / 100],
                    backgroundColor: [
                        "#26a2ed",
                            "#c0504e",
                            "#41c572"
                    ],
                    label: 'Data / 500' // for legend
                }],
                labels: [
                    "Income",
                    "Expense",
                    "Balance"
                ]
            }
        });

        var polarChartExample = {
            responsive: true
        };
    </script>
</asp:Content>
