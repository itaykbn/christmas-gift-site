﻿<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" CodeFile="~/Cart.aspx.cs" Inherits="regestrationV2.WebForm11 " %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src ="checkCartDel.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center">
        <tr>
            <td style="direction: rtl; text-align: right; padding-top: 10px; padding-bottom: 10px;"><%=cartTable%></td>
        </tr>
    </table>
    <br />
    <br />
    <p>כדי למחוק את הפריט עליך להכניס את מספר הפריט</p>
    <form id="delCart" runat="server" action="Cart.aspx" method="post" onsubmit="return validateForm()">
        <table align="center" >
            <tr>

            <td><input type="text" name="delId"/></td>
            <td><p style="display:none" id="delId">המספר לא נכון</p></td>
            </tr>
            <tr>
                <td><input name="submit" type="submit" value="אישור" /></td>
            </tr>

        </table>
    </form>
    <br />
    <br />
    <br />
    <br />
    <br />
    <input type="button"  value="הזמן" onclick="window.location.href = 'Order.aspx'" />
</asp:Content>
