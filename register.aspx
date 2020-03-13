<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="regestrationV2.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>regestration</title>
    <script src="regestation.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1>הכניסו את הפרטים שלכם בשדות הבאים וקבלו את החשבון שלכם</h1>
    <form name="RegestrationForm" onsubmit="return validateForm()" action="Register.aspx" method="post">

        <table align="center">
            <tr>
                <td>שם פרטי:</td>
                <td><input type="text" name="fname"/></td>
                <td><p style="display:none" id="fName">Invalid first name please re-enter</p></td>
            </tr>
            <tr>
                <td>שם משפחה</td>
                <td><input type="text" name="lname" /></td>
                <td><p style="display:none" id="lName">Invalid last name please re-enter</p></td>
            </tr>
            <tr>
                <td>תאריך לידה</td>
                <td><input type="text" name="bd" /></td>
                <td><p style="display:none" id="db">Invalid date of birth please re-enter</p></td>
            </tr>
            <tr>
                <td>גיל</td>
                <td id="age"></td>
            </tr>
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
                <td>אמת סיסמה</td>
                <td><input type="password" name="passConf"/></td>
                <td><p style="display:none" id="passConf">passwords does not match please re-enter</p></td>
            </tr>
            <tr>
                <td>כתובת</td>
                <td><input type="text" name="address"/></td>
               
            </tr>
            <tr>
                <td>מייל</td>
                <td><input type="text" name="mail"/></td>
                <td><p style="display:none" id="mail">Invalid mail please re-enter</p></td>
            </tr>
            <tr>
                <td>מין</td>
                <td><input type="text" name="gender"/></td>
                <td><p style="display:none" id="gender">Invalid gender please re-enter</p></td>
            </tr>
             <tr>
                <td>טלפון</td>
                <td><input type="text" name="phone"/></td>
                <td><p style="display:none" id="phone">Invalid phone please re-enter</p></td>
            </tr>
            <tr>
                <td style="width:144px; margin-right:115%; display:block;" colspan="2"><input name="submit" type="submit" value="הירשם"/></td>
            </tr>
        </table>
    </form>
</asp:Content>
