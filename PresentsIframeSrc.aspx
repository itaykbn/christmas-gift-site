<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PresentsIframeSrc.aspx.cs" Inherits="regestrationV2.WebForm10" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <link href="styleSheet.css" type="text/css" media="screen" rel="stylesheet" />
    <style>
        body {
            background-color: palegoldenrod;
        }

        td {
            color: #d4be1c;
            text-align: left;
        }

        pre {
            direction: ltr;
        }
    </style>
</head>
<body>
    <table align="center" style="background-image: url(background1.jpeg)">
        <tr>
            <td>
                <img src="chocolate.jpg" />
            </td>
        </tr>
        <tr>
            <td>price: 20$</td>
        </tr>
        <tr>
            <td>
                <pre> 
Large Christmas Chocolates Selection Box 366g

                 </pre>

            </td>
        </tr>
        <tr>

            <td style="text-align: center">
                <form name="chocolate" method="post">
                    <input name="cartChocolate" type="submit" value="add to cart " />
                </form>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <table align="center" style="background-image: url(background1.jpeg)">
        <tr>
            <td>
                <img height="569px" width="569px" src="christmasBush.jpg" /></td>
        </tr>
        <tr>
            <td>price: 30$</td>
        </tr>
        <tr>
            <td>
                <pre> 
Environmental needle pine artificial christmas wreath 
                 </pre>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <form name="bush" method="post">
                    <input name="cartBush" type="submit" value="add to cart " />
                </form>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <table align="center" style="background-image: url(background1.jpeg)">
        <tr>
            <td>
                <img height="569px" width="569px" src="mug.jpg" /></td>
        </tr>
        <tr>
            <td>price: 60$</td>
        </tr>
        <tr>
            <td>
                <pre> 
Ember Temperature Control Smart Mug
14 oz, 1-hr Battery Life, Black
App Controlled Heated Coffee Mug

                 </pre>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <form name="mug" method="post">
                    <input name="smartMug" type="submit" value="add to cart " />
                </form>
            </td>
        </tr>
    </table>
</body>
</html>
