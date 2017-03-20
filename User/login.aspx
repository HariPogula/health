
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="../Content/bootstrap_theme1.css" rel="stylesheet" />
</head>
<body>
     <div class="container">
          <img src="../Images/asp.jpg" width="75" height="70"  class="pull-left"/>
        <h1 class="text-center text-success"> ASP.NET with Angular2</h1>
        <hr />
        <marquee  behavior="slide" class="bg-success" scrollamount="30"><h3 class="text-info text-center ">Login</h3></marquee>
    <form id="form1" runat="server">
  
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
                <label for="txt_password">Password&nbsp; </label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txt_password" CssClass="alert-danger" Display="Dynamic">This is  Required Field</asp:RequiredFieldValidator>
                &nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_password" CssClass="alert-danger" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="^[\s\S]{6,}$">Password should atleast 6 characters</asp:RegularExpressionValidator>
               <asp:TextBox type="password" ID="txt_password" class="form-control"  placeholder="Enter Password " runat="server"></asp:TextBox>
            </div>
        <div >
              <asp:Button ID="btn_forgot" runat="server" Text="Forgot Password" class="btn btn-default" CausesValidation="false" OnClick="btn_forgot_Click"   />
            
        </div>
        <div>
            <br />
             <asp:Button ID="btn_success" runat="server" Text="Submit" class="btn btn-success" OnClick="btn_success_Click"  />
             <asp:Button ID="btn_reset" runat="server" Text="Reset" class="btn btn-danger" CausesValidation="false"  />
             <asp:Button ID="btn_regitser" runat="server" Text="Register" class="btn btn-primary" CausesValidation="false" OnClick="btn_regitser_Click"  />
       </div>
    
    </form>
    </div>
</body>
</html>
 