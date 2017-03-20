<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.master" AutoEventWireup="true" CodeFile="edit_profile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <div class="container ">
        <h3 class="text-primary text-center ">Hello
            <asp:Label ID="lbl_user" runat="server" ></asp:Label>
        </h3>
       <h4> <asp:Label ID="lbl_alert" runat="server" ></asp:Label></h4>



        


        <hr />
        <div class="form-group col-lg-8">
              <label for="txt_fname">First Name</label>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txt_fname" CssClass="alert-danger" Display="Dynamic">This is  Required Field</asp:RequiredFieldValidator>
              &nbsp;<asp:TextBox ID="txt_fname" runat="server" class="form-control"></asp:TextBox>
              </div>
               <div class="form-group col-lg-8">
              <label for="txt_fname">Last Name</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txt_lname" CssClass="alert-danger" Display="Dynamic">This is  Required Field</asp:RequiredFieldValidator>
              <asp:TextBox ID="txt_lname" runat="server" class="form-control"></asp:TextBox>
              </div>
              <div class="form-group col-lg-8">
                <label for="txt_email">Email address</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txt_email" CssClass="alert-danger" Display="Dynamic">This is  Required Field</asp:RequiredFieldValidator>
                &nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" CssClass="alert-danger" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Email is in not correct Format</asp:RegularExpressionValidator>
                <asp:TextBox type="text" ID="txt_email" class="form-control"  placeholder="Enter Email" runat="server"></asp:TextBox>
              </div>
            <div class="form-group col-lg-8">
              <label for="txt_pwd">Password </label>
&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txt_pwd" CssClass="alert-danger" Display="Dynamic">This is  Required Field</asp:RequiredFieldValidator>
                <asp:TextBox type="password" ID="txt_pwd" runat="server" class="form-control"></asp:TextBox>
              </div>
              <div class="form-group col-lg-8">
              <label for="txt_cpwd"> Confirm Password&nbsp;</label>
              
                  <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="txt_pwd" ControlToValidate="txt_cpwd" CssClass="alert-danger" Display="Dynamic">Password Should Match</asp:CompareValidator>
                  
                  
              &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_cpwd" CssClass="alert-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator">This is Required filed</asp:RequiredFieldValidator>
                  
                  
              &nbsp;<asp:TextBox type="password" ID="txt_cpwd" runat="server" class="form-control"></asp:TextBox>
              </div>
        <div class="form-group  col-lg-8">
                        <div class="row">
                            <div class="col-sm-5 ">
                              
                       <asp:DropDownList ID="ddl_sec1"   runat="server" AutoPostBack="true" class="btn btn-warning dropdown-toggle  " OnSelectedIndexChanged="ddl_sec1_SelectedIndexChanged"    ></asp:DropDownList>
                                </div>
                            <div class="col-sm-4 pull-left">
                          <asp:TextBox type="text" ID="txt_sans1" runat="server" class="form-control "></asp:TextBox>
                                </div>
                            </div>
                    </div>
                    <div class="form-group col-lg-8 ">
                        <div class="row">
                            <div class="col-sm-5 ">
                              
                       <asp:DropDownList ID="ddl_sec2"   runat="server" AutoPostBack="true" class="btn btn-warning dropdown-toggle  "    ></asp:DropDownList>
                                </div>
                            <div class="col-sm-4 pull-left">
                          <asp:TextBox type="text" ID="txt_sans2" runat="server" class="form-control "></asp:TextBox>
                                </div>
                            </div>
                    </div>
                    <div class="form-group col-lg-8 ">
                        <div class="row">
                            <div class="col-sm-5 ">
                                
                       <asp:DropDownList ID="ddl_sec3"   runat="server" AutoPostBack="true" class="btn btn-warning dropdown-toggle  "    ></asp:DropDownList>
                                </div>
                            <div class="col-sm-4 pull-left">
                          <asp:TextBox type="text" ID="txt_sans3" runat="server" class="form-control "></asp:TextBox>
                                </div>
                            </div>
                    </div>
       
             <asp:Button ID="btn_regitser" runat="server" Text="Edit" class="btn btn-primary" CausesValidation="false" OnClick="btn_regitser_Click"   data-target="#myModal" />
              <asp:Button ID="btn_reset" runat="server" Text="Reset" class="btn btn-danger" CausesValidation="false"    OnClick="btn_reset_Click"   />
            <asp:Button ID="btn_success" runat="server" Text="Submit" class="btn btn-success" OnClick="btn_success_Click"   />
        
        
              <br />
              <asp:Label ID="Label1" runat="server"></asp:Label>
   
        <br />
        <br />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Image ID="Image1" runat="server"  /><br /><br />
                <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                 <asp:Button ID="btn_upload" runat="server" Text="Upload" class="btn btn-primary" CausesValidation="false" OnClick="btn_upload_Click"       />
            </ContentTemplate>
        </asp:UpdatePanel>
   
    </div>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

