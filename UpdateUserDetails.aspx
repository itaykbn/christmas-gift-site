<%@ Page Title="Update details" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UpdateUserDetails.aspx.cs" Inherits="regestrationV2.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="updateDetails.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <form name="UpdateForm" onsubmit="return validateForm()" action="UpdateUserDetails.aspx" method="post">

        <table align="center">
            <tr>
                <td>שם פרטי:</td>
                <td>
                    <input type="text" name="fname" value="<%=fName %>" /></td>
                <td>
                    <p style="display: none" id="fName">השם הפרטי יכול להכיל רק אותיות בעברית</p>
                </td>
            </tr>
            <tr>
                <td>שם משפחה</td>
                <td>
                    <input type="text" name="lname" value="<%=lName %>" /></td>
                <td>
                    <p style="display: none" id="lName">שם המשפחה יכול להכיל רק אותיות בעברית</p>
                </td>
            </tr>
            <tr>
                <td>תאריך לידה</td>
                <td>
                    <input type="text" name="bd" value="<%=birthDate %>" /></td>
                <td>
                    <p style="display: none" id="db">אנא להכניס תאריך מלא שמופרד ב- /   </p>
                </td>
            </tr>

            <tr>
                <td>סיסמה</td>
                <td>
                    <input type="password" name="pass" value="<%=password %>" /></td>
                <td>
                    <p style="display: none" id="pass">הסיסמה חייבת להכיל: אותיות גדולות וקטנות באנגלית ומספרים (אורכה 7-10)</p>
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
                    <input type="text" name="address" value="<%=address %>" /></td>

            </tr>
            <tr>
                <td>מייל</td>
                <td>
                    <input type="text" name="mail" value="<%=mail %>" /></td>
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
                    אחר</td>
                <td>
                    <p style="display: none" id="gender">שדה חובה</p>
                </td>
            </tr>
            <tr>
                <td>טלפון</td>
                <td>
                    <input type="text" name="phone" value="<%=phone%>" /></td>
                <td>
                    <p style="display: none" id="phone">הטלפון לא תקין</p>
                </td>
            </tr>
            <tr>
                <td style="width: 144px; margin-right: 115%; display: block;" colspan="2">
                    <input name="updateBtn" type="submit" value="עדכן" /></td>
            </tr>
        </table>
    </form>
</asp:Content>
