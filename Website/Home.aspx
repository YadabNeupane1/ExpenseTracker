<%@ Page Title="" Language="C#" MasterPageFile="~/Website/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Website_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .headertext {
            font-family: Roboto;
            text-align: right;
            margin-top: 100px;
        }

        .headersubtext {
            font-family: Roboto;
            text-align: center;
            margin-left: 140px;
        }

        #gtco-products {
            height: 600px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="gtco-features" style="height: 70px">
        </div>

        <div id="gtco-products">
            <div class="gtco-container">
                <div class="row">
                    <div class="col-md-6">
                        <asp:Image ID="Image1" ImageUrl="../Website/Assets/images/header.png" runat="server" />
                    </div>
                    <div class="col-md-6">
                        <h2 class="headertext">Total Control of Your Expenses                            
                        </h2>
                        <p class="headersubtext">
                            Stop wondering, Manage Effortlessly<br />
                            And<br />
                            Save Money<br />
                            <br />
                            <asp:Button ID="btnSignup" CssClass="btn btn-primary" runat="server" Text="Sign Up" OnClick="btnSignup_Click" />
                        </p>
                    </div>
                </div>
            </div>

        </div>
        <div class="gtco-section">
        </div>
        <div id="gtco-features-3">
            <div class="gtco-container">
                <div class="gtco-flex">
                    <div class="feature feature-1 animate-box" data-animate-effect="fadeInUp">
                        <div class="feature-inner">
                            <span class="icon">
                                <i class="ti-clipboard"></i>
                            </span>
                            <h3>Stay on top of
                                <br />
                                your Expenses</h3>
                            <p>
                                Your expenses incomes are in 
                                one place and easier to track
                            </p>
                            <p>
                                <asp:Image ID="Image3" runat="server" ImageUrl="../Website/Assets/images/checklist.png" />
                            </p>
                        </div>
                    </div>
                    <div class="feature feature-2 animate-box" data-animate-effect="fadeInUp">
                        <div class="feature-inner">
                            <span class="icon">
                                <i class="ti-lock"></i>
                            </span>
                            <h3>Simple and Secure</h3>
                            <p>
                                Set up your free account in seconds.
                                We keep your personal information safe
                            </p>
                            <p>
                                <asp:Image ID="Image2" runat="server" ImageUrl="../Website/Assets/images/lock.png" />
                            </p>
                        </div>
                    </div>
                    <div class="feature feature-3 animate-box" data-animate-effect="fadeInUp">
                        <div class="feature-inner">
                            <span class="icon">
                                <i class="ti-receipt"></i>
                            </span>
                            <h3>Generate</h3>
                            <p>Generate reports of your expenses. </p>
                            <p>
                                <asp:Image ID="Image4" runat="server" ImageUrl="../Website/Assets/images/report.png" />
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="gtco-portfolio" class="gtco-section">
            <div class="gtco-container">
                <div class="row">
                    <div class="col-md-6">
                        <asp:Image ID="Image5" runat="server" ImageUrl="../Website/Assets/images/interface.png"  />
                    </div>
                    <div class="col-md-6">
                        <h2>Attractive Interface</h2>
                        <p></p>
                   
                    </div>
                </div>
                <div style="height:40px;"></div>
                <div class="row">                   
                    <div class="col-md-6">
                        <h2>Graphical Statistics</h2>
                        <p></p>
                   
                    </div>
                    <div class="col-md-6">
                        <asp:Image ID="Image6" runat="server" ImageUrl="../Website/Assets/images/interface.png"  />
                    </div>
                </div>
                <%--<div class="row">
                    <div class="col-md-8 col-md-offset-2 text-center gtco-heading animate-box">
                        <h2>Our Latest Works</h2>
                        <p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
                    </div>
                </div>

                <div class="row row-pb-md">
                    <div class="col-md-12">
                        <ul id="gtco-portfolio-list">
                            <li class="two-third animate-box" data-animate-effect="fadeIn" style="background-image: url(images/img_1.jpg);">
                                <a href="#" class="color-1">
                                    <div class="case-studies-summary">
                                        <span>Web Design</span>
                                        <h2>View the Earth from the Outer Space</h2>
                                    </div>
                                </a>
                            </li>
                            <li class="one-third animate-box" data-animate-effect="fadeIn" style="background-image: url(images/img_2.jpg);">
                                <a href="#" class="color-2">
                                    <div class="case-studies-summary">
                                        <span>Illustration</span>
                                        <h2>Sleeping in the Cold Blue Water</h2>
                                    </div>
                                </a>
                            </li>


                            <li class="one-half animate-box" data-animate-effect="fadeIn" style="background-image: url(images/img_3.jpg);">
                                <a href="#" class="color-3">
                                    <div class="case-studies-summary">
                                        <span>Illustration</span>
                                        <h2>Building Builded by Man</h2>
                                    </div>
                                </a>
                            </li>
                            <li class="one-half animate-box" data-animate-effect="fadeIn" style="background-image: url(images/img_4.jpg);">
                                <a href="#" class="color-4">
                                    <div class="case-studies-summary">
                                        <span>Web Design</span>
                                        <h2>The Peaceful Place On Earth</h2>
                                    </div>
                                </a>
                            </li>

                            <li class="one-third animate-box" data-animate-effect="fadeIn" style="background-image: url(images/img_5.jpg);">
                                <a href="#" class="color-5">
                                    <div class="case-studies-summary">
                                        <span>Web Design</span>
                                        <h2>I'm Getting Married</h2>
                                    </div>
                                </a>
                            </li>
                            <li class="two-third animate-box" data-animate-effect="fadeIn" style="background-image: url(images/img_6.jpg);">
                                <a href="#" class="color-6">
                                    <div class="case-studies-summary">
                                        <span>Illustration</span>
                                        <h2>Beautiful Flowers In The Air</h2>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-4 text-center animate-box">
                        <a href="#" class="btn btn-white btn-outline btn-lg btn-block">See All Our Works</a>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
</asp:Content>
