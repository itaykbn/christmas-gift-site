<%@ Page Title="UserDetails" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="regestrationV2.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="font-size: larger" dir="rtl">
        <p>ברוך הבא: <%=userStr %></p>
        <p>שם מלא: <%=fullName%></p>
    </div>
    <br />
    <br />
    <table align="center">
        <tr>
            <td style="direction: ltr; text-align: left; padding-top: 10px; padding-bottom: 10px;"><%= userDetailsTable %>&nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <div style="margin-left:50%">
    <input  type="button"  value="עדכן נתונים" onclick="window.location.href = 'UpdateUserDetails.aspx'" />
    &nbsp&nbsp 

    <input  type="button"  value="מחק משתמש" onclick="window.location.href = 'DeleteUserDetails.aspx'" />
    &nbsp&nbsp

    <input  style="<%=visibility %>" type="button"  value="כל המשתמשים" onclick="window.location.href = 'AllUsers.aspx'"  />   
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
   <input  type="button"  value="לאתר המתנות" onclick="window.location.href = 'PresentsPage.aspx'" />
     </div>

</asp:Content>
