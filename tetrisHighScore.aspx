<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tetrisHighScore.aspx.cs" Inherits="regestrationV2.WebForm22" CodeFile="~/tetrisHighScore.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>High scores</title>
<link rel="icon" href="tetrisfavicon.png"/>

    <style>
        @font-face {
            font-family: Arcde;
            src: url(ARCADECLASSIC.TTF);
        }

        body {
            background-color: black;
        }

        table {
            background-color: white;
            align-self: center;
            direction: ltr;
            text-align: center;
            align: center;
            font-family: Arcde;
            font-size: 30px;
            width: 1200px;
            padding: 20px;
            margin-left: 20%;
        }

        th {
            border: solid;
            padding: 30px
        }

        td {
            border: solid;
            padding: 20px;
        }

        .button {
            background-color: green;
            font-family: Arcde;
            font-size: xx-large;
            margin-left: 45%;
            font-weight: bold;
            width: 250px;
            height: 50px;
            border-color: white;
        }
    </style>
</head>
<body>
    <input type="button" class="button" value="Menu" onclick="window.location.href = 'tetrisGameOver.aspx'" />
    <br />
    <br />
    <table><%=highScores%></table>

</body>
</html>
