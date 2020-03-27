<%@ Page Title="User details" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="regestrationV2.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <div style="font-size: larger" dir="rtl">
        <p>ברוך הבא: <%=userStr %></p>
    </div>
    <br />
    <br />

    <table align="center">
        <thead>
            <tr>
                <th style="column-span: all;"><%=fullName%></th>
            </tr>
        </thead>
        <tr>
            <td style="border: none; direction: ltr; text-align: left; padding-top: 10px; padding-bottom: 10px"><%= userDetailsTable %>&nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <div style="margin-left: 50%">
        <input style="text-align: center" type="button" value="עדכן נתונים" onclick="window.location.href = 'UpdateUserDetails.aspx'" />
        &nbsp&nbsp 

    <input type="button" value="מחק משתמש" onclick="window.location.href = 'DeleteUserDetails.aspx'" />
        &nbsp&nbsp
 
    <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>

</asp:Content>
