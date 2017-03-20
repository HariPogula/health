<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgotpwd.aspx.cs" Inherits="forgotpwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="../Content/bootstrap_theme1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
     <marquee  behavior="slide" class="bg-success" scrollamount="30"><h3 class="text-info text-center ">Forgot Password??</h3></marquee>
        <hr />
        <div class="form-group">
                <span class="glyphicon glyphicon-user"></span>
                <label for="txt_email">Email address</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txt_email" CssClass="alert-danger" Display="Dynamic">This is  Required Field</asp:RequiredFieldValidator>
                &nbsp;
                <asp:TextBox type="text" ID="txt_email" class="form-control" aria-describedby="emailHelp" placeholder="Enter Email" runat="server"></asp:TextBox>
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group">
                <span class="glyphicon glyphicon-lock"></span>
                <asp:Label ID="lbl_sec1" runat="server" Text="Label"></asp:Label>
               
               <asp:TextBox type="password" ID="txt_sec1" class="form-control"  placeholder="Enter Password " runat="server"></asp:TextBox>
            </div>
         <div class="form-group">
                <span class="glyphicon glyphicon-lock"></span>
                <asp:Label ID="lbl_sec2" runat="server" Text="Label"></asp:Label>
               
               <asp:TextBox type="password" ID="txt_sec2" class="form-control"  placeholder="Enter Password " runat="server"></asp:TextBox>
            </div>
        <div class="form-group">
                <span class="glyphicon glyphicon-lock"></span>
                <asp:Label ID="lbl_sec3" runat="server" Text="Label"></asp:Label>
                
               <asp:TextBox type="password" ID="txt_sec3" class="form-control"  placeholder="Enter Password " runat="server"></asp:TextBox>
            </div>
        
        <div >
      <asp:Button ID="btn_success" runat="server" Text="Submit" class="btn btn-success"   />
             <asp:Button ID="btn_reset" runat="server" Text="Reset" class="btn btn-danger" CausesValidation="false"  />
            
    </div>
        </div>
    </form>
</body>
</html>
