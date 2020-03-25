/** this class is responsible for the visual side 
 it has methods that their purpose is to render the drawings to the canvas*/
class Draw {

    // class constructor
    constructor(c, ctx) {
        this.c = c;
        this.ctx = ctx;
    }
    // draws the ball to the canvas
    drawBall(ball, drawColor, strokeColor = "black", lineWidth = 0) {
        this.ctx.fillStyle = drawColor;
        this.ctx.strokeStyle = strokeColor;
        this.ctx.lineWidth = lineWidth;
        this.ctx.beginPath();
        this.ctx.arc(ball.x, ball.y, ball.w, 0, 2 * Math.PI);
        this.ctx.fill();
        this.ctx.stroke();

    }
    //draws rects of eny sort to the canvas
    drawRect(rect, drawColor, strokeColor = "black", lineWidth = 0) {
        this.ctx.beginPath();

        this.ctx.fillStyle = drawColor;
        this.ctx.strokeStyle = strokeColor;
        this.ctx.fillRect(rect.x, rect.y, rect.w, rect.h);
        this.ctx.lineWidth = lineWidth;
        this.ctx.strokeRect(rect.x, rect.y, rect.w, rect.h);
    }



}