<%@ Page Title="Admin details" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminUserDetails.aspx.cs" Inherits="regestrationV2.WebForm14" CodeFile="~/AdminUserDetails.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="font-size: larger" dir="rtl">
        <p>ברוך הבא: <%=userStr %></p>
    </div>
    <br />
    <br />
    <table align="center">
        <thead>
            <tr>
                <th><%=fullName%></th>
            </tr>
        </thead>
        <tr>
            <td style="direction: ltr; text-align: left; padding-top: 10px; padding-bottom: 10px;"><%= userDetailsTable %>&nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <div style="margin-left: 50%">


        <input type="button" value="כל המשתמשים" onclick="window.location.href = 'AllUsers.aspx'" />
        <input type="button" value="עדכן פרטים" onclick="window.location.href = 'UpdateAdminDetails.aspx'" />

    </div>

</asp:Content>
