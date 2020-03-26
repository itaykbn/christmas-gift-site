var grid;
var pen;
var shape;
var size = 19;
var score;
var blockCount;
var faze;
var unactive;
var mainInterval;
var moveHorizont;
again = false;
function init() {
    document.getElementById("grid").style.display = "block";
    document.getElementById("gameOver").style.display = "none";
    document.getElementById("start").style.display = "none";

    unactive = false;
    faze = 0;
    grid = document.getElementById("grid");
    grid.innerHTML = "";
    score = 0;
    for (var i = 0; i < size; i++) {
        row = grid.insertRow(i);
        for (var j = 0; j < size; j++) {
            cell = row.insertCell(j);
            active = document.createAttribute("active");
            static = document.createAttribute("static");
            point = document.createAttribute("point");
            active.value = "false";
            point.value = "false";
            static.value = "false";
            cell.className = "none";
            cell.setAttributeNode(point);
            cell.setAttributeNode(active);
            cell.setAttributeNode(static);
        }
    }
    main();

}
function main() {
    pen = new Draw();
    shape = generateShape();
    blockCount = activateShape();



    mainInterval = setInterval(function () {
        if (!unactive) {
            moveHorizont = setInterval(function () {
                if (!unactive) {
                    document.addEventListener("keydown", keyDownHandler, false);
                }
            }
                , 130);
            Drawbackground();
            var value = moveObj();
            checkLine();

            if (value == "true") {
                faze = 0;
                shape = generateShape();
                blockCount = activateShape();
            }
            else if (value == "gg") {
                //alert("Game-Over");
                document.getElementById("gameOver").style.display = "block";
                document.getElementById("scoreDB").value = score;
                //alert(document.getElementById("scoreDB").value);
                unactive = true;

            }

        }
    }
        , 200);

}
function moveObj() {
    var stopped = "false";
    var found = 0;
    var stopAll = false;
    var pointFound = false;
    var point;
    for (var i = size - 1; i >= 0; i--) {

        for (var j = 0; j < size; j++) {
            var currcell = grid.rows[i].cells[j];
            var cellRow = currcell.parentNode.rowIndex;
            var cellCol = currcell.cellIndex;
            if (currcell.getAttribute("point") == "true") {
                point = currcell;
            }
            if (currcell.getAttribute("active") == "true" && found <= blockCount) {


                currcell.setAttribute("active", "false");
                pen.remove(currcell);
                found++;

                if (cellRow == size - 1) {
                    currcell.setAttribute("static", "true");
                    if (currcell == point) {
                        currcell.setAttribute("point", "false");
                    }
                    pen.draw(currcell, shape);
                    //clearActive();
                    stopAll = true;

                    stopped = "true";

                }
                else if (grid.rows[cellRow + 1].cells[cellCol].getAttribute("static") == "true") {
                    if (cellRow == 0) {
                        currcell.setAttribute("static", "true");
                        pen.draw(currcell, shape);
                        clearInterval(moveHorizont);
                        clearInterval(mainInterval);
                        return "gg";
                    }
                    if (currcell == point) {
                        currcell.setAttribute("point", "false");
                    }
                    currcell.setAttribute("static", "true");
                    pen.draw(currcell, shape);
                    stopAll = true;
                    stopped = "true";

                }
                else if (grid.rows[cellRow + 1].cells[cellCol].getAttribute("static") == "false") {
                    var nextCell = grid.rows[cellRow + 1].cells[cellCol];
                    nextCell.setAttribute("active", "true");
                    if (currcell == point && !pointFound) {
                        nextCell.setAttribute("point", "true");
                        currcell.setAttribute("point", "false");
                        pointFound = true;
                    }
                    pen.draw(nextCell, shape);

                }

            }


        }

    }
    if (stopAll) {

        stopUnit();
        stopped = "true";
    }

    return stopped;
}
function checkLine() {

    for (var i = size - 1; i >= 0; i--) {
        var hole = 0;
        for (var j = 0; j < size; j++) {
            var currcell = grid.rows[i].cells[j];
            var cellRow = currcell.parentNode.rowIndex;
            var cellCol = currcell.cellIndex;
            if (currcell.getAttribute("static") == "false") {
                hole++;
            }
            if (j == size - 1 && hole == 0) {
                //alert(cellRow);
                score += 100;
                document.getElementById("score").innerHTML = score;
                moveDown(cellRow);
                //reDraw();
            }
        }
    }
}
function moveDown(rowNum) {

    for (var i = size - 1; i >= 0; i--) {
        var rowPattern = [];

        for (var j = 0; j < size; j++) {
            var currcell = grid.rows[i].cells[j];
            var cellRow = currcell.parentNode.rowIndex;
            var cellCol = currcell.cellIndex;
            var class_name = currcell.className;
            rowPattern.push(class_name);
            if (currcell.getAttribute("static") == "true") {
                var nextCell;

                if (cellRow == rowNum) {
                    currcell.setAttribute("static", "false");
                    pen.remove(currcell);
                }
                else if (cellRow < rowNum) {
                    pen.remove(currcell);

                    nextCell = grid.rows[cellRow + 1].cells[cellCol];
                    currcell.setAttribute("static", "false");
                    nextCell.setAttribute("static", "true");
                    reDraw(rowPattern, i + 1);

                }
            }

        }
    }
}
function reDraw(rowPattern, rowNum) {

    for (var i = 0; i < size; i++) {

        var currCell = grid.rows[rowNum].cells[i];

        currCell.className = rowPattern[i];
    }
} // move to draw
function Drawbackground() {
    for (var i = 0; i < size; i++) {
        for (var j = 0; j < size; j++) {
            var currCell = grid.rows[i].cells[j];
            if (currCell.getAttribute("active") == "false" && currCell.getAttribute("static") == "false") {
                pen.remove(currCell);
            }
        }
    }
} // move to draw
function moveRight(shape) {
    var found = 0;
    var moveArr = [];
    var stopped = false;
    var point;

    for (var i = size - 1; i >= 0; i--) {

        for (var j = size - 1; j >= 0; j--) {

            var currcell = grid.rows[i].cells[j];
            if (currcell.getAttribute("active") == "false") {
                var index = moveArr.indexOf(currcell);

                if (index > -1) {
                    arr.splice(index, 1);
                }

            }
            if (currcell.getAttribute("point") == "true") {
                point = currcell;
            }

            var cellRow = currcell.parentNode.rowIndex;
            var cellCol = currcell.cellIndex;

            if (currcell.getAttribute("active") == "true" && found <= blockCount) {

                found++;
                currcell.setAttribute("active", "false");
                pen.remove(currcell, shape);


                var nextCell;
                if (cellCol < size - 1) {
                    nextCell = grid.rows[cellRow].cells[cellCol + 1];
                    if (nextCell.getAttribute("static") == "true") {
                        nextCell = currcell;

                        found = blockCount + 1;
                        stopped = true;

                    }
                    else {

                        moveArr.push(nextCell);

                    }

                }
                else {
                    nextCell = currcell;
                    found = blockCount + 1;
                    stopped = true;

                }
                nextCell.setAttribute("active", "true");
                if (currcell == point) {
                    currcell.setAttribute("point", "false");
                    nextCell.setAttribute("point", "true");
                }
                pen.draw(nextCell, shape);
            }
        }
    }
    if (stopped && moveArr != null) {
        correctMoved("R", moveArr, point);
    }


}
function moveLeft(shape) {
    var found = 0;
    var stopped = false;
    var moveArr = [];
    var point;
    for (var i = size - 1; i >= 0; i--) {
        for (var j = 0; j < size; j++) {
            var currcell = grid.rows[i].cells[j];
            var cellRow = currcell.parentNode.rowIndex;
            var cellCol = currcell.cellIndex;
            if (currcell.getAttribute("active") == "false") {
                var index = moveArr.indexOf(currcell);

                if (index > -1) {
                    arr.splice(index, 1);
                }

            }
            if (currcell.getAttribute("point") == "true") {
                point = currcell;
            }
            if (currcell.getAttribute("active") == "true" && found <= blockCount) {
                found++;
                currcell.setAttribute("active", "false");
                pen.remove(currcell);
                var nextCell;
                if (cellCol > 0) {
                    nextCell = grid.rows[cellRow].cells[cellCol - 1];
                    if (nextCell.getAttribute("static") == "true") {
                        nextCell = currcell;
                        found = blockCount + 1;
                        stopped = true;
                    }
                    else {
                        moveArr.push(nextCell);
                    }

                }
                else {
                    nextCell = currcell;
                    found = blockCount + 1;
                    stopped = true;

                }
                if (currcell == point) {

                    currcell.setAttribute("point", "false");
                    nextCell.setAttribute("point", "true");
                }
                nextCell.setAttribute("active", "true");
                pen.draw(nextCell, shape);

            }
        }
    }
    if (stopped && moveArr != null) {
        // alert("stopped");
        correctMoved("L", moveArr, point);
    }
}
function keyDownHandler(event) {
    switch (event.keyCode) {
        case 65: {
            moveLeft();
            break;
        }
        case 68:
            {
                moveRight();
                break;
            }
        case 37: {
            rotateRight();
            break;
        }



    }

}
function generateShape() {
    return Math.floor(Math.random() * 7); 7


}
function activateShape() {
    var midCell = (size + 1) / 2;
    switch (shape) {
        case 0: {
            // aproved
            grid.rows[0].cells[midCell].setAttribute("active", "true");
            pen.draw(grid.rows[0].cells[midCell], shape);
            grid.rows[1].cells[midCell].setAttribute("active", "true");
            grid.rows[1].cells[midCell].setAttribute("point", "true");
            pen.draw(grid.rows[1].cells[midCell], shape);
            grid.rows[0].cells[midCell + 1].setAttribute("active", "true");
            pen.draw(grid.rows[0].cells[midCell + 1], shape);
            grid.rows[1].cells[midCell - 1].setAttribute("active", "true");
            pen.draw(grid.rows[1].cells[midCell - 1], shape);
            return 4;
            break;
        } //done
        case 1: {
            grid.rows[0].cells[midCell].setAttribute("active", "true");
            pen.draw(grid.rows[0].cells[midCell], shape);
            grid.rows[1].cells[midCell].setAttribute("active", "true");
            grid.rows[1].cells[midCell].setAttribute("point", "true");
            pen.draw(grid.rows[1].cells[midCell], shape);
            grid.rows[1].cells[midCell + 1].setAttribute("active", "true");
            pen.draw(grid.rows[1].cells[midCell + 1], shape);
            grid.rows[1].cells[midCell - 1].setAttribute("active", "true");
            pen.draw(grid.rows[1].cells[midCell - 1], shape);
            return 4;
            break;
        } //done
        case 2: {

            grid.rows[0].cells[midCell].setAttribute("active", "true");
            pen.draw(grid.rows[0].cells[midCell], shape);
            grid.rows[1].cells[midCell].setAttribute("active", "true");
            pen.draw(grid.rows[1].cells[midCell], shape);
            grid.rows[2].cells[midCell].setAttribute("active", "true");
            grid.rows[2].cells[midCell].setAttribute("point", "true");
            pen.draw(grid.rows[2].cells[midCell], shape);
            grid.rows[3].cells[midCell].setAttribute("active", "true");
            pen.draw(grid.rows[3].cells[midCell], shape);

            return 4;
            break;
        } //done
        case 3: {
            grid.rows[0].cells[midCell].setAttribute("active", "true");
            pen.draw(grid.rows[0].cells[midCell], shape);
            grid.rows[1].cells[midCell].setAttribute("active", "true");
            grid.rows[1].cells[midCell].setAttribute("point", "true");
            pen.draw(grid.rows[1].cells[midCell], shape);
            grid.rows[0].cells[midCell - 1].setAttribute("active", "true");
            pen.draw(grid.rows[0].cells[midCell - 1], shape);
            grid.rows[1].cells[midCell + 1].setAttribute("active", "true");
            pen.draw(grid.rows[1].cells[midCell + 1], shape);
            return 4;
            break;
        } //done
        case 4: {
            grid.rows[0].cells[midCell].setAttribute("active", "true");
            grid.rows[0].cells[midCell].setAttribute("point", "true");
            pen.draw(grid.rows[0].cells[midCell], shape);
            grid.rows[1].cells[midCell].setAttribute("active", "true");
            pen.draw(grid.rows[1].cells[midCell], shape);
            grid.rows[1].cells[midCell - 1].setAttribute("active", "true");
            pen.draw(grid.rows[1].cells[midCell - 1], shape);
            grid.rows[0].cells[midCell - 1].setAttribute("active", "true");
            pen.draw(grid.rows[0].cells[midCell - 1], shape);
            return 4;
            break;
        } //done
        case 5: {
            grid.rows[0].cells[midCell].setAttribute("active", "true");
            pen.draw(grid.rows[0].cells[midCell], shape);
            grid.rows[1].cells[midCell].setAttribute("active", "true");
            pen.draw(grid.rows[1].cells[midCell], shape);
            grid.rows[1].cells[midCell + 1].setAttribute("active", "true");
            grid.rows[1].cells[midCell + 1].setAttribute("point", "true");
            pen.draw(grid.rows[1].cells[midCell + 1], shape);
            grid.rows[1].cells[midCell + 2].setAttribute("active", "true");
            pen.draw(grid.rows[1].cells[midCell + 2], shape);
            return 4;
            break;
        } //done
        case 6: {
            grid.rows[0].cells[midCell].setAttribute("active", "true");
            pen.draw(grid.rows[0].cells[midCell], shape);
            grid.rows[1].cells[midCell].setAttribute("active", "true");
            pen.draw(grid.rows[1].cells[midCell], shape);
            grid.rows[1].cells[midCell - 1].setAttribute("active", "true");
            grid.rows[1].cells[midCell - 1].setAttribute("point", "true");
            pen.draw(grid.rows[1].cells[midCell - 1], shape);
            grid.rows[1].cells[midCell - 2].setAttribute("active", "true");
            pen.draw(grid.rows[1].cells[midCell - 2], shape);

            return 4;
            break;
        } //done
    }
}
function stopUnit() {
    for (var i = 0; i < size; i++) {
        for (var j = 0; j < size; j++) {
            var currcell = grid.rows[i].cells[j];
            var cellRow = currcell.parentNode.rowIndex;
            var cellCol = currcell.cellIndex;

            if (currcell.getAttribute("active") == "true") {
                pen.remove(currcell);
                currcell.setAttribute("active", "false");
                currcell.setAttribute("point", "false");
                grid.rows[cellRow - 1].cells[cellCol].setAttribute("static", "true");
                pen.draw(grid.rows[cellRow - 1].cells[cellCol], shape);

            }

        }
    }
}
function correctMoved(dir, moveArr, point) {
    var firstTime = true;
    for (var i = 0; i < moveArr.length; i++) {
        var currcell = moveArr[i];
        var cellRow = currcell.parentNode.rowIndex;
        var cellCol = currcell.cellIndex;
        //alert("row: " + cellRow + " col: " + cellCol);


        pen.remove(currcell);
        var nextCell;
        if (dir == "R") {
            nextCell = grid.rows[cellRow].cells[cellCol - 1];
        }

        else if (dir == "L") {
            nextCell = grid.rows[cellRow].cells[cellCol + 1];
        }
        if (firstTime) {
            removeFromArray(moveArr);
        }
        firstTime = false;
        if (currcell == point) {
            currcell.setAttribute("point", "false");
            nextCell.setAttribute("point", "true");
        }
        nextCell.setAttribute("active", "true");
        pen.draw(nextCell, shape);
    }

}
function removeFromArray(moveArr) {
    for (var i = 0; i < moveArr.length; i++) {
        var currcel = moveArr[i];
        currcel.setAttribute("active", "false");
    }
}
function rotateRight(dir) {
    var oriantPoint;
    var rotatible = true;
    for (var i = 0; i < size; i++) {
        for (var j = 0; j < size; j++) {
            var currCell = grid.rows[i].cells[j];
            if (currCell.getAttribute("active") == "true") {
                currCell.setAttribute("active", "false");
                pen.remove(currCell);
            }
            if (currCell.getAttribute("point") == "true") {
                var oriantPoint = currCell;
            }

        }

    }
    var cellRow = oriantPoint.parentNode.rowIndex;
    var cellCol = oriantPoint.cellIndex;
    if (checkPerimiter(oriantPoint) == true && rotatible) {
        faze = (faze + 1) % 4;
        //if (dir == "R") {
        //    faze = (faze + 1) % 4;
        //}
        //else if (dir == "L") {
        //    faze = (Math.abs(faze - 1))% 4;
        //}

    }
    switch (shape) {
        case 0: {
            switch (faze) {
                case 0: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol + 1], shape);
                    grid.rows[cellRow].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol - 1], shape);
                    break;
                }
                case 1: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol - 1], shape);
                    grid.rows[cellRow + 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol - 1], shape);
                    break;
                }
                case 2: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol + 1], shape);
                    grid.rows[cellRow + 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol], shape);
                    grid.rows[cellRow + 1].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol - 1], shape);
                    break;
                }
                case 3: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol + 1], shape);
                    grid.rows[cellRow + 1].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol + 1], shape);
                    grid.rows[cellRow - 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol], shape);


                    break;
                }
            }
            break;
        } //done
        case 1: {
            switch (faze) {
                case 0: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol + 1], shape);
                    grid.rows[cellRow].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol - 1], shape);
                    grid.rows[cellRow - 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol], shape);
                    break;

                }
                case 1: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol], shape);
                    grid.rows[cellRow + 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol + 1], shape);
                    break;
                }
                case 2: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol + 1], shape);
                    grid.rows[cellRow].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol - 1], shape);
                    grid.rows[cellRow + 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol], shape);
                    break;
                }
                case 3: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol], shape);
                    grid.rows[cellRow + 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol - 1], shape);

                    break;
                }
            }
            break;
        } //done
        case 2: {
            switch (faze) {
                case 0: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow - 2].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 2].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol], shape);
                    grid.rows[cellRow + 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol], shape);
                    break;
                }
                case 1: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol + 1], shape);
                    grid.rows[cellRow].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol - 1], shape);
                    grid.rows[cellRow].cells[cellCol - 2].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol - 2], shape);
                    break;
                }
                case 2: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow + 2].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 2].cells[cellCol], shape);
                    grid.rows[cellRow + 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol], shape);

                    break;
                }
                case 3: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol + 1], shape);
                    grid.rows[cellRow].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol - 1], shape);
                    grid.rows[cellRow].cells[cellCol + 2].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol + 2], shape);
                    break;
                }
            }
            break;

        } //done
        case 3: {
            switch (faze) {
                case 0: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol - 1], shape);
                    grid.rows[cellRow].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol + 1], shape);

                    break;
                }
                case 1: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol - 1], shape);
                    grid.rows[cellRow + 1].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol - 1], shape);
                    break;
                }
                case 2: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow + 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol], shape);
                    grid.rows[cellRow + 1].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol + 1], shape);
                    grid.rows[cellRow].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol - 1], shape);
                    break;
                }
                case 3: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow + 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol + 1], shape);
                    grid.rows[cellRow - 1].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol + 1], shape);
                    break;
                }
            }
            break;
        } //done
        case 4: {
            grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
            grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
            pen.draw(grid.rows[cellRow].cells[cellCol], shape);
            grid.rows[cellRow].cells[cellCol - 1].setAttribute("active", "true");
            pen.draw(grid.rows[cellRow].cells[cellCol - 1], shape);
            grid.rows[cellRow + 1].cells[cellCol - 1].setAttribute("active", "true");
            pen.draw(grid.rows[cellRow + 1].cells[cellCol - 1], shape);
            grid.rows[cellRow + 1].cells[cellCol].setAttribute("active", "true");
            pen.draw(grid.rows[cellRow + 1].cells[cellCol], shape);


            break;
        } //done
        case 5: {
            switch (faze) {
                case 0: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol + 1], shape);
                    grid.rows[cellRow].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol - 1], shape);
                    grid.rows[cellRow - 1].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol - 1], shape);

                    break;
                }
                case 1: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol], shape);
                    grid.rows[cellRow + 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol], shape);
                    grid.rows[cellRow + 1].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol - 1], shape);
                    break;
                }
                case 2: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol - 1], shape);
                    grid.rows[cellRow].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol + 1], shape);
                    grid.rows[cellRow + 1].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol + 1], shape);

                    break;
                }
                case 3: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol], shape);
                    grid.rows[cellRow + 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol + 1], shape);
                    break;
                }
            }
            break;
        } //done
        case 6: {
            switch (faze) {
                case 0: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol + 1], shape);
                    grid.rows[cellRow].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol - 1], shape);
                    grid.rows[cellRow - 1].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol + 1], shape);
                    break;
                }
                case 1: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow + 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol - 1], shape);
                    break;
                }
                case 2: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol + 1], shape);
                    grid.rows[cellRow].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol - 1], shape);
                    grid.rows[cellRow + 1].cells[cellCol - 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol - 1], shape);
                    break;
                }
                case 3: {
                    grid.rows[cellRow].cells[cellCol].setAttribute("active", "true");
                    grid.rows[cellRow].cells[cellCol].setAttribute("point", "true");
                    pen.draw(grid.rows[cellRow].cells[cellCol], shape);
                    grid.rows[cellRow + 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol], shape);
                    grid.rows[cellRow - 1].cells[cellCol].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow - 1].cells[cellCol], shape);
                    grid.rows[cellRow + 1].cells[cellCol + 1].setAttribute("active", "true");
                    pen.draw(grid.rows[cellRow + 1].cells[cellCol + 1], shape);
                    break;
                }
            }
            break;
        } //done
    }
}
function checkPerimiter(oriantPoint) {
    var oriantCol = oriantPoint.cellIndex;
    var oriantRow = oriantPoint.parentNode.rowIndex;
    for (var i = 0; i < size; i++) {
        for (var j = 0; j < size; j++) {
            var currCell = grid.rows[i].cells[j];
            var cellRow = currCell.parentNode.rowIndex;
            var cellCol = currCell.cellIndex;

            var staticCell = false;
            if (currCell.getAttribute("static") == "true") {
                staticCell = true;
            }
            var colRange;
            var rowRange;
            var hrizontBorder;
            if (shape == 2) {
                colRange = (cellCol >= oriantCol - 2) && (cellCol <= oriantCol + 2);
                rowRange = (cellRow >= oriantRow - 2) && (cellRow <= oriantRow + 2);
                hrizontBorder = oriantCol < 2 || oriantCol > size - 3;
            }
            else {
                colRange = (cellCol >= oriantCol - 1) && (cellCol <= oriantCol + 1);
                rowRange = (cellRow >= oriantRow - 1) && (cellRow <= oriantRow + 1);
                hrizontBorder = oriantCol == 0 || oriantCol == size - 1;
            }

            if (staticCell && colRange && rowRange || oriantRow == size - 1 || hrizontBorder) {
                return false;

            }
        }
    }
    return true;
}