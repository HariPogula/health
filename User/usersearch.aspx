<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.master" AutoEventWireup="true" CodeFile="usersearch.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container ">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row  ">
                    <div class="col-sm-1 text-justify text-info h4 ">

                        <asp:Label ID="Label1" runat="server" Text="Search"></asp:Label>
                    </div>
                    <div class="col-sm-3 ">
                        <asp:TextBox ID="txt_search" runat="server" CssClass="form-control" Width="200px"></asp:TextBox>
                    </div>
                    <div class="col-sm-2 ">
                    <asp:DropDownList ID="ddl_season" runat="server" AutoPostBack="true" class="btn btn-default dropdown-toggle " data-toggle="dropdown" Width="150px"></asp:DropDownList>
                    </div>
                     <div class="col-sm-2 ">
                    <asp:DropDownList ID="ddl_bodytype" runat="server" AutoPostBack="true" class="btn btn-default dropdown-toggle " data-toggle="dropdown" Width="180px"></asp:DropDownList>
                         </div>
                    <div class="col-sm-1">
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" CssClass="btn btn-success" />
                        </div>
                </div>


                <hr />
        <asp:Label ID="Label2" runat="server" ></asp:Label>
        <asp:Label ID="Label3" runat="server" ></asp:Label>
        <asp:Label ID="Label4" runat="server" ></asp:Label>
        <asp:Label ID="Label5" runat="server" ></asp:Label>
                <div class="row ">
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                </div>
                </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

