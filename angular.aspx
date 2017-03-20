\<%@ Page Language="C#" AutoEventWireup="true" CodeFile="angular.aspx.cs" Inherits="angular" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

	<style>
input.ng-invalid {
    border-color:pink;



}
input.ng-valid {
    background-color:gray;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div ng-app="formExample" ng-controller="ExampleController">
    
    </div>
    </form>
</body>
</html>
