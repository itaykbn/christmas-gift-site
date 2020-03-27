<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tetrisGameOver.aspx.cs" Inherits="regestrationV2.WebForm21" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="tetrisData/tetrisStyle.css" rel="stylesheet" />
            <link rel="icon" href="tetrisfavicon.png"/>

    <style>
body {
    background: url(tetrisData/tetrisGameOver.jpg) no-repeat center center fixed;
    background-size: cover;
    background-size: cover;
    background-size: cover;
    background-size: cover;
}
    </style>
    <title>game over</title>
</head>
<body>
    
    <input type="button" style="margin-top:40%" class="button"  value="Play again" onclick="window.location.href = 'Tetris.aspx'" />   
   
    <form >
    <input  type="button" class="button" name="highScores"  value="High scores" onclick="window.location.href = 'tetrisHighScore.aspx'"/>
    </form>
    <input  type="button" class="button" value="Back to games" onclick="window.location.href = 'Games.aspx'" />
        
</body>
</html>
