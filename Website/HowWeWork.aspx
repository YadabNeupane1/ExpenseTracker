<%@ Page Title="" Language="C#" MasterPageFile="~/Website/MasterPage.master" AutoEventWireup="true" CodeFile="HowWeWork.aspx.cs" Inherits="Website_HowWeWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .wrapper {
            margin: 30px 100px;
        }

        .card {
            /*border:5px solid black;*/
            opacity: 0.9;
        }
        .color{
            background-color:#3fdad8;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 100px;"></div>
    <div class="wrapper">
        <div class="row">
            <div class="row text-center">
                <h2>Categorize your expenses
                </h2>
            </div>
            <div class="row card text-center">
                <asp:Image ID="Image1" runat="server" ImageUrl="Assets/images/how-works-1.png" />
            </div>
            <div style="height: 30px;"></div>
            <div class="row text-center">
                <p>
                    Organize your expenses by categorizing according to your choice. 
                <br />
                    You can add category any time you want.
                </p>
            </div>
        </div>
        <div style="height:40px;"></div>
        <div class="row">
            <div class="row text-center">
                <h2>Generate Report
                </h2>
            </div>
            <div class="row card text-center">
                <asp:Image ID="Image2" runat="server" ImageUrl="Assets/images/how-works-2.jpg" />
            </div>
            <div style="height: 30px;"></div>
            <div class="row text-center">
                <p class="text-center">
                    Prepare reports of your spending so
                    <br />
                    that you know at exactly what category you spent what percentage of your budget.
                <br />
                    You can add category any time you want.
                </p>
            </div>
        </div>
        <div style="height:40px;"></div>
        <div class="row">
            <div class="row text-center">
                <h2>Visualize
                </h2>
            </div>
            <div class="row card text-center">
                <asp:Image ID="Image3" runat="server" ImageUrl="Assets/images/how-works-3.png" />
            </div>
            <div style="height: 30px;"></div>
            <div class="row text-center">
                <p class="text-center">
                    Charts give us better understanding of our financial position.<br />
                    Prepare charts of your spending so
                    <br />
                    that you know at exactly what category you spent what percentage of your budget.
                <br />                   
                </p>
            </div>
        </div>
    </div>
</asp:Content>

