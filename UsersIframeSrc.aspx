﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersIframeSrc.aspx.cs" Inherits="regestrationV2.WebForm15" CodeFile="~/UsersIframeSrc.aspx.cs" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="regestrationV2.services" %>
<%@ Import Namespace="regestrationV2" %>

<script runat="server">
    private DBAccesor dbAccessor = ServiceLocator.Instance.GetService<DBAccesor>();
    void Button1_Click(object sender, EventArgs e)
    {
        if (Request.Form["demo"] != "()")
        {

            deleteWhere = Request.Form["demo"];

        }
        else
        {
            deleteWhere = "";
        }
        if (deleteWhere != "")

        {


            string cmdString = string.Format($"DELETE From Cart Where OrderId in (select c.OrderId from Cart c, UserDetails ud  where c.UserName = ud.UserName and ud.UserName in {deleteWhere}) Delete FROM UserDetails Where (UserName in {deleteWhere})");
            dbAccessor.runSqlCommand(cmdString);
            Response.Redirect("UsersIframeSrc.aspx");

        }
    }


</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css"/>--%>


    <script type="text/javascript" charset="utf-8" src=" https://requirejs.org/docs/release/2.3.5/minified/require.js"></script>
    <link href="styleSheet.css" type="text/css" media="screen" rel="stylesheet" />
    <style>
        /* width */
        ::-webkit-scrollbar {
            width: 20px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #888;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #555;
            }
    </style>
    <title></title>
</head>
<body>



    <form id="form1" runat="server">

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
                    <span>= </span>
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
                    <span>= </span>
                    <input type="text" id="txt2" name="txt2" placeholder="הכנס ערך" />
                    <input type="submit" value="סנן" name="sub" id="sub" />
                </td>
            </tr>
            <tr>
                <td id="err_where" style="color: red; font-weight: bold"></td>
            </tr>
        </table>
        <br />
        <br />
        <table align="center" id="myTable" style="direction: rtl; text-align: right; padding-top: 10px; padding-bottom: 10px;"><%=userTable %></table>
        <asp:Button ID="Button1"
            Text="מחק משתמשים"
            OnClientClick="checkDel()"
            runat="server" OnClick="Button1_Click" />
        <p>
            <input type="text" id="demo" name="demo" size="20" style="visibility: hidden" />
        </p>
    </form>
    <%--    <script>
        var $ = require("jquery");
        var dt = require("datatables.net")();
        $(document).ready(function () {
            $('#myTable').DataTable();
        });

    </script>--%>
    <script>
        function checkDel() {
            var usersNames = [];
            var positions = 0;
            var chkStr = "chk";
            for (var i = 1; i < document.getElementById("myTable").rows.length; i++) {
                if (document.getElementById(chkStr + (i - 1)).checked == true) {
                    usersNames[positions] = document.getElementById("myTable").rows[i].cells[2].innerHTML;
                    positions++;
                }
            }
            
            sqlStr = "(";
            for (var i = 0; i < positions; i++) {
                alert(usersNames[i]);
                sqlStr += "N'" + usersNames[i] + "'";
                if (i < positions - 1) {
                    sqlStr += ", ";
                }
            }
            sqlStr += ")";
            document.getElementById("demo").value = sqlStr;
        }

    </script>
</body>
</html>
