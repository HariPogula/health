<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    
    <link href="../Content/bootstrap_theme1.css" rel="stylesheet" />
    
    
   
</head>
<body>
    
    <div class="container">
        <img src="../Images/asp.jpg" width="75" height="70"  class="pull-left"/>
        <h1 class="text-center text-success"> ASP.NET with Angular2</h1>
        <hr />
        <marquee  behavior="slide" class="bg-success" scrollamount="30"><h3 class="text-info text-center ">Registration Page</h3></marquee>
        <asp:Label ID="lbl_msgr" runat="server" ></asp:Label>
       <%-- <marquee scrollamount="15" direction="up" behavior="alternate"><marquee scrollamount="15" direction="right" behavior="alternate"><img src="../Images/asp.jpg" width="75" height="70"  /> <h3 class="text-info text-center bg-info">Registration Page</h3></marquee></marquee>--%>
        <hr />
    <form id="form1" runat="server" class="col-lg-8">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <div class="row">
                <div class="col-lg-10">

           
    <div class="form-group">
        <asp:Label ID="lbl_random" runat="server" Text="Label"></asp:Label><br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
              <label for="txt_fname" >First Name</label>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txt_fname" CssClass="alert-danger" Display="Dynamic">This is  Required Field</asp:RequiredFieldValidator>
              &nbsp;<asp:TextBox ID="txt_fname" runat="server" class="form-control"></asp:TextBox>
              </div>
               <div class="form-group">
              <label for="txt_fname">Last Name</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txt_lname" CssClass="alert-danger" Display="Dynamic">This is  Required Field</asp:RequiredFieldValidator>
              <asp:TextBox ID="txt_lname" runat="server" class="form-control"></asp:TextBox>
              </div>
              <div class="form-group">
                <label for="txt_email">Email address</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txt_email" CssClass="alert-danger" Display="Dynamic">This is  Required Field</asp:RequiredFieldValidator>
                &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" CssClass="alert-danger" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Email is in not correct Format</asp:RegularExpressionValidator>
                <asp:TextBox type="text" ID="txt_email" class="form-control"  placeholder="Enter Email" runat="server" OnTextChanged="txt_email_TextChanged"></asp:TextBox>
                  <asp:Label ID="lbl_emailex" runat="server" Text="Label"></asp:Label>
              </div>
            <div class="form-group">
              <label for="txt_pwd">Password </label>
&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txt_pwd" CssClass="alert-danger" Display="Dynamic">This is  Required Field</asp:RequiredFieldValidator>
                <asp:TextBox type="password" ID="txt_pwd" runat="server" class="form-control"></asp:TextBox>
              </div>
              <div class="form-group">
              <label for="txt_cpwd"> Confirm Password&nbsp;</label>
              
                  <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="txt_pwd" ControlToValidate="txt_cpwd" CssClass="alert-danger" Display="Dynamic">Password Should Match</asp:CompareValidator>
                  
                  
              &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_cpwd" CssClass="alert-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator">This is Required filed</asp:RequiredFieldValidator>
                  
                  
              &nbsp;<asp:TextBox type="password" ID="txt_cpwd" runat="server" class="form-control"></asp:TextBox>
              </div>
                    <div class="form-group ">
                        <div class="row">
                            <div class="col-sm-6 ">
                       <asp:DropDownList ID="ddl_sec1"   runat="server" AutoPostBack="true" class="btn btn-warning dropdown-toggle  "    ></asp:DropDownList>
                                </div>
                            <div class="col-sm-4 pull-left">
                          <asp:TextBox type="text" ID="txt_sans1" runat="server" class="form-control "></asp:TextBox>
                                </div>
                            </div>
                    </div>
                    <div class="form-group ">
                        <div class="row">
                            <div class="col-sm-6 ">
                       <asp:DropDownList ID="ddl_sec2"   runat="server" AutoPostBack="true" class="btn btn-warning dropdown-toggle  "    ></asp:DropDownList>
                                </div>
                            <div class="col-sm-4 pull-left">
                          <asp:TextBox type="text" ID="txt_sans2" runat="server" class="form-control "></asp:TextBox>
                                </div>
                            </div>
                    </div>
                    <div class="form-group ">
                        <div class="row">
                            <div class="col-sm-6 ">
                       <asp:DropDownList ID="ddl_sec3"   runat="server" AutoPostBack="true" class="btn btn-warning dropdown-toggle  "    ></asp:DropDownList>
                                </div>
                            <div class="col-sm-4 pull-left">
                          <asp:TextBox type="text" ID="txt_sans3" runat="server" class="form-control "></asp:TextBox>
                                </div>
                            </div>
                    </div>
               <asp:Button ID="btn_success" runat="server" Text="Submit" class="btn btn-success" OnClick="btn_success_Click"  />
             
               <asp:Button ID="btn_reset" runat="server" Text="Reset" class="btn btn-danger" CausesValidation="false"  />
        <asp:Button ID="btn_regitser" runat="server" Text="Login" class="btn btn-primary" CausesValidation="false" OnClick="btn_regitser_Click"   />
              <br />
              <asp:Label ID="Label1" runat="server"></asp:Label>
   
        <br />
                  </div>
        
        <div class="col-lg-2">
   
            
                <asp:Image ID="Image1" runat="server"  /><br /><br />
                <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                 <asp:Button ID="btn_upload" runat="server" Text="Upload" class="btn btn-primary" CausesValidation="false" OnClick="btn_upload_Click"       />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbl_img" runat="server" Text="Label"></asp:Label>
            
        
</div>
            </div>
                </ContentTemplate>
        </asp:UpdatePanel>
    </form>
        </div>
</body>
</html>
