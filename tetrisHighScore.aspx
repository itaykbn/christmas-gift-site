<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tetrisHighScore.aspx.cs" Inherits="regestrationV2.WebForm22" CodeFile="~/tetrisHighScore.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        @font-face {
            font-family: Arcde;
            src: url(ARCADECLASSIC.TTF);
        }
        body{
            background-color:black;
        }
        table {
            background-color: white;
            align-self: center;
            direction: ltr;
            text-align: center;
            align: center;
            font-family:Arcde;
            font-size:30px;
            width: 1200px;
            padding: 20px; 
            margin-left:20%;
        }
        th{
            border:solid;
            padding: 30px
        }
        td{
            border:solid;
            padding:20px;
        }

    </style>
    <title></title>
</head>
<body>
    <table><%=highScores%></table>
</body>
</html>
