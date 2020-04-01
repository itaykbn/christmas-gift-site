<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tetris.aspx.cs" Inherits="regestrationV2.WebForm19" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="tetrisfavicon.png" />
    <style>
        body {
            background-image: url('tetrisData/wallper.png'); /*no-repeat center center fixed;*/
            background-size: cover;
            background-size: cover;
            background-size: cover;
            background-size: cover;
        }

        html {
            zoom: 80%;
        }

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
                bottom: -180%;
                left: 50%;
                margin-left: -300px;
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
    </style>
    <title>Tettris</title>
    <script src="tetrisData/tetrisDraw.js"></script>
    <link href="tetrisData/tetrisStyle.css" rel="stylesheet" />
    <script src="tetrisData/tetrisMain.js"></script>
</head>
<body onload="init('n')">

    
    <br />
    <br />
    <table style="width: 100%">
        <tr>
        <td style="width: 8%; float: right;margin-top:250px">
            <button id="start" onclick="init('y')" class="button" style="display: block">Start</button>
            <form action="Tetris.aspx" method="post">
                <input class="button" id="gameOver" name="menu" type="submit" value="Menu" />
                <p>
                    <input value="0" type="text" id="scoreDB" name="scoreDB" size="20" style="visibility: hidden" />
                </p>
            </form>
            <div class="tooltip">
                <p>Rules</p>
                <pre style="font-size:30px" class="tooltiptext">Tetris has very simple rules: 
you can only move the pieces in specific ways.
your game is over if your pieces reach the top of the screen.
and you can only remove pieces from the screen
by filling all the blank space in a line.
move pieces horizontally with 'A' (left) 'D'(right) 
to rotate them press the left arow key.
</pre>
            </div>
        </td>
        <td  style="width: 90%;  ">
            <p style="margin-left:350px">score: <span id="score">0</span> </p>
            <table style="margin-left:800px" id="grid"></table>
        </td>
        </tr>
    </table>


</body>
</html>
