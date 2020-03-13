<%@ Page Title="AllUsers" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AllUsers.aspx.cs" Inherits="regestrationV2.WebForm3" CodeFile="~/AllUsers.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
    <h1>List of all users in this site</h1>
        <br />
        <br />
        <table align="center">
        <tr>
            <td style="direction: ltr; text-align: left; padding-top: 10px; padding-bottom: 10px;"><%=userTable %></td>
        </tr>

    </table>



</asp:Content>
