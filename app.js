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