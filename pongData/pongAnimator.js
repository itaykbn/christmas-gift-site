
/** the animator class is responsible for all the game logic and to move objects around the canvas and outside it... */


class Animate {
    //the class cunstroctor
    constructor(c) {
        this.c = c;
    }
    score1 = 0;
    score2 = 0;

    //moves the paddel and returns the updated object pane
    movePane(pane, dir) {
        if (dir == "up") {
            if (pane.y > 0) {
                pane.y -= pane.speedY;
            }
        }
        if (dir == "down") {
            if (pane.y < this.c.height - pane.h) {
                pane.y += pane.speedY;
            }
        }
        return pane;
    }
    //responsible for moving the ball and ball logic e.g - checks when player loses or whwn ball hits the paddel or border
    // the method returns an updated object of the obj class(ball)
    moveBall(ball, lPane, rPane, ) {
        var hitRightPane = (ball.y >= rPane.y - 5) && (ball.y <= (rPane.y + rPane.h + 2));
        var hitLeftPane = (ball.y >= lPane.y - 5) && (ball.y <= (lPane.y + lPane.h + 2));
        var score2 = document.getElementById("player2");
        var score1 = document.getElementById("player1");


        if (ball.y == 0 || ball.y == c.height) {

            ball.speedY = -ball.speedY;



        }
        if (ball.x <= 0 || ball.x >= c.width) {

            if (ball.x <= 0) {
                this.score2++;

                ball.speedX = -10;
                ball.speedY = -10;

                score2.innerHTML = this.score2;
            }
            else {
                this.score1++;

                ball.speedX = 10;
                ball.speedY = 10;
                score1.innerHTML = this.score1;

            }
            ball.x = c.width / 2;
            ball.y = c.height / 2;
            return ball

        }
        if (ball.x <= lPane.x + lPane.w && hitLeftPane) {
            ball.speedX -= 1;
            ball.speedX = -ball.speedX;


        }
        if (ball.x >= rPane.x - rPane.w && hitRightPane) {
            ball.speedX += 1;
            ball.speedX = -ball.speedX;

        }

        ball.x += ball.speedX;
        ball.y += ball.speedY;
        return ball;


    }
}