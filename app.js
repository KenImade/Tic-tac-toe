// Need a the following
// a gameboard - a module
// display - a module
// players - factory

const Gameboard = (() => {

    let board = ["","","","","","","",""];

    const placeMarker = (position, marker) => {
        board[position] = marker;
    }

    const resetBoard = () => {
        for (let i = 0; i < board.length; i++) {
            board[i] = "";
        }
    }

    return {
        placeMarker,
        resetBoard
    };
})();

const Player = (marker) => {
    this.marker = marker;

    const getMarker = () => {
        return marker;
    };

    return {
        getMarker
    };
};

const displayController = (() => {
    const fieldElements = document.querySelectorAll(".field");
    const restartBtn = document.getElementsByClassName("restart-btn");

    fieldElements.forEach((field) => {
        field.addEventListener("click", (e) => {
            if (gameController.isOver() || e.target.textContent !== "") return;
            gameController.playRound(parseInt(e.target.dataset.index));
            updateGameBoard();
        })
    });

    restartBtn.addEventListener("click", (e) => {
        Gameboard.resetBoard();
        gameController.reset();
        updateGameBoard();
    });

    const updateGameBoard = () => {
        for (let i = 0; i < fieldElements.length; i++) {
            fieldElements[i].textContent = Gameboard.getField(i);
        }
    };
})();