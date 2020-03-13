<%@ Page Title="Order" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="regestrationV2.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="Order" runat="server" action="Order.aspx" method="post">
   <table align="center">
            <tr>
                <td>paypal</td>
                <td><input type="text" name="un"/></td>
                <td><p style="display:none" id="un">Invalid user name please re-enter</p></td>
            </tr>
            <tr>
                <td>password</td>
                <td><input type="password" name="pass"/></td>
                <td><p style="display:none" id="pass">Invalid password please re-enter</p></td>
            </tr>
            
            <tr>
                <td style="width:144px; margin-right:115%" colspan="2"><input type="button"  value="שלם" onclick="window.location.href = 'Pay.aspx'" /></td>
            </tr>
        </table>
    </form>
    <h1>Total: <%=total %>$</h1>
</asp:Content>
