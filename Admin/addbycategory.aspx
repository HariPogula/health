<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.master" AutoEventWireup="true" CodeFile="addbycategory.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

	<style>
input.ng-invalid {
    border-color:pink;



}
input.ng-valid {
    background-color:gray;
}
</style>
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  
    <div class="container" >
        
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
               
        <div class="row">

            <asp:Label ID="Label1" runat="server" Text="Select Category:" CssClass=" text-info "></asp:Label>
         <a href="#" data-toggle="tooltip" data-placement="right" title="Select a Category from Database">
          <asp:DropDownList ID="ddl_category"   runat="server" AutoPostBack="true" class="btn btn-warning dropdown-toggle " Width="200px" OnSelectedIndexChanged="ddl_category_SelectedIndexChanged"  ></asp:DropDownList>
         </a>
        </div>
        <hr />
        <div class="row text-center">
            <asp:Label ID="lbl_cat" runat="server"  CssClass="text-primary h2" ></asp:Label>
        </div>
        <hr />
        <div class="row  ">
            <div class="col-sm-2 text-justify text-danger h4 ">
        <asp:Label ID="Label3" runat="server" Text="ID:"  ></asp:Label>
            </div>
            <div class="col-sm-4 ">
               <a href="#" data-toggle="tooltip" data-placement="top" title="Automatically add 1 from database!">   <asp:TextBox ID="txt_id" runat="server" CssClass="form-control" ReadOnly="true" Width="200px"></asp:TextBox> </a>
            </div>
        </div>

<br />


        <div class="row  ">
            <div class="col-sm-2 text-justify text-danger h4 ">
        <asp:Label ID="Label4" runat="server" Text="Name:"  ></asp:Label>
            </div>
            <div class="col-sm-4 ">
                <asp:TextBox ID="txt_name" name="txt_name" runat="server" CssClass="form-control" Width="200px"    autofocus="true" OnTextChanged="txt_name_TextChanged" ></asp:TextBox>
                <span  ><asp:Label ID="lbl_exists" runat="server" class="col-sm-4" style="float:left;margin-top:-25px;margin-left:200px"></asp:Label></span>
            </div>
           
        </div>
