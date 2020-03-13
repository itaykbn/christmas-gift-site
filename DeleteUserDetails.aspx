<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DeleteUserDetails.aspx.cs" Inherits="regestrationV2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
        <form id="deleteUser" method="post" action="DeleteUserDetails.aspx">
        <table align="center" dir="ltr">
            <tr><td>Are you sure that you want to delete user <%=Session["UserName"] %> ?</td></tr>
            <tr><td><input type="submit" value="מחק משתמש" name="DelUsr" /></td></tr>
        </table>
    </form>
      <br />
    <br />
    <br />
    <br />
</asp:Content>
