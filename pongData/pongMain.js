
var c;
var ctx;
var animator;
var ball;
var lPane;
var rPane;
var upArrow = false;
var downArrow = false;
var wKey = false;
var interval;
var sKey = false;
//function that initializes the canvas and switches css styles for the start of the game
function init() {
    c = document.getElementById("myCanvas");
    ctx = c.getContext('2d');
    animator = new Animate(c);
    document.getElementById("start").style.display = "none";
    document.getElementById("games").style.display = "none";
    document.getElementById("scoreBoard").style.display = "block";
    document.getElementById("myCanvas").style.display = "block";
    document.getElementById("playAgain").style.display = "block";
    document.getElementById("player2").innerHTML = 0;
    document.getElementById("player1").innerHTML = 0;

    start();
}
// the main funcrion where everything gets called from
function start() {
    ball = new Obj(c.width / 2, c.height / 2, 15, 15, 10, 10);
    lPane = new Obj(30, c.height / 2, 20, 100, 30, 30);
    rPane = new Obj(c.width - 50, c.height / 2, 20, 100, 30, 30);
    var draw = new Draw(c, ctx);
    // the game loop(interval)
    interval = setInterval(function () {

        document.addEventListener("keydown", keyDownHandler, false);
        document.addEventListener("keyup", keyUpHandler, false);
        ctx.clearRect(0, 0, c.width, c.height);
        if (sKey) {
            lPane = animator.movePane(lPane, "down");
        }
        else if (wKey) {
            lPane = animator.movePane(lPane, "up");
        }


        if (upArrow) {
            rPane = animator.movePane(rPane, "up");

        }
        else if (downArrow) {
            rPane = animator.movePane(rPane, "down");
        }

        ball = animator.moveBall(ball, lPane, rPane);
        draw.drawRect(lPane, "white");
        draw.drawRect(rPane, "white")
        draw.drawBall(ball, "yellow");

        if (animator.score1 == 7 || animator.score2 == 7) {
            ctx.fillStyle = "black";
            ctx.fillRect(0, 0, c.width, c.height);
            if (animator.score2 == 7) {

                ctx.fillStyle = "blue";
                ctx.font = "80px Arial";
                ctx.fillText("Player 2 is the winner", 100, c.height / 2);
            }
            else {

                ctx.fillStyle = "red";
                ctx.font = "80px Arial";
                ctx.fillText("Player 1 is the winner", 100, c.height / 2);
            }
            document.getElementById("playAgain").style.display = "block";
            document.getElementById("games").style.display = "block";

            clearInterval(interval);

        }



    }, 30)
    // handles all keyDown events
    function keyDownHandler(event) {

        switch (event.keyCode) {

            case 83:
                sKey = true;

                break;

            case 87:
                wKey = true;
                break;
            case 40:
                downArrow = true;

                break;
            case 38:
                upArrow = true;
                break;
            case 80:
                alert("paused");
                break;
            //case 82:
            //    clearInterval(interval);
            //    init();
            //    break;
            default:
                console.log("this key is not bound");
                break;
        }
    }
    // handles all keyUp events
    function keyUpHandler(event) {

        switch (event.keyCode) {

            case 83:
                sKey = false;

                break;

            case 87:
                wKey = false;
                break;
            case 40:
                downArrow = false;

                break;
            case 38:
                upArrow = false;
            default:
                console.log("this key is not bound");
                break;
        }
    }
}
