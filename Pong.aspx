<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pong.aspx.cs" Inherits="regestrationV2.WebForm20" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="pongFavicon.png" />

    <title>Pong</title>
    <script src="/pongData/pongMain.js"></script>
    <script src="/pongData/pongObject.js"></script>
    <script src="/pongData/pongDraw.js"></script>
    <script src="/pongData/pongAnimator.js"></script>
    <style>
        body {
            text-align: center;
            background-color: black;
        }

        input[type=button] {
            direction: ltr;
            font-size: x-large;
            color: white;
            background-color: #24b441;
            width: 200px;
            height: 50px;
        }

        canvas {
            border: solid;
            border-color: gray;
            margin-left: 28%;
        }

        html {
            zoom: 90%;
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
                bottom: -250%;
                left: 50%;
                margin-left: -100px;
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
            font-size: 30px;
        }
    </style>
</head>
<body onload="init('n')">

    <table style="width: 90%">
        <tr>
            <td style="width: 15%; float: left">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <input style="display: none;" id="playAgain" type="button" onclick="clearInterval(interval); init('y')" value="Play" />
                <br />
                <input id="games" type="button" value="Back to games" onclick="window.location.href = 'Games.aspx'" />
                <br />
                <div class="tooltip">
                    <p style="color: white; font-size: 30px">Rules</p>
                    <pre style="font-size: 25px" class="tooltiptext">Pong is a two-dimensional game that simulates table tennis. 
The player controls an in-game paddle by moving it 
vertically across the left or right side of the screen.
controlling a second paddle on the opposing side. 
Players use the paddles to hit a ball back and forth.
First to 7 wins. 
to move left paddle -'S'(down) & 'W'(up)
to move right paddle - up arrow key(up)
down arrow key(down).
</pre>
                </div>
            </td>
            <td style="width: 75%; float: right">
                <pre id="scoreBoard" style="display: none;">                         <span style="color:red;font-size:80px;" id="player1">0 </span>                                       <span style="color:blue ;font-size:80px;" id="player2">0</span></pre>
                <canvas id="myCanvas" width="960" height="720" style="background-image: url('pongBackground.png'); display: none;"></canvas>
            </td>
        </tr>
    </table>


</body>
</html>
