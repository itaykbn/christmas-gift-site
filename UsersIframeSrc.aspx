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
    void Button2_Click(object sender, EventArgs e)
    {
        if (Request.Form["demo2"] != "")
        {
            Session["UpdateByAdmin"] = Request.Form["demo2"];
            Response.Redirect("UpdateUserAdmin.aspx");
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
    <link href="GeneralStyle.css" type="text/css" media="screen" rel="stylesheet" />
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



        option {
            color: black;
            display: block;
            font-size: 30px;
            text-align: center;
        }


        select {
            color: black;
            display: block;
            font-size: 30px;
            text-align: center;
        }

        span {
            color: black;
            display: block;
            font-size: 30px;
            text-align: center;
        }

        @font-face {
            font-family: 'Dorian';
            src: url('DorianFont.ttf');
        }

        p {
            font-family: Dorian;
        }


        body {
            background-color: navajowhite;
        }

        input[type='checkbox'] {
            -webkit-appearance: none;
            width: 30px;
            height: 30px;
            background: white;
            border-radius: 5px;
            border: 2px solid #555;
        }

            input[type='checkbox']:checked {
                background: red;
            }

            input[type='checkbox']::after {
                background: white;
            }

        input[type=checkbox]:focus {
            outline: none;
        }
    </style>
    <title>All Users</title>
</head>
<body>

    <p style="color: black">ניתן לעדכן רק משתמש אחד בכל פעם לכן הסימון נחשב רק למשתמש אחד</p>

    <form id="form1" runat="server" name="form1" method="post">
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


        <br />
        <br />
        <table align="center" class="zui-table" id="myTable" style="direction: rtl; text-align: right; padding-top: 10px; padding-bottom: 10px;"><%=userTable %></table>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 


        <asp:Button ID="Button1" Width="300px"
            Text="מחק משתמשים"
            OnClientClick="checkDel()"
            runat="server" OnClick="Button1_Click" />

        <asp:Button ID="Button2"
            Width="300px"
            Text="עדכן משתמש"
            runat="server" OnClick="Button2_Click" />

        <p>
            <input type="text" id="demo2" name="demo2" size="20" style="display: none" />
        </p>
        <p>
            <input type="text" id="demo" name="demo" size="20" style="display: none" />
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
        function checkUpdate(id) {
            var userName;
            var remove = false;
            if (document.getElementById(id).checked == false) {
                remove = true;
            }
            for (var i = 1; i < document.getElementById("myTable").rows.length; i++) {
                if (i - 1 == id && !remove) {
                    document.getElementById(i - 1).checked = true;

                }
                else {
                    document.getElementById(i - 1).checked = false;

                }
            }
            //if (document.getElementById("myTable").rows[id + 1].cells[7].checked == false) {
            //    remove = true;
            //}
            //for (var i = 0; i < document.getElementById("myTable").rows.length; i++) {

            //    if (i != 0 && i != id + 1) {
            //        //alert("unchecked");
            //        document.getElementById("myTable").rows[i].cells[7].checked = false;

            //    }
            //}

            userName = document.getElementById("myTable").rows[id + 1].cells[2].innerHTML;
            if (remove) {
                userName = "";
            }
            document.getElementById("demo2").value = userName;
        }
    </script>
</body>
</html>
