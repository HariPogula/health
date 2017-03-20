<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="jumbotron">
        <h3 class="text-primary"> This is Homepage</h3>
            <a href="exam.aspx" runat="server" id="exam"><p>Need to know your body type??</p></a>
          </div>
    </div>
   
</asp:Content>

