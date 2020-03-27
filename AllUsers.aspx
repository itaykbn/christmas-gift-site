<%@ Page Title="AllUsers" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AllUsers.aspx.cs" Inherits="regestrationV2.WebForm3" CodeFile="~/AllUsers.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>List of all users in this site</h1>
    <br />
    <br />
   

     <iframe height="1000px" width="1700px" style="margin-left: 22%" src="UsersIframeSrc.aspx" name="iframe_b" frameborder="0"></iframe>

</asp:Content>

