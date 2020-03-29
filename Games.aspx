<%@ Page Title="Games" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="regestrationV2.WebForm17" CodeFile="~/Games.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * {
            box-sizing: border-box;
        }

        .column {
            float: left;
            width: 20%;
            padding: 5px;
        }

        /* Clearfix (clear floats) */
        .row::after {
            content: "";
            clear: both;
            display: table;
        }

        .auto-style1 {
            float: left;
            width: 20%;
            padding: 5px;
            margin-left: 400px;
        }

        a {
            color: red;
            opacity: 1;
            display: block;
            width: 100%;
            height: auto;
            transition: .5s ease;
            backface-visibility: hidden;
        }

            a:hover {
                opacity: 0.6;
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
                margin-left: -500px;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <pre>  <a href="MineSweeper.aspx"><img src="MineSweeper.png"></a> <a href="Tetris.aspx"><img src="Tettris.png"></a></pre>--%>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="row" align="center">
        <div class="auto-style1">
            <a href="MineSweeper.aspx">
                <img src="MineSweeper.png"></a>
            <div class="tooltip">
                <p>Rules</p>
                <pre class="tooltiptext">You are presented with a board of squares.
Some squares contain mines (bombs), others don't. 
If you click on a square containing a bomb, you lose. 
If you manage to click all the squares (without clicking on any bombs) you win.
Clicking a square which doesn't have a bomb reveals
the number of neighbouring squares containing bombs.
Use this information plus some guess work to avoid the bombs.
To open a square, point at the square and click on it.
To mark a square you think is a bomb, point and right-click.
</pre>
            </div>
        </div>

        <div class="column">
            <a href="Tetris.aspx">
                <img src="Tettris.png"></a>
            <div class="tooltip">
                <p>Rules</p>
                <pre class="tooltiptext">Tetris has very simple rules: 
you can only move the pieces in specific ways.
your game is over if your pieces reach the top of the screen.
and you can only remove pieces from the screen
by filling all the blank space in a line.
move pieces horizontally with 'A' (left) 'D'(right) 
to rotate them press the left arow key.
</pre>
            </div>
        </div>
        <div class="column">
            <a href="Pong.aspx">
                <img src="pong.png"></a>
            <div class="tooltip">
                <p>Rules</p>
                <pre class="tooltiptext">Pong is a two-dimensional game that simulates table tennis. 
The player controls an in-game paddle by moving it 
vertically across the left or right side of the screen.
They can compete against another player 
controlling a second paddle on the opposing side. 
Players use the paddles to hit a ball back and forth.
First to 7 wins. to move left paddle -'S'(down) & 'W'(up)
to move right paddle - up arrow(up) key down arrow key(down).
</pre>
            </div>
        </div>
    </div>
</asp:Content>

