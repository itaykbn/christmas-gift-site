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
                <td><input type="text" name="fname" value="<%=fName %>"/></td>
                <td><p style="display:none" id="fName">Invalid first name please re-enter</p></td>
            </tr>
            <tr>
                <td>שם משפחה</td>
                <td><input type="text" name="lname" value="<%=lName %>"/></td>
                <td><p style="display:none" id="lName">Invalid last name please re-enter</p></td>
            </tr>
            <tr>
                <td>תאריך לידה</td>
                <td><input type="text" name="bd" value="<%=birthDate %>" /></td>
                <td><p style="display:none" id="db">Invalid date of birth please re-enter</p></td>
            </tr>

            <tr>
                <td>סיסמה</td>
                <td><input type="password" name="pass" value="<%=password %>"/></td>
                <td><p style="display:none" id="pass">Invalid password please re-enter</p></td>
            </tr>
            <tr>
                <td>אמת סיסמה</td>
                <td><input type="password" name="passConf"/></td>
                <td><p style="display:none" id="passConf">passwords does not match please re-enter</p></td>
            </tr>
            <tr>
                <td>כתובת</td>
                <td><input type="text" name="address" value="<%=address %>"/></td>
               
            </tr>
            <tr>
                <td>מייל</td>
                <td><input type="text" name="mail" value="<%=mail %>"/></td>
                <td><p style="display:none" id="mail">Invalid mail please re-enter</p></td>
            </tr>
            <tr>
                <td>מין</td>
                <td><input type="text" name="gender" value="<%=gender %>"/></td>
                <td><p style="display:none" id="gender">Invalid gender please re-enter</p></td>
            </tr>
             <tr>
                <td>טלפון</td>
                <td><input type="text" name="phone" value="<%=phone%>"/></td>
                <td><p style="display:none" id="phone">Invalid phone please re-enter</p></td>
            </tr>
            <tr>
                <td style="width:144px; margin-right:115%; display:block;" colspan="2"><input name="updateBtn" type="submit" value="עדכן"/></td>
            </tr>
        </table>
    </form>
</asp:Content>
