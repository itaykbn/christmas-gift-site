<%@ Page Title="AllUsers" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AllUsers.aspx.cs" Inherits="regestrationV2.WebForm3" CodeFile="~/AllUsers.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>List of all users in this site</h1>
    <br />
    <br />
   
    <%--<form id="form1" name="form1" runat="server" >
        <table align="center">
            <tr>
                <td>
                    <span>סנן על פי</span>
                    <select name="where1">
                        <option value="firstName">שם פרטי</option>
                        <option value="lastName">שם משפחה</option>
                        <option value="userName">שם משתמש</option>
                        <option value="email">דוא&quotל</option>
                        <option value="phone">טלפון</option>
                    </select>
                    <input type="text" id="txt1" name="txt1" placeholder="הכנס ערך" />
                </td>
            </tr>

            <tr>
                <td>
                    <span>סנן על פי</span>
                    <select name="where2">
                        <option value="firstName">שם פרטי</option>
                        <option value="lastName">שם משפחה</option>
                        <option value="userName">שם משתמש</option>
                        <option value="email">דוא&quotל</option>
                        <option value="phone">טלפון</option>
                    </select>
                    <input type="text" id="txt2" name="txt2" placeholder="הכנס ערך" />
                    <input type="submit" value="סנן" name="sub" id="sub" />
                </td>
            </tr>
            <tr>
                <td id="err_where" style="color: red; font-weight: bold"></td>
            </tr>
        </table>
    </form>--%>
     <iframe height="800px" width="1300px" style="margin-left: 22%" src="UsersIframeSrc.aspx" name="iframe_b" frameborder="0"></iframe>

</asp:Content>

