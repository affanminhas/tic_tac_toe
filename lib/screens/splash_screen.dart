import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/app_dashboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToDashboard();
  }

  _navigateToDashboard()async{
    await Future.delayed(const Duration(milliseconds: 5000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashBoard()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            //color: const Color(0xFF0D47A1),
            width: 432,
            height: 435,
            decoration: const BoxDecoration(
                color: Color(0xFF0D47A1),
                // borderRadius: BorderRadius.only(
                //     topRight: Radius.circular(50), topLeft: Radius.circular(50))),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 66, left: 90, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "K A T I   Z E R O",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 17.29),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: circleWhiteImage(),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF42A5F5)
                        ),
                      ),
                      const SizedBox(
                        width: 14.68,
                      ),
                      Container(
                          child: circleWhiteImage(),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF42A5F5)
                        ),
                      ),
                      const SizedBox(
                        width: 14.68,
                      ),
                      crossWhiteImage()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: circleWhiteImage(),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFF42A5F5)),
                      ),
                      const SizedBox(
                        width: 14.68,
                      ),
                      crossWhiteImage(),
                      const SizedBox(
                        width: 14.68,
                      ),
                      crossWhiteImage()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            //color: const Color(0xFF0D47A1),
            width: 432,
            height: 487,
            decoration: const BoxDecoration(
                color: Color(0xFF42A5F5),
                // borderRadius: BorderRadius.only(
                //     bottomRight: Radius.circular(50),
                //     bottomLeft: Radius.circular(50))),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      crossBlueImage(),
                      const SizedBox(
                        width: 14.68,
                      ),
                      circleBlueImage(),
                      const SizedBox(
                        width: 14.68,
                      ),
                      circleBlueImage()
                    ],
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Text(
                    "POWERED BY",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 55),
                  child: Text(
                    "T E C H   I D A R A",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF0D47A1),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
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

  Widget circleBlueImage() {
    return const Image(
      image: AssetImage("images/circle_blue.png"),
    );
  }

  Widget crossBlueImage() {
    return const Image(
      image: AssetImage("images/cross_blue.png"),
    );
  }
}
