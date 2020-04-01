<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="regestrationV2.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>regestration</title>
    <script src="regestation.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 231px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>הכניסו את הפרטים וקבלו את החשבון שלכם</h1>
    <form name="RegestrationForm" onsubmit="return validateForm()" action="Register.aspx" method="post">

        <table align="center">
            <tr>
                <td>שם פרטי:</td>
                <td>
                    <input type="text" name="fname" /></td>
                <td>
                    <p style="display: none" id="fName">השם הפרטי יכול להכיל רק אותיות בעברית</p>
                </td>
            </tr>
            <tr>
                <td>שם משפחה</td>
                <td>
                    <input type="text" name="lname" /></td>
                <td>
                    <p style="display: none" id="lName">שם המשפחה יכול להכיל רק אותיות בעברית</p>
                </td>
            </tr>
            <tr>
                <td>תאריך לידה</td>
                <td>
                    <input type="text" name="bd" /></td>
                <td>
                    <p style="display: none" id="db">אנא להכניס תאריך מלא שמופרד ב- /   </p>
                </td>
            </tr>
            <tr>
                <td>גיל</td>
                <td id="age"></td>
            </tr>
            <tr>
                <td>שם משתמש</td>
                <td>
                    <input type="text" name="un" /></td>
                <td>
                    <p style="display: none" id="un">שם המשתמש יכול להכיל רק את התווים: A-Z או 0-9</p>
                </td>
            </tr>
            <tr>
                <td>סיסמה</td>
                <td>
                    <input type="password" name="pass" /></td>
                <td>
                    <p style="display: none" id="pass">הסיסמה חייבת להכיל: אותיות גדולות וקטנות באנגלית ומספרים (אורכה 7-10) </p>
                </td>
            </tr>
            <tr>
                <td>אמת סיסמה</td>
                <td>
                    <input type="password" name="passConf" /></td>
                <td>
                    <p style="display: none" id="passConf">הסיסמאות לא תואמות</p>
                </td>
            </tr>
            <tr>
                <td>כתובת</td>
                <td>
                    <input type="text" name="address" /></td>

            </tr>
            <tr>
                <td>מייל</td>
                <td>
                    <input type="text" name="mail" /></td>
                <td>
                    <p style="display: none" id="mail">המייל לא תקין</p>
                </td>
            </tr>
            <tr>
                <td>מין</td>
                <td>
                    <input type="radio"id="gender_Male" name="gender" value="male" />
                    זכר<br>
                    <input type="radio" id="gender_Female" name="gender" value="female" />
                    נקבה<br>
                    <input type="radio" id="gender_Other" name="gender" value="other" />
                    אחר
                </td>
                <td>
                    <p style="display: none" id="gender">שדה חובה</p>
                </td>
            </tr>
            <tr>
                <td>טלפון</td>
                <td>
                    <input type="text" name="phone" /></td>
                <td>
                    <p style="display: none" id="phone">הטלפון לא תקין</p>
                </td>
            </tr>
            <tr>

                <td colspan="2">
                    <input style="margin-right: 220px" name="submit" type="submit" value="הירשם" class="auto-style1" /></td>
            </tr>
        </table>

    </form>
</asp:Content>