<br />
         <div class="row  ">
            <div class="col-sm-2 text-justify text-danger h4 ">
        <asp:Label ID="Label5" runat="server" Text="Taste:"  ></asp:Label>
            </div>
            <div class="col-sm-4 ">
               <asp:DropDownList ID="ddl_taste" runat="server" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" Width="200px"></asp:DropDownList>
            </div>
             <div class="col-sm-4 text-right">
                 <asp:Button ID="btn_submitfinal" runat="server" Text="Add To " CssClass="btn btn-success" Width="250px" OnClick="btn_submitfinal_Click"  />
                 
             </div>
        </div>
                <br />
         <div class="row  ">
            <div class="col-sm-2 text-justify text-danger h4 ">
        <asp:Label ID="Label6" runat="server" Text="Temperature:"  ></asp:Label>
            </div>
            <div class="col-sm-4 ">
                 <asp:DropDownList ID="ddl_temp" runat="server" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" Width="200px"></asp:DropDownList>
            </div>
             <div class="col-sm-4 text-right">
                 
                 <asp:Button ID="btn_editfinal" runat="server" Text="Edit " CssClass="btn btn-info" Width="250px" OnClick="btn_editfinal_Click" />
             </div>
        </div>
                <br />
         <div class="row  ">
            <div class="col-sm-2 text-justify text-danger h4 ">
        <asp:Label ID="Label7" runat="server" Text="Vipak:"  ></asp:Label>
            </div>
            <div class="col-sm-4 ">
                 <asp:DropDownList ID="ddl_vipak" runat="server" class="btn btn-default dropdown-toggle" data-toggle="dropdown" Width="200px"></asp:DropDownList>
            </div>
        </div>
                <br />
         <div class="row  ">
            <div class="col-sm-2 text-justify text-danger h4 ">
        <asp:Label ID="Label8" runat="server" Text="Quality:"  ></asp:Label>
            </div>
            <div class="col-sm-4 ">
                <asp:DropDownList ID="ddl_quality" runat="server" class="btn btn-info dropdown-toggle" data-toggle="dropdown" Width="200px"></asp:DropDownList>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Body Type-<asp:Label ID="lbl_vata" runat="server" ></asp:Label></a>
            &nbsp;
            <asp:Label ID="lbl_vataindex" runat="server" Visible="False" ></asp:Label>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body">
            <div class="row ">
                <div class="col-lg-2 ">
                    <asp:Label ID="lbl_seasonv1" runat="server" CssClass="text-info "></asp:Label>
                     &nbsp;
                    <asp:Label ID="lbl_springindex" runat="server" Visible="False" ></asp:Label>
                    <hr />
                     <asp:DropDownList ID="ddl_season1vs" runat="server" class="btn btn-default dropdown-toggle " data-toggle="dropdown" Width="100px"  ></asp:DropDownList>
                    <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="effect" Select="new (effect)" TableName="suitabilities">
                    </asp:LinqDataSource>
                    <hr />
                    Timings :<asp:CheckBox runat="server" id="chv1"  OnCheckedChanged="chv_CheckedChanged" AutoPostBack="True"></asp:CheckBox>
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="LinqDataSource1" DataTextField="timing_name" DataValueField="timing_id" ></asp:CheckBoxList>
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="timing_id" TableName="timings">
                    </asp:LinqDataSource>
                </div>
                 <div class="col-lg-2">
                    <asp:Label ID="lbl_seasonv2" runat="server" CssClass="text-info"></asp:Label>
                     <asp:Label ID="lbl_summerindex" runat="server" Visible="False" ></asp:Label>
                      <hr />
                     <asp:DropDownList ID="ddl_season1vsm" runat="server" class="btn btn-default dropdown-toggle " data-toggle="dropdown" Width="100px"  DataTextField="effect" DataValueField="effect"></asp:DropDownList>
                   
                    <hr />
                    Timings <asp:CheckBox runat="server" id="chv2"></asp:CheckBox>
                    <asp:CheckBoxList ID="CheckBoxList2" runat="server" DataSourceID="LinqDataSource1" DataTextField="timing_name" DataValueField="timing_id"></asp:CheckBoxList>
                    <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="timing_id" TableName="timings">
                    </asp:LinqDataSource>
                </div>
                 <div class="col-lg-2">
                   <asp:Label ID="lbl_seasonv3" runat="server" CssClass="text-info"></asp:Label> 
                      <hr />
                     <asp:DropDownList ID="ddl_season1vw" runat="server" class="btn btn-default dropdown-toggle " data-toggle="dropdown" Width="100px"  DataTextField="effect" DataValueField="effect"></asp:DropDownList>
                   
                    <hr />
                    Timings
                    <asp:CheckBoxList ID="CheckBoxList3" runat="server" DataSourceID="LinqDataSource1" DataTextField="timing_name" DataValueField="timing_id"></asp:CheckBoxList>
                    <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="timing_id" TableName="timings">
                    </asp:LinqDataSource>
                </div>
                 <div class="col-lg-2">
                     <asp:Label ID="lbl_seasonv4" runat="server" CssClass="text-info"></asp:Label> 
                      <hr />
                     <asp:DropDownList ID="ddl_season1vf" runat="server" class="btn btn-default dropdown-toggle " data-toggle="dropdown" Width="100px"  DataTextField="effect" DataValueField="effect"></asp:DropDownList>
                   
                    <hr />
                    Timings
                    <asp:CheckBoxList ID="CheckBoxList4" runat="server" DataSourceID="LinqDataSource1" DataTextField="timing_name" DataValueField="timing_id"></asp:CheckBoxList>
                    <asp:LinqDataSource ID="LinqDataSource5" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="timing_id" TableName="timings">
                    </asp:LinqDataSource>
                </div>
                  
                 <div class="col-lg-2">
                     <asp:Label ID="lbl_seasonvo2" runat="server" Text="Operation"></asp:Label>
                     <hr />
                     <asp:Button ID="btn_vatas" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btn_vatas_Click" />
                </div>
            </div>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Body Type-<asp:Label ID="lbl_pitta" runat="server" ></asp:Label></a>
            <asp:Label ID="lbl_pittaindex" runat="server" Visible="false" ></asp:Label>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">

        <div class="panel-body">
            <div class="row ">
                <div class="col-lg-2 ">
                    <asp:Label ID="lbl_seasonp1" runat="server" CssClass="text-info "></asp:Label>
                    <asp:Label ID="lbl_springpitta" runat="server" visible="false"></asp:Label>
                     <hr />
                     <asp:DropDownList ID="ddl_seasonps" runat="server" class="btn btn-default dropdown-toggle " data-toggle="dropdown" Width="100px"  DataTextField="effect" DataValueField="effect"></asp:DropDownList>
                    <asp:LinqDataSource ID="LinqDataSource6" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="effect" Select="new (effect)" TableName="suitabilities">
                    </asp:LinqDataSource>
                    <hr />
                    Timings
                    <asp:CheckBoxList ID="CheckBoxList5" runat="server" DataSourceID="LinqDataSource1" DataTextField="timing_name" DataValueField="timing_id"></asp:CheckBoxList>
                    <asp:LinqDataSource ID="LinqDataSource7" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="timing_id" TableName="timings">
                    </asp:LinqDataSource>
                </div>
                 <div class="col-lg-2">
                    <asp:Label ID="lbl_seasonp2" runat="server" CssClass="text-info"></asp:Label>
                     <asp:Label ID="lbl_summerpitta" runat="server" visible="false"></asp:Label>
                      <hr />
                     <asp:DropDownList ID="ddl_seasonpm" runat="server" class="btn btn-default dropdown-toggle " data-toggle="dropdown" Width="100px"  DataTextField="effect" DataValueField="effect"></asp:DropDownList>
                   
                    <hr />
                    Timings
                    <asp:CheckBoxList ID="CheckBoxList6" runat="server" DataSourceID="LinqDataSource1" DataTextField="timing_name" DataValueField="timing_id"></asp:CheckBoxList>
                    <asp:LinqDataSource ID="LinqDataSource8" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="timing_id" TableName="timings">
                    </asp:LinqDataSource>
                </div>
                 <div class="col-lg-2">
                   <asp:Label ID="lbl_seasonp3" runat="server" CssClass="text-info"></asp:Label> 
                      <hr />
                     <asp:DropDownList ID="ddl_seasonpw" runat="server" class="btn btn-default dropdown-toggle " data-toggle="dropdown" Width="100px"  DataTextField="effect" DataValueField="effect"></asp:DropDownList>
                   
                    <hr />
                    Timings
                    <asp:CheckBoxList ID="CheckBoxList7" runat="server" DataSourceID="LinqDataSource1" DataTextField="timing_name" DataValueField="timing_id"></asp:CheckBoxList>
                    <asp:LinqDataSource ID="LinqDataSource9" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="timing_id" TableName="timings">
                    </asp:LinqDataSource>
                </div>
                 <div class="col-lg-2">
                     <asp:Label ID="lbl_seasonp4" runat="server" CssClass="text-info"></asp:Label> 
                      <hr />
                     <asp:DropDownList ID="ddl_seasonpf" runat="server" class="btn btn-default dropdown-toggle " data-toggle="dropdown" Width="100px"  DataTextField="effect" DataValueField="effect"></asp:DropDownList>
                   
                    <hr />
                    Timings
                    <asp:CheckBoxList ID="CheckBoxList8" runat="server" DataSourceID="LinqDataSource1" DataTextField="timing_name" DataValueField="timing_id"></asp:CheckBoxList>
                    <asp:LinqDataSource ID="LinqDataSource10" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="timing_id" TableName="timings">
                    </asp:LinqDataSource>
                </div>
                  <div class="col-lg-2">
                      <asp:Label ID="lbl_seasonpo1" runat="server" Text="Operation"></asp:Label>
                </div>
                 <div class="col-lg-2">
                     <asp:Label ID="lbl_seasonpo2" runat="server" Text="Operation"></asp:Label>
                </div>
            </div>
        </div>



    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Body Type-<asp:Label ID="lbl_kapha" runat="server" ></asp:Label></a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
               <div class="panel-body">
            <div class="row ">
                <div class="col-lg-2 ">
                    <asp:Label ID="lbl_seasonk1" runat="server" CssClass="text-info "></asp:Label>
                     <hr />
                     <asp:DropDownList ID="ddl_seasonks" runat="server" class="btn btn-default dropdown-toggle " data-toggle="dropdown" Width="100px"  DataTextField="effect" DataValueField="effect"></asp:DropDownList>
                    <asp:LinqDataSource ID="LinqDataSource11" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="effect" Select="new (effect)" TableName="suitabilities">
                    </asp:LinqDataSource>
                    <hr />
                    Timings
                    <asp:CheckBoxList ID="CheckBoxList9" runat="server" DataSourceID="LinqDataSource1" DataTextField="timing_name" DataValueField="timing_id"></asp:CheckBoxList>
                    <asp:LinqDataSource ID="LinqDataSource12" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="timing_id" TableName="timings">
                    </asp:LinqDataSource>
                </div>
                 <div class="col-lg-2">
                    <asp:Label ID="lbl_seasonk2" runat="server" CssClass="text-info"></asp:Label>
                      <hr />
                     <asp:DropDownList ID="ddl_seasonkm" runat="server" class="btn btn-default dropdown-toggle " data-toggle="dropdown" Width="100px"  DataTextField="effect" DataValueField="effect"></asp:DropDownList>
                   
                    <hr />
                    Timings
                    <asp:CheckBoxList ID="CheckBoxList10" runat="server" DataSourceID="LinqDataSource1" DataTextField="timing_name" DataValueField="timing_id"></asp:CheckBoxList>
                    <asp:LinqDataSource ID="LinqDataSource13" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="timing_id" TableName="timings">
                    </asp:LinqDataSource>
                </div>
                 <div class="col-lg-2">
                   <asp:Label ID="lbl_seasonk3" runat="server" CssClass="text-info"></asp:Label> 
                      <hr />
                     <asp:DropDownList ID="ddl_seasonkw" runat="server" class="btn btn-default dropdown-toggle " data-toggle="dropdown" Width="100px"  DataTextField="effect" DataValueField="effect"></asp:DropDownList>
                   
                    <hr />
                    Timings
                    <asp:CheckBoxList ID="CheckBoxList11" runat="server" DataSourceID="LinqDataSource1" DataTextField="timing_name" DataValueField="timing_id"></asp:CheckBoxList>
                    <asp:LinqDataSource ID="LinqDataSource14" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="timing_id" TableName="timings">
                    </asp:LinqDataSource>
                </div>
                 <div class="col-lg-2">
                     <asp:Label ID="lbl_seasonk4" runat="server" CssClass="text-info"></asp:Label> 
                      <hr />
                     <asp:DropDownList ID="ddl_seasonkf" runat="server" class="btn btn-default dropdown-toggle " data-toggle="dropdown" Width="100px"  DataTextField="effect" DataValueField="effect"></asp:DropDownList>
                   
                    <hr />
                    Timings
                    <asp:CheckBoxList ID="CheckBoxList12" runat="server" DataSourceID="LinqDataSource1" DataTextField="timing_name" DataValueField="timing_id"></asp:CheckBoxList>
                    <asp:LinqDataSource ID="LinqDataSource15" runat="server" ContextTypeName="aayurvedicDataContext" EntityTypeName="" OrderBy="timing_id" TableName="timings">
                    </asp:LinqDataSource>
                </div>
                  <div class="col-lg-2">
                      <asp:Label ID="Label21" runat="server" Text="Operation"></asp:Label>
                </div>
                 <div class="col-lg-2">
                     <asp:Label ID="Label22" runat="server" Text="Operation"></asp:Label>
                </div>
            </div>
        </div>

    </div>
  </div> 

                 

         </div>




                  </ContentTemplate>
        </asp:UpdatePanel>
         
    </div>

</asp:Content>

