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

        @font-face {
            font-family: 'Dorian';
            src: url('DorianFont.ttf');
        }

        a {
            color: red;
            opacity: 1;
            display: block;
            width: 100%;
            height: auto;
            transition: .5s ease;
            backface-visibility: hidden;
            font-family:Dorian;
        }
        p{
            font-family:Dorian;
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
                font-family:Dorian;
                border-radius: 6px;
                padding: 5px 0;
                position: absolute;
                z-index: 1;
                bottom: -150%;
                left: 50%;
                margin-left: -500px;
                font-size: 30px;
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
                <p>Summery</p>
                <pre class="tooltiptext">
Minesweeper is a single-player puzzle video game. 
The objective of the game is to clear a rectangular board 
containing hidden "mines" or bombs without detonating any of them,
with help from clues about the number of neighboring mines in each field.
            </div>
        </div>

        <div class="column">
            <a href="Tetris.aspx">
                <img src="Tettris.png"></a>
            <div class="tooltip">
                <p>Summery</p>
                <pre style="bottom: -100%;" class="tooltiptext">Differently shaped forms fall down into a 2D container. 
The forms, which can be moved and rotated, 
must be sorted in "on-the-fly".
</pre>
            </div>
        </div>
        <div class="column">
            <a href="Pong.aspx">
                <img src="pong.png"></a>
            <div class="tooltip">
                <p>Summery</p>
                <pre style="bottom: -70%;" class="tooltiptext">Two players play a video version of table tennis. 
The first to score 11 points wins.
</pre>
            </div>
        </div>
    </div>
</asp:Content>

