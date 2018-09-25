<%@ Page Title="" Language="C#" MasterPageFile="~/DashBoard/MasterDashboard.master" AutoEventWireup="true" CodeFile="Incomes.aspx.cs" Inherits="DashBoard_Incomes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdateGridView" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div>
                <p style="margin: 10px 15px;">
                    <a href="Dashboard.aspx">Dashboard </a> / Income / Add Incomes
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
                                <h5 class="mb-0">Add Incomes <i class="fa fa-angle-down rotate-icon"></i>
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
                                <%--<div class="row">
                        <div class="col-sm-1">
                            <asp:label runat="server" CssClass="form-control-label" text="Name"></asp:label>
                        </div>
                        <div class="col-3">
                            <asp:textbox runat="server" CssClass="form-control" ID="txtName"></asp:textbox>
                        </div>
                    </div>--%>
                                <div class="row">
                                    <div class="col-sm-1">
                                        <asp:Label runat="server" onkeypress="return onlyDotsAndNumbers(event)" CssClass="form-control-label" Text="Amount"></asp:Label>
                                    </div>
                                    <div class="col-3">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtAmount"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1">
                                        <asp:Label runat="server" onkeypress="return onlyDate(event)" MaxLength="10" CssClass="form-control-label" Text="Date"></asp:Label>
                                    </div>
                                    <div class="col-3">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtDate"></asp:TextBox>
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
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>

                    <asp:GridView ID="GridView1" DataKeyNames="incomeId" CssClass="table table-hover table-responsive-md table-fixed" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <%#Eval("incomeId") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Income">
                                <ItemTemplate>
                                    <%#Eval("incomeCatname") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount">
                                <ItemTemplate>
                                    <%#Eval("incomeAmount") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date Added">
                                <ItemTemplate>
                                    <%#Eval("incomeDate","{0:d}") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <%#Eval("incomeDescription") %>
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
            <div class="panel1 panel1-primary" id="pnlAddPopup" style="background-color: white; align-self: center;" runat="server">
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
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger"
                                OnClick="btnCancel_Click" OnClientClick="javascript:$find('mpeUserBehavior').hide();return false;" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

