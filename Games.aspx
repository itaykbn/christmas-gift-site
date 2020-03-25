<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="regestrationV2.WebForm17" CodeFile="~/Games.aspx.cs"%>
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
            margin-left: 434px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%-- <pre>  <a href="MineSweeper.aspx"><img src="MineSweeper.png"></a> <a href="Tetris.aspx"><img src="Tettris.png"></a></pre>--%>
    <br />
    <br />
    <div class="row" align="center">
  <div class="auto-style1">
    <a href="MineSweeper.aspx"><img  src="MineSweeper.png"></a>
  </div>
  <div class="column">
     <a href="Tetris.aspx"><img  src="Tettris.png"></a>
  </div>
  <div class="column">
    <a href="Pong.aspx"><img  src="pong.png"></a>
  </div>
</div>
</asp:Content>

