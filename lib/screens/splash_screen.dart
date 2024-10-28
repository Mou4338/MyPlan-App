import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/onboarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
        alignment: Alignment.center,
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
              top: animate? 130: -110,
              right:45,
              left: 45,
              child: AnimatedOpacity(opacity: animate? 1: 0, duration: const Duration(milliseconds: 1000),
              child: Image(
                  image: AssetImage('assets/images/splash_screen/3.png')))),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              top: 155,
              left: 0,
              right: 0,
              bottom: animate? 30:-240,
              child: AnimatedOpacity(opacity: animate? 1: 0, duration: const Duration(milliseconds: 1000),
              child: Image(
                image: AssetImage('assets/images/splash_screen/1.png')))),
            textline(),
        ],
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      animate = true;
    });
    await Future.delayed(Duration(milliseconds: 10000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
  }
}

class textline extends StatefulWidget {
  const textline({super.key});

  @override
  State<textline> createState() => _textlineState();
}

class _textlineState extends State<textline> {
  bool animate = false;

   @override
  void initState() {
    super.initState();
    StartAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 4000),
              top: 575,
              right: 57,
              left: 57,
              child: AnimatedOpacity(opacity: animate? 1: 0, duration: const Duration(milliseconds: 4000),
              child: Text('Plan Your Day Wisely',style: GoogleFonts.arima(
                textStyle: TextStyle(color: Colors.black),
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
              ))
              )
    );
  }
  void StartAnimation() async {
    await Future.delayed(Duration(milliseconds: 3000));
    setState(() {
      animate = true;
    });
  }
}