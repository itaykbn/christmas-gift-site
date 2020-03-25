<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pong.aspx.cs" Inherits="regestrationV2.WebForm20" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        input[type=button]{
            direction:ltr;
            font-size: x-large;
            
            
            
            background-color:green;
        }
        canvas{
            border:solid;
            border-color:gray;
            margin-left:28%;
        }
    </style>
</head>
<body>
    <br />
    <br />
    <pre id="scoreBoard" style="display:none;"> <span style="color:red;font-size:80px;" id="player1">0 </span>                                                                                  <span style="color:blue ;font-size:80px;" id="player2">0</span></pre>  
    <br />
    <br /> 
    <br />
    <canvas id="myCanvas" width="960" height="720" style="background-image:url('pongBackground.png'); display:none;"></canvas>
    <br />
    <input id="start" type="button" onclick="init()" value="start game"/> 
    <input style="display:none;" id="playAgain" type="button" onclick="clearInterval(interval); init()" value="Play again"/>
    <input id="games" type="button"  value="Back to games" onclick="window.location.href = 'Games.aspx'" />
  
    <input type="button" onclick="alert('paused')" value="time out" />
   </body>
</html>
