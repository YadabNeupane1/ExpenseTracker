<%@ Page Title="" Language="C#" MasterPageFile="~/DashBoard/MasterDashboard.master" AutoEventWireup="true" CodeFile="IncomeCategory.aspx.cs" Inherits="DashBoard_IncomesCategory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdateGridView" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div>
                <p style="margin: 10px 15px;">
                    <a href="Dashboard.aspx">Dashboard </a> / Income / Add Category
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
                                <h5 class="mb-0">Add Income Category <i class="fa fa-angle-down rotate-icon"></i>
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
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCategory"></asp:TextBox>
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
                    <asp:GridView ID="gridIncomeCategories" DataKeyNames="incomeCatId" EmptyDataText="No Data Available" CssClass="table table-hover table-responsive-md table-fixed" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gridIncomeCategories_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <%#Eval("incomeCatId") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Income Category">
                                <ItemTemplate>
                                    <%#Eval("IncomeCatname") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibtnEdit" OnClick="ibtnEdit_Click" ImageUrl="../DashBoardStyle/img/edit.png" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibtnDelete" ImageUrl="../DashBoardStyle/img/delete.png"
                                        OnClientClick="return confirm('Do you want to delete?')" OnClick="ibtnDelete_Click" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <%-- For edit popup --%>
            <div class="panel1 panel1-primary" id="pnlAddPopup" style="background-color: white;" runat="server">
                <div class="panel1-heading" id="popupheader">
                    <h3 class="panel1-title">Edit</h3>
                    <span style="float: right; margin-top: -30px;">
                        <asp:Image ID="imgClose" ImageUrl="../DashBoardStyle/img/btn-close.png" title="Close" AlternateText="Close" runat="server" />
                    </span>
                </div>
                <div class="panel1-body">
                    <asp:HiddenField ID="hfUserID" runat="server" Value="0" />
                    <div class="row">
                        <div class="col-3">
                            <asp:Label runat="server" CssClass="form-control-label" Text="Category"></asp:Label>
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txteditCategory"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 offset-md-3">
                            <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" />
                        </div>
                        <div class="col">
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel"
                                OnClientClick="javascript:$find('mpeUserBehavior').hide();return false;" />
                        </div>
                    </div>
                </div>
            </div>
            <ajaxToolkit:ModalPopupExtender ID="EditPopup" runat="server"
                TargetControlID="hfUserID"
                PopupControlID="pnlAddPopup"
                BehaviorID="mpeUserBehavior"
                DropShadow="true"
                CancelControlID="imgClose"
                PopupDragHandleControlID="popupheader">
            </ajaxToolkit:ModalPopupExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

