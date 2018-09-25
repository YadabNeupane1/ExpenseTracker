<%@ Page Title="" Language="C#" MasterPageFile="~/DashBoard/MasterDashboard.master" AutoEventWireup="true" CodeFile="Expenses.aspx.cs" Inherits="DashBoard_Expenses" EnableEventValidation="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .search1 {
            width: 100%;
            display: flex;
            justify-content: flex-end;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdateGridView" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div>
                <p style="margin: 10px 15px;">
                    <a href="Dashboard.aspx">Dashboard </a> / Expense / Add Expenses
                </p>
            </div>
            <div class="col-lg-12">
                <!--Accordion wrapper-->
                <div class="accordion" id="accordionEx" role="tablist" aria-multiselectable="true">

                    <!-- Accordion card -->
                    <div class="card">

                        <!-- Card header -->
                        <div class="card-header" role="tab" id="headingOne">
                            <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <h5 class="mb-0">Add Expenses <i class="fa fa-angle-down rotate-icon"></i>
                                </h5>
                            </a>
                        </div>

                        <!-- Card body -->
                        <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordionEx">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-1">
                                        <asp:Label runat="server" CssClass="form-control-label" Text="Category"></asp:Label>
                                    </div>
                                    <div class="col-3">
                                        <asp:DropDownList ID="ddlCateogory" CssClass="form-control" runat="server">
                                            <asp:ListItem>Choose</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1">
                                        <asp:Label runat="server" CssClass="form-control-label" Text="Name"></asp:Label>
                                    </div>
                                    <div class="col-3">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtName"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1">
                                        <asp:Label runat="server" onkeypress="return onlyDotsAndNumbers(event)" CssClass="form-control-label" Text="Amount"></asp:Label>
                                    </div>
                                    <div class="col-3">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAmount"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1">
                                        <asp:Label runat="server" CssClass="form-control-label" Text="Date"></asp:Label>
                                    </div>
                                    <div class="col-3">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" onkeypress="return onlyDate(event)" MaxLength="10" CssClass="form-control" ID="txtDate"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="txtDate_CalendarExtender" runat="server" TargetControlID="txtDate" />
                                                <div class="input-group-append"><span class="input-group-text"><i class="fa fa-calendar"></i></span></div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-1">
                                        <asp:Label runat="server" CssClass="form-control-label" Text="Description"></asp:Label>
                                    </div>
                                    <div class="col-7">
                                        <asp:TextBox Height="100px" ID="txtDescription" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-button">
                                        <asp:Button ID="btnAdd" CssClass="btn btn-primary" runat="server" Text="ADD" OnClick="btnAdd_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Accordion card -->
                </div>
                <!--/.Accordion wrapper-->
            </div>
            <%-- GridView  --%>
            <div class="col-lg-12">
                <div class="block">
                    <div class="row search1" id="sortRow" runat="server">
                        <div style="margin-right: 10px;">
                            <asp:DropDownList ID="ddlSort" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem Value="0">Sort By</asp:ListItem>
                                <asp:ListItem Value="1">Category</asp:ListItem>
                                <asp:ListItem Value="2">Name</asp:ListItem>
                                <asp:ListItem Value="3">Amount ASC</asp:ListItem>
                                <asp:ListItem Value="4">Amount DESC</asp:ListItem>
                                <asp:ListItem Value="5">Date</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div>
                            <asp:DropDownList ID="ddlColumns" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlColumns_SelectedIndexChanged">
                                <asp:ListItem Value="0">Show/Hide Columns</asp:ListItem>
                                <asp:ListItem Value="1">SN</asp:ListItem>
                                <asp:ListItem Value="2">Category</asp:ListItem>
                                <asp:ListItem Value="3">Name</asp:ListItem>
                                <asp:ListItem Value="4">Amount</asp:ListItem>
                                <asp:ListItem Value="5">Date Added</asp:ListItem>
                                <asp:ListItem Value="6">Description</asp:ListItem>
                                <asp:ListItem Value="7">Edit</asp:ListItem>
                                <asp:ListItem Value="8">Delete</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <asp:Label ID="lblEmpty" runat="server" Text="No Data Found"></asp:Label>
                    <asp:GridView ID="GridView1" BorderWidth="0"
                        CssClass="table table-hover table-responsive-md table-fixed"
                        runat="server" AutoGenerateColumns="False" AllowPaging="True"
                        OnPageIndexChanging="GridView1_PageIndexChanging"
                        DataKeyNames="expenseId" EmptyDataText="No Data Found">
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <%#Eval("expenseId") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
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
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount">
                                <ItemTemplate>
                                    <%#Eval("expenseAmount")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date Added">
                                <ItemTemplate>
                                    <%#Eval("expenseDate","{0:d}")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <%#Eval("expenseDescription")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibtnEdit" runat="server"
                                        ImageUrl="../DashBoardStyle/img/edit.png" OnClick="ibtnEdit_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibtnDelete" OnClientClick="return confirm('Do you want to Delete?')" OnClick="ibtnDelete_Click"
                                        ImageUrl="../DashBoardStyle/img/delete.png" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <ajaxToolkit:ModalPopupExtender ID="EditPopup" runat="server"
                TargetControlID="hfUserID"
                PopupControlID="pnlAddPopup"
                DropShadow="true"
                CancelControlID="imgClose"
                PopupDragHandleControlID="popupheader">
            </ajaxToolkit:ModalPopupExtender>
            <div class="panel1 panel1-primary" id="pnlAddPopup" runat="server" style="background-color: white; align-self: center;">
                <div class="panel1-heading" id="popupheader">
                    <h3 class="panel1-title">Panel title</h3>
                    <span style="float: right; margin-top: -30px;">
                        <asp:Image ID="imgClose" ImageUrl="../DashBoardStyle/img/btn-close.png" AlternateText="Close"
                            title="Close" runat="server" />
                    </span>
                </div>
                <div class="panel1-body">
                    <asp:HiddenField ID="hfUserID" runat="server" Value="0" />
                    <div class="row">
                        <div class="col-2">
                            <asp:Label runat="server" CssClass="form-control-label" Text="Category"></asp:Label>
                        </div>
                        <div class="col">
                            <asp:DropDownList ID="ddleditCategory" CssClass="form-control" runat="server">
                                <asp:ListItem>Choose</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <asp:Label runat="server" CssClass="form-control-label" Text="Name"></asp:Label>
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txteditName"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <asp:Label runat="server" onkeypress="return onlyDotsAndNumbers(event)" CssClass="form-control-label" Text="Amount"></asp:Label>
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" onkeypress="return onlyDotsAndNumbers(event)" CssClass="form-control" ID="txteditAmount"></asp:TextBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:Label runat="server" CssClass="form-control-label" Text="Date"></asp:Label>
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" onkeypress="return onlyDate(event)" MaxLength="10" CssClass="form-control" ID="txteditDate"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txteditDate" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <asp:Label runat="server" CssClass="form-control-label" Text="Description"></asp:Label>
                        </div>
                        <div class="col">
                            <asp:TextBox Height="100px" ID="txteditDescription" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 offset-md-3">
                            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_Click" />
                        </div>
                        <div class="col">
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClientClick="javascript:$find('mpeUserBehavior').hide();return false;" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

