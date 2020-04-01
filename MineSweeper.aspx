<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MineSweeper.aspx.cs" Inherits="regestrationV2.WebForm18" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="mineSweeperData/mineSweeperStyle.css" rel="stylesheet" />
    <script src="/mineSweeperData/mineSweeperMain.js"></script>
    <link rel="icon" href="mineSweeperFavicon.ico" />

    <title>MineSweeper</title>
    <style>
        .tooltip {
            position: relative;
            display: inline-block;
            border-bottom: 1px dotted black;
        }

            .tooltip .tooltiptext {
                visibility: hidden;
                width: unset;
                background-color: black;
                color: #fff;
                text-align: left;
                border-radius: 6px;
                padding: 5px 0;
                position: absolute;
                z-index: 1;
                bottom: -340%;
                left: 50%;
                margin-left: -70px;
                font-size: 35px;
                /* Fade in tooltip - takes 1 second to go from 0% to 100% opac: */
                opacity: 0;
                transition: opacity 1s;
            }

            .tooltip:hover .tooltiptext {
                visibility: visible;
                opacity: 1;
            }

        pre {
            font-size: 30px
        }

        p {
            font-size: 30px
        }
    </style>
</head>
<body onload="init()">

    <br />
    <table style="width: 80%">
        <tr>
            <td style="width: 75%">
                <h1>MineSweeper</h1>
                <%--<img  id="introImage" src="mineSweeperData/intoScreen.png" />--%>
                <table style="width: 100%" id="grid"></table>
            </td>
            <td style="width: 15%; float: left">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />

                <button class="button" id="easy" onclick="difficulty('ez')">easy</button>
                <button class="button" id="medium" onclick="difficulty('mid')">medium</button>
                <button class="button" id="hard" onclick="difficulty('hard')">hard</button>
                <input class="button" id="games" type="button" value="Back to games" onclick="window.location.href = 'Games.aspx'" />
                <br />
                <br />
                <br />
                <div class="tooltip">

                    <p style="margin-left: 100px">Rules</p>
                    <pre style="font-size: 25px" class="tooltiptext">You are presented with a board of squares.
Some squares contain mines (bombs), others don't. 
If you click on a square containing a bomb, you lose. 
If you manage to click all the squares 
(without clicking on any bombs) you win.
Clicking a square which doesn't have a bomb reveals
the number of neighbouring squares containing bombs.
Use this information plus some guess work to avoid the bombs.
To open a square, point at the square and click on it.
To mark a square you think is a bomb, point and right-click.
</pre>
                </div>

            </td>

        </tr>
    </table>
    <br />

</body>
</html>
