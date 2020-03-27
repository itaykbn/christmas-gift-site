<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UpdateAdminDetails.aspx.cs" Inherits="regestrationV2.WebForm23" CodeFile="~/UpdateAdminDetails.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="adminUpdateDetails.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
    <br /> 
    <br />
    <br />
     <form name="UpdateForm" onsubmit="return validateForm()" action="UpdateAdminDetails.aspx" method="post">

        <table align="center">
            <tr>
                <td>שם פרטי</td>
                <td><input type="text" name="fname" value="<%=fName %>"/></td>
                <td><p style="display:none" id="fName">Invalid first name please re-enter</p></td>
            </tr>
            <tr>
                <td>שם משפחה</td>
                <td><input type="text" name="lname" value="<%=lName %>"/></td>
                <td><p style="display:none" id="lName">Invalid last name please re-enter</p></td>
            </tr>
            <tr>
            <tr>
                <td>סיסמה</td>
                <td><input type="password" name="pass" value="<%=password %>"/></td>
                <td><p style="display:none" id="pass">Invalid password please re-enter</p></td>
            </tr>
            <tr>
                <td>אמת סיסמה</td>
                <td><input type="password" name="passConf"/></td>
                <td><p style="display:none" id="passConf">passwords do not match please re-enter</p></td>
            </tr>
            <tr>
                <td>מייל</td>
                <td><input type="text" name="mail" value="<%=mail %>"/></td>
                <td><p style="display:none" id="mail">Invalid mail please re-enter</p></td>
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
