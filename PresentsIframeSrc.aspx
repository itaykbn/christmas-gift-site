<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PresentsIframeSrc.aspx.cs" Inherits="regestrationV2.WebForm10" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>presents</title>
    <link href="GeneralStyle.css" type="text/css" media="screen" rel="stylesheet" />
    <style>
        body {
            background-color: palegoldenrod;
        }

        td {
            color: #d4be1c;
            text-align: right;
            font-family: Dorian;
            font-size: x-large;
        }

        input[type=submit] {
            font-family: Dorian;
            font-size: x-large;
        }

        @font-face {
            font-family: 'Dorian';
            src: url('DorianFont.ttf');
        }

        pre {
            direction: rtl;
            font-family: Dorian;
            font-size: x-large;
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
            <td>מחיר: 20$</td>
        </tr>
        <tr>
            <td>
                <pre> 
קופסת בחירה שוקולדים גדולה לחג המולד 366 גרם

                 </pre>

            </td>
        </tr>
        <tr>

            <td style="text-align: center">
                <form name="chocolate" method="post">
                    <input name="cartChocolate" type="submit" value="הוסף לעגלה " />
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
            <td>מחיר: 30$</td>
        </tr>
        <tr>
            <td>
                <pre> 
זר אור מלאכותי מחט סביבתי
</pre>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <form name="bush" method="post">
                    <input name="cartBush" type="submit" value="הוסף לעגלה " />
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
            <td>מחיר: 60$</td>
        </tr>
        <tr>
            <td>
                <pre> 
ספל חכם לבקרת טמפרטורה
חיי סוללה למשך שעה וחצי, שחור
ספל קפה מחומם על ידי אפליקציות

                 </pre>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <form name="mug" method="post">
                    <input name="smartMug" type="submit" value="הוסף לעגלה " />
                </form>
            </td>
        </tr>
    </table>
</body>
</html>
