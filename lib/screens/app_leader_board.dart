import 'package:flutter/material.dart';

import '../utils/app_score_data.dart';

class LeaderBoard extends StatefulWidget {
  late List<String> winPlayerName;
  LeaderBoard({required this.winPlayerName});

  @override
  _LeaderBoardState createState() => _LeaderBoardState(winPlayerName);
}

class _LeaderBoardState extends State<LeaderBoard> {
  late List<String> winPlayerName;
  List<WinPlayer> player = [];

  _LeaderBoardState(this.winPlayerName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 25,
                  )),
              const SizedBox(
                width: 26,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "L E A D E R",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color(0xFF0D47A1)),
                  ),
                  Text(
                    "B O A R D",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Color(0xFF0D47A1)),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                // itemCount: player.length,
                itemCount: winPlayerName.length,
                itemBuilder: updateList
            ),
          )
        ],
      ),
    );
  }

  Widget updateList(BuildContext context, int index){
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 9),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListTile(
            // leading: player[index].playerName == "Player 1"? circleBlueImage() : crossBlueImage(),
            leading: winPlayerName[index] == "Player 1"? circleSkyBlueImage() : crossBlueImage(),
            // title: Text(player[index].playerName),
            title: Text(winPlayerName[index], style: const TextStyle(
              fontSize: 20,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600
            ),),
            trailing: Image.asset("images/trophy_icon_leader.jpg"),

          ),
        ),
      ),
    );
  }

  Widget crossBlueImage() {
    return const Image(
      image: AssetImage("images/cross_blue.png",),
      width: 36,
      height: 36,
    );
  }

  Widget circleSkyBlueImage() {
    return const Image(
      image: AssetImage("images/circle_sky_blue.png"),
      width: 40,
      height: 40,
    );
  }
}
