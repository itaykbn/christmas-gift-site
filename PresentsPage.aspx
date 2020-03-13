<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PresentsPage.aspx.cs" Inherits="regestrationV2.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <iframe height="800px" width="800px" style="margin-left:30%" src="PresentsIframeSrc.aspx" name="iframe_a"></iframe>
    <br />
    <br />
      <input  type="button"  value="עגלת קניות" onclick="window.location.href = 'Cart.aspx'" />
</asp:Content>
