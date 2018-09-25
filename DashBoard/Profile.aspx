<%@ Page Title="" Language="C#" MasterPageFile="~/DashBoard/MasterDashboard.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="DashBoard_Profile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .align{
            margin-top:25px;
        }

        .popup {
            align-self: center;
            min-width: 300px;
            min-height: 2000px;
            background: #202030;
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="updatePanel" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div>
                <p style="margin: 10px 15px;">
                    <a href="Dashboard.aspx">Dashboard </a> / Profile 
                </p>
            </div>
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="card card-body">
                            <h4 class="card-title">Profile</h4>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <asp:Label ID="lblUserName" runat="server" Text="UserName"></asp:Label>
                                    </div>
                                    <div class="col">
                                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" Width="300px" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                    </div>
                                    <div class="col">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Width="300px" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <asp:Label ID="lblFullName" runat="server" Text="FullName"></asp:Label>
                                    </div>
                                    <div class="col">
                                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-2">
                                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                    </div>
                                    <div class="col">
                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                                    </div>
                                    <div class="col">
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-3 offset-md-3">
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="btn btn-danger" />
                                </div>
                                <div class="col-md offset-md">
                                    <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn btn-secondary" OnClick="btnChangePassword_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card card-body">
                            <h2 class="card-title">Account Status</h2>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm">
                                        <asp:Label ID="Status" runat="server" Text="Status:"></asp:Label>
                                    </div>
                                    <div class="col">
                                        <span class=" text-success">Active</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm">
                                        <asp:Label ID="label" runat="server" Text="CreatedAt:"></asp:Label>
                                    </div>
                                    <div class="col">
                                        <asp:Label ID="lblCreatedAt" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- For edit popup --%>
            <div class="panel1 panel1-primary" id="pnlAddPopup" style="background-color: white;" runat="server">
                <div class="panel1-heading" id="popupheader">
                    <h3 class="panel1-title">Change Password</h3>
                    <span style="float: right; margin-top: -30px;">
                        <asp:Image ID="imgClose" ImageUrl="../DashBoardStyle/img/btn-close.png" title="Close" AlternateText="Close" runat="server" />
                    </span>
                </div>
                <div class="panel1-body">
                    <asp:HiddenField ID="hfUserID" runat="server" Value="0" />
                    <div class="row">
                        <div class="col-sm align">
                            <asp:Label ID="lblOldPassword" runat="server" Text="OldPassword"></asp:Label>
                        </div>
                        <div class="col-6">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtOldPassword" ValidationGroup="a" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtOldPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm align">
                            <asp:Label ID="lblNewPassword" runat="server" Text="NewPassword"></asp:Label>
                        </div>
                        <div class="col-6">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtNewPassword" ValidationGroup="a" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm align">
                            <asp:Label ID="lblConfirmPassword" runat="server" Text="ConfirmPassword"></asp:Label>
                        </div>
                        <div class="col">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtConfirmPassword" ValidationGroup="a"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Password Mismatch" ForeColor="Red" ValidationGroup="a"></asp:CompareValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 offset-md-3">
                            <asp:Button ID="btnChange" ValidationGroup="a" CssClass="btn btn-primary" runat="server" Text="Change" OnClick="btnChange_Click" />
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

