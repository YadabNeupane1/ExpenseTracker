<%@ Page Title="" Language="C#" MasterPageFile="~/DashBoard/MasterDashboard.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="DashBoard_Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .sort1 {
            //width: 100%;
            display: flex;
            justify-content: flex-end;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdateGridView" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div>
                <p style="margin: 10px 15px">
                    <a href="Dashboard.aspx">Dashboard </a> / Report 
                </p>
            </div>
            <div class="col-lg-12">
                <div class="block">
                    <div class="row">
                        <div class="col-sm-1">
                            <asp:Label ID="Label1" runat="server" CssClass="form-control-label" Text="From"></asp:Label>
                            <asp:HiddenField ID="hdFrom" runat="server" />
                        </div>
                        <div class="col-3">
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox onkeypress="return onlyDate(event)" ID="txtfrom" runat="server" CssClass="form-control"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="txtfrom_CalendarExtender" runat="server" TargetControlID="txtfrom" />
                                    <div class="input-group-append"><span class="input-group-text"><i class="fa fa-calendar"></i></span></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-1">
                            <asp:Label ID="Label2" runat="server" CssClass="form-control-label" Text="To"></asp:Label>
                            <asp:HiddenField ID="hdTo" runat="server" />
                        </div>
                        <div class="col-3">
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox onkeypress="return onlyDate(event)" ID="txtto" CssClass="form-control" runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="txtto_CalendarExtender" runat="server" TargetControlID="txtto" />
                                    <div class="input-group-append"><span class="input-group-text"><i class="fa fa-calendar"></i></span></div>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <asp:Button ID="btnGenerate" CssClass="btn btn-primary" runat="server" Text="Generate" OnClick="btnGenerate_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="block">
                    <div class="row" id="SSrow" runat="server">
                        <div class="col">
                            <div class="row">
                                <div class="col-sm-1">Search by</div>
                                <div class="col-3">
                                    <asp:DropDownList ID="ddlSearch" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Search By</asp:ListItem>
                                        <asp:ListItem Value="1">Name</asp:ListItem>
                                        <asp:ListItem Value="2">Category</asp:ListItem>
                                        <asp:ListItem Value="3">Amount</asp:ListItem>
                                        <asp:ListItem Value="4">Description</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-1">
                                    <asp:Label ID="lblSearch" runat="server" Text="Search" CssClass="col-form-label"></asp:Label>
                                </div>
                                <div class="col-3">
                                    <asp:TextBox ID="txtSearch" placeHolder="Keyword" CssClass="form-control" runat="server"></asp:TextBox>                                    
                                </div>
                                <div class="col-3">
                                    <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" CssClass="btn btn-info" Text="Search" />
                                </div>
                                <div class="col sort1">
                                    <asp:DropDownList ID="ddlSort" Width="150px" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
                                        <asp:ListItem Value="0">Sort By</asp:ListItem>
                                        <asp:ListItem Value="1">Name</asp:ListItem>
                                        <asp:ListItem Value="2">Date</asp:ListItem>
                                        <asp:ListItem Value="3">Amount ASC</asp:ListItem>
                                        <asp:ListItem Value="4">Amount DESC</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="height:20px;"></div>
                    <asp:Label ID="lblEmpty" runat="server" Text="No Data Found" Font-Bold="true" CssClass="align-content-center" Visible="false"></asp:Label>
                    <div style="height:20px;"></div>
                    <asp:GridView ID="gridReport" BorderWidth="0"
                        CssClass="table table-hover table-responsive-md table-fixed"
                        OnRowDataBound="gridReport_RowDataBound"
                        runat="server" AutoGenerateColumns="False" ShowFooter="true"
                        DataKeyNames="expenseId" EmptyDataText="No Data Found">
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <%#Eval("expenseId") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex +1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <%#Eval("expenseCatname") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <%#Eval("expenseName") %>
                                </ItemTemplate>
                                <FooterTemplate>
                                    Total Expense
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date Added">
                                <ItemTemplate>
                                    <%#Eval("expenseDate","{0:d}")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount">
                                <ItemTemplate>
                                    <%#Eval("expenseAmount")%>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblTotalExpense" runat="server" Text=""></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <%#Eval("expenseDescription")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

