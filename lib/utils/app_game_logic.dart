class Player{
  static const player_1 = "O";
  static const player_2 = "X";
  static const empty= "";
}

class Game{
  static final boardLenght = 9;  // --- Board length means 3*3 ka board hoga
  static final blockSize = 50.0;

  List<String>? board;
  static List<String>? initGameBoard() => List.generate(boardLenght, (index) => Player.empty);

  bool gameWinner(String player, int index, List<int> scoreBoard, int gridSize){

    int row = index ~/ 3;
    int column = index % 3;
    int score = player == "X"? 1 : -1;

    scoreBoard[row] += score;
    scoreBoard[column + gridSize] += score;

    if (row == column) {
      scoreBoard[2 * gridSize] += score;
    }
    if (gridSize - 1 - column == row){
      scoreBoard[2 * gridSize + 1] += score;
    }
    if (scoreBoard.contains(3) || scoreBoard.contains(-3)){
      return true;
    }
    // --- Default ---
    return false;
  }

}
