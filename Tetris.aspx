<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tetris.aspx.cs" Inherits="regestrationV2.WebForm19" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
     body {
    background-image: url('tetrisData/wallper.png'); /*no-repeat center center fixed;*/
    background-size: cover;
    background-size: cover;
    background-size: cover;
    background-size: cover;
}
    </style>
    <title>Tettris</title>
    <script src="tetrisData/tetrisDraw.js"></script>
    <link href="tetrisData/tetrisStyle.css" rel="stylesheet" />
    <script src="tetrisData/tetrisMain.js"></script>
</head>
<body >
    <p > score: <span id="score">0</span> </p>
    <br />
    <br />
    <table id ="grid" style="display:none"> </table>
    <button id="start" onclick="init()" class="button" style="display:block">Start</button>
    <form action="Tetris.aspx" method="post">
    <input class="button" id="gameOver" name="menu" type="submit" value="Menu"/>
         <p>
    <input value="0" type="text" id="scoreDB" name="scoreDB" size="20" style="visibility: hidden"/>
     </p>
    </form>
   
        
</body>
</html>
