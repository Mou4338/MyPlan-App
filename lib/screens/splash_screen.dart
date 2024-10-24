import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/welcomepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
               top: 0,
               bottom: 0,
               left: -50,
               right:-50,
              child: Image(
                  image: AssetImage('assets/images/splash_screen/2.png'))),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              right: animate? 15: -175,
              bottom:90,
              left: 15,
              child: Image(
                  image: AssetImage('assets/images/splash_screen/3.png'))),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              top: 35,
              right: animate? 0: -160,
              left: -40,
              child: Image(
                  image: AssetImage('assets/images/splash_screen/6.png'))),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              top: 55,
              left: animate? -10:-170,
              right: -30,
              child: Image(
                  image: AssetImage('assets/images/splash_screen/5.png'))),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              top: 55,
              left: animate?-10: -170,
              right: -30,
              child: Image(
                  image: AssetImage('assets/images/splash_screen/4.png'))),
              AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              top: 35,
              left: animate? 0: -160,
              right: -40,
              child: Image(
                  image: AssetImage('assets/images/splash_screen/7.png'))),
              AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              bottom:0,
              right: animate? 0: -160,
              left: -40,
              child: Image(
                  image: AssetImage('assets/images/splash_screen/8.png'))),
        ],
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(Duration(milliseconds: 15000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Accountpage()));
  }
}
