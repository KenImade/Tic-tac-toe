// Need a the following
// a gameboard - a module
// display - a module
// players - factory

const gameBoard = (() => {

    let board = ["","","","","","","","",""];

    const getBoardPosition = (input) => {
        let value = parseInt(input)
        return value - 1;
    };

    const updateBoard = (input) => {
        let playerChoice = parseInt(input);

        if (checkPosition(playerChoice)) {
            let pos = getBoardPosition(playerChoice);
            board[pos] = marker;
        } else {
            return false;
        }
    };

    const checkPosition = (num) => {
        let pos = getBoardPosition(num);

        if (board[pos] === "") {
            return true;
        } else {
            return false;
        }
    };

    const getBoard = () => {
        return board;
    };

    return {
        updateBoard,
        getBoard,
    };
})();

const Player = (playerName, marker) => {
    const getName = () => playerName;
    const getMarker = () => marker;

    return {
        getName,
        getMarker
    };
};