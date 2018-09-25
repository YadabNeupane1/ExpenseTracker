<%@ Page Title="" Language="C#" MasterPageFile="~/Website/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Website_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .wrapper {
            margin: 30px 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height:100px;"></div>
    <div class="wrapper">
        <div class="row">
            <div class="col-md-10">
                <div class="row">
                    <h2>Contact Us</h2>
                </div>
                <div class="row">
                    <p>
                        We are happy to answer any questions you have or provide you with an estimate. Just send
                    us a message in the form below with any questions you may have.
                    </p>
                </div>
                <div class="row">
                    <br /><asp:Label ID="Label1" runat="server" Text="Your Name"></asp:Label><br />
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="row">
                    <br /><asp:Label ID="Label2"  runat="server" Text="Your Email"></asp:Label><br />
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="row">
                    <br /><asp:Label ID="Label3"  runat="server" Text="Subject"></asp:Label><br />
                    <asp:TextBox ID="txtSubject" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="row">
                    <br /><asp:Label ID="Label4"  runat="server" Text="Your Message"></asp:Label><br />
                    <asp:TextBox ID="txtMessage" CssClass="form-control" TextMode="MultiLine" Height="200" runat="server"></asp:TextBox>
                </div><br />
                <div class="row">
                    <asp:Button ID="btnSend" CssClass="btn btn-info" runat="server" OnClick="btnSend_Click" Text="Send" />
                </div>
            </div>
            <div class="col">
            </div>
        </div>
    </div>
</asp:Content>

