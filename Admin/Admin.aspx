<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterAdmin.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
      
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:updatepanel id="UpdateGridView" updatemode="Conditional" runat="server">
        <ContentTemplate>
            <div>
                <p style="margin: 10px 15px">
                    <a href="Admin.aspx">Dashboard </a>
                </p>
            </div>
           
            <div class="col-lg-12">
                <div class="block">
   
                        
                   
                    <asp:GridView ID="gridAdmin" BorderWidth="0"
                        CssClass="table table-hover table-responsive-md table-fixed"
                        runat="server" AutoGenerateColumns="False" DataKeyNames="UserId"
                        EmptyDataText="No Data Found" AllowPaging="true" OnPageIndexChanging="gridAdmin_PageIndexChanging" >
                        <Columns>
                           
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex +1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <%#Eval("UserId") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="UserName">
                                <ItemTemplate>
                                    <%# Eval("UserName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="FullName">
                                <ItemTemplate>
                                    <%# Eval("FullName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <%# Eval("Email") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <%# Eval("Status") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="CreatedAt">
                                <ItemTemplate>
                                    <%# Eval("CreatedAt","{0:d}") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                              <asp:TemplateField HeaderText="Remove">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibtnDelete" OnClientClick="return confirm('Do you want to Remove the User?')" OnClick="ibtnDelete_Click"
                                        ImageUrl="../DashBoardStyle/img/delete.png" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                         
                            
                          
                        </Columns>
                    </asp:GridView>
                   
                </div>
            </div>
        </ContentTemplate>
    </asp:updatepanel>
</asp:Content>
