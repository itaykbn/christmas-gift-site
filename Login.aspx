<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="regestrationV2.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src ="login.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1> הכנס את שם המשתמש והסיסמה לשדות שלמטה או היכנס כאורח</h1>
     <br /> 
     <br />
     <br />
    <form id="LoginForm" runat="server" action="Login.aspx" method="post" onsubmit="return validateForm()">
   <table align="center">
            <tr>
                <td>שם משתמש</td>
                <td><input type="text" name="un"/></td>
                <td><p style="display:none" id="un">Invalid user name please re-enter</p></td>
            </tr>
            <tr>
                <td>סיסמה</td>
                <td><input type="password" name="pass"/></td>
                <td><p style="display:none" id="pass">Invalid password please re-enter</p></td>
            </tr>
            <tr>
                <td style="width:144px; margin-right:115%; display:block;" colspan="2"><input name="submit" type="submit" value="היכנס"/></td>
            </tr>
        </table>
    </form>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div style="font-size:larger" dir="rtl">
    <p> עוד שלב אחד וגמרנו</p>
    <p> !!!חג מולד שמח</p>
    <p> ושנה חדשה שמחה</p>
    </div>
    <br />
     <form>
     <%--<input  type="button" style="margin-left:550px" value="היכנס כאורח" onclick="window.location.href = 'UserDetails.aspx'" />--%>
      <br />
      <br />

      <br />

    <p style="font-size:x-large">אם אתה ניכנס כאורח עליך לדעת שלא תוכל להזמין ולהוסיף לעגלת הקניות</p>
</form>



    
</asp:Content>
