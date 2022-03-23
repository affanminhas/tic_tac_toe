import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/app_leader_board.dart';
import 'package:tic_tac_toe/utils/app_game_logic.dart';
import 'package:tic_tac_toe/utils/app_score_data.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<WinPlayer> player = [];
  List<String> winPlayerName = [];
  String lastValue = "O";
  String playerWin = "Player 1";
  bool gameOver = false;
  int turn = 0;
  String gameResult = "";
  List<int> scoreBoard = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ]; // --- 3 row, 3 column, 2 diagonal ban sakty hain ---

  Game game = Game();

  @override
  void initState() {
    // TODO: implement initState
    // lastValue = circleSkyBlueImage();
    game.board = Game.initGameBoard();
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 85,
                height: 85,
                child: circleWhiteImage(),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                    color: const Color(0xFF42A5F5)),
              ),
              const SizedBox(
                width: 28,
              ),
              const Text(
                "VS",
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFDBDBDB)),
              ),
              const SizedBox(
                width: 28,
              ),
              Container(
                width: 85,
                height: 85,
                child: crossWhiteImage(),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                    color: const Color(0xFF0D47A1)),
              ),
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Player 1",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF656565)),
              ),
              SizedBox(
                width: 100,
              ),
              Text(
                "Player 2",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF656565)),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              width: boardWidth,
              height: boardWidth,
              child: GridView.count(
                crossAxisCount: Game.boardLenght ~/ 3,
                // use to divide and it returns integer value
                padding: const EdgeInsets.all(30),
                mainAxisSpacing: 8,
                // --- x-axis may space dega sab kay darmian
                crossAxisSpacing: 8,
                // --- y-axis may space dega
                children: List.generate(Game.boardLenght, (index) {
                  return InkWell(
                    onTap: gameOver
                        ? null
                        : () {
                            if (game.board![index] == "") {
                              setState(() {
                                game.board![index] = lastValue;
                                turn++;
                                gameOver = game.gameWinner(
                                    lastValue, index, scoreBoard, 3);
                                if (gameOver) {
                                  // --- Winner ko dikhana hay ---
                                  gameResult = lastValue;
                                  if (lastValue == "O") {
                                    playerWin = "Player 1";
                                  } else {
                                    playerWin = "Player 2";
                                  }
                                  // --- Updating leader board ---

                                  winPlayerName.add(playerWin);
                                  // setState(() {
                                  //   player.add(WinPlayer(playerWin));
                                  // });

                                  // --- Showing dialog box for winner ---
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 180,
                                              left: 30,
                                              right: 30,
                                              bottom: 180),
                                          child: Material(
                                            type: MaterialType.transparency,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: const Color(0xFF0D47A1)),
                                              padding: const EdgeInsets.all(5),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.85,
                                              height: 200,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    height: 41,
                                                  ),
                                                  Image.asset(
                                                    "images/trophy.jpg",
                                                  ),
                                                  const SizedBox(
                                                    height: 18,
                                                  ),
                                                  Text(
                                                    playerWin,
                                                    style: const TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white),
                                                  ),
                                                  const Text(
                                                    "WON",
                                                    style: TextStyle(
                                                        fontSize: 40,
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                }else if(!gameOver && turn == 9){
                                  gameOver = true;
                                  showDialog(context: context, builder: (context){
                                    return Material(
                                      type: MaterialType.transparency,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 180, left: 40, right: 40, top: 180),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color: const Color(0xFF0D47A1)
                                          ),
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 40,),
                                              drawGame(),
                                              const SizedBox(height: 40,),
                                              const Text(
                                                "Game Tie!",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  fontFamily: "Poppins",
                                                  color: Colors.white
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                                }
                                if (lastValue == "X") {
                                  lastValue = "O";
                                } else {
                                  lastValue = "X";
                                }
                              });
                            }
                          },
                    child: Container(
                      width: Game.blockSize,
                      height: Game.blockSize,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Container(
                        child: Text(
                          game.board![index],
                          style: TextStyle(
                              color: game.board![index] == "X"
                                  ? const Color(0xFF0D47A1).withOpacity(1.0)
                                  : const Color(0xFF42A5F5).withOpacity(1.0),
                              fontFamily: "VarelaRound",
                              fontWeight: FontWeight.w900,
                              fontSize: 70),
                        ),
                      )),
                    ),
                  );
                }),
              )),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: GestureDetector(
                  onTap: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => LeaderBoard()));
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LeaderBoard(winPlayerName: winPlayerName,)));
                  },
                  child: Container(
                    width: 208,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D47A1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("images/Line 5.png"),
                              const SizedBox(
                                height: 5,
                              ),
                              Image.asset("images/Line 6.png"),
                              const SizedBox(
                                height: 5,
                              ),
                              Image.asset("images/Line 7.png"),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: Text(
                            "Leader Board",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        game.board = Game.initGameBoard();
                        lastValue = "O";
                        gameOver = false;
                        turn = 0;
                        gameResult = "";
                        scoreBoard = [0, 0, 0, 0, 0, 0, 0, 0];
                      });
                    },
                    icon: Image.asset("images/replay.png")),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget circleWhiteImage() {
    return const Image(
      image: AssetImage("images/circle_white.png"),
    );
  }

  Widget crossWhiteImage() {
    return const Image(
      image: AssetImage("images/cross_white.png"),
    );
  }

  Widget crossBlueImage() {
    return const Image(
      image: AssetImage("images/cross_blue.png"),
    );
  }

  Widget circleSkyBlueImage() {
    return const Image(
      image: AssetImage("images/circle_sky_blue.png"),
    );
  }
  Widget drawGame() {
    return const Image(
      image: AssetImage("images/game_draw.png"),
      width: 200,
      height: 200,
    );
  }
}
