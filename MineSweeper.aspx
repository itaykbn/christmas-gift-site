<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MineSweeper.aspx.cs" Inherits="regestrationV2.WebForm18" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="mineSweeperData/mineSweeperStyle.css" rel="stylesheet" />
    <script src="/mineSweeperData/mineSweeperMain.js"></script>
    <link rel="icon" href="mineSweeperFavicon.ico" />
    
    <title>MineSweeper</title>
</head>
<body>
    <h1>MineSweeper</h1>

    <br />
    <table style="width: 90%">
        <tr>
            <td style="width: 85%">
                <table style="width: 100%" id="grid"></table>
            </td>
            <td style="width: 15%; float: left">
                <button class="button" id="easy" onclick="difficulty('ez')">easy</button>
                <button class="button" id="medium" onclick="difficulty('mid')">medium</button>
                <button class="button" id="hard" onclick="difficulty('hard')">hard</button>
                <input class="button" id="games" type="button" value="Back to games" onclick="window.location.href = 'Games.aspx'" />

            </td>
        </tr>
    </table>
    <br />
    <%--<button id="playAgain" style="display:none;" onclick="difficulty()"> play again</button>--%>
</body>
</html>
