import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingScreen extends StatefulWidget {
   OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = LiquidController();
    int currentpage = 0;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(alignment: Alignment.center, children: [
        LiquidSwipe(
          pages: [
            Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Stack(children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Image(
                            image: AssetImage(
                                'assets/images/onboarding_screen/on2.png')),
                      ),
                      Positioned(
                        top: 10,
                        left: 0,
                        right: 0,
                        child: Image(
                            image: AssetImage(
                                'assets/images/onboarding_screen/on1.png')),
                      ),
                      Positioned(
                          top: -8,
                          left: 3,
                          right: 222,
                          child: Image(
                              image: AssetImage(
                                  'assets/images/splash_screen/5.png'))),
                    ]),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 330.0,
                          ),
                          Column(
                            children: [
                              Text('Task To Do',
                                  style: GoogleFonts.archivoBlack(
                                    textStyle: TextStyle(color: Colors.black),
                                    fontSize: 30.0,
                                  )),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Add and organize your tasks to keep a track of them',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(color: Colors.black),
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 35.0,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Stack(children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Image(
                            image: AssetImage(
                                'assets/images/onboarding_screen/on4.png')),
                      ),
                      Positioned(
                        top: 25,
                        left: 22,
                        right: 22,
                        child: Image(
                            image: AssetImage(
                                'assets/images/onboarding_screen/on3.png')),
                      ),
                      Positioned(
                          top: -8,
                          left: 3,
                          right: 222,
                          child: Image(
                              image: AssetImage(
                                  'assets/images/splash_screen/5.png'))),
                    ]),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 320.0,
                          ),
                          Column(
                            children: [
                              Text('Progress Bar',
                                  style: GoogleFonts.archivoBlack(
                                    textStyle: TextStyle(color: Colors.black),
                                    fontSize: 30.0,
                                  )),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Check your progress on tasks',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(color: Colors.black),
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 35.0,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Stack(children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Image(
                            image: AssetImage(
                                'assets/images/onboarding_screen/on6.png')),
                      ),
                      Positioned(
                        top: 20,
                        left: 12,
                        right: 12,
                        child: Image(
                            image: AssetImage(
                                'assets/images/onboarding_screen/on5.png')),
                      ),
                      Positioned(
                          top: -8,
                          left: 3,
                          right: 222,
                          child: Image(
                              image: AssetImage(
                                  'assets/images/splash_screen/5.png'))),
                    ]),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 330.0,
                          ),
                          Column(
                            children: [
                              Text('Time Tracker',
                                  style: GoogleFonts.archivoBlack(
                                    textStyle: TextStyle(color: Colors.black),
                                    fontSize: 30.0,
                                  )),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Track and check your time needed to complete the tasks',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(color: Colors.black),
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 35.0,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Stack(children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Image(
                            image: AssetImage(
                                'assets/images/onboarding_screen/on8.png')),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        right: 10,
                        child: Image(
                            image: AssetImage(
                                'assets/images/onboarding_screen/on7.png')),
                      ),
                      Positioned(
                          top: -8,
                          left: 3,
                          right: 222,
                          child: Image(
                              image: AssetImage(
                                  'assets/images/splash_screen/5.png'))),
                    ]),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 410.0,
                          ),
                          Column(
                            children: [
                              Text('Work Environment',
                                  style: GoogleFonts.archivoBlack(
                                    textStyle: TextStyle(color: Colors.black),
                                    fontSize: 30.0,
                                  )),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Create friendly and structured work environment by connecting with users',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(color: Colors.black),
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          ElevatedButton(
                          onPressed: () {
                          Navigator.pushNamed(context, '/account');},
                          child: Text('Sign up'),
                          ),
                          SizedBox(
                          width: 40,
                           ),
                           ElevatedButton(
                           onPressed: () {
                           Navigator.pushNamed(context, '/account');},
                           child: Text('Sign in'),
                            ),
                          ],
                         ),
                         SizedBox(
                          height: 15,
                         ),
                        ],
                      ),
                    )
                  ],
                )),
          ],
          liquidController: controller,
          onPageChangeCallback: OnPageChangeCallback,
          slideIconWidget: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        Positioned(
            top: 30,
            right: 10,
            child: TextButton(
                onPressed: ()=> controller.jumpToPage(page: 3),
                child: Text("Skip",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(color: Colors.black))))),
        Positioned(
            bottom: 25,
            child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage,count: 4,
                effect:
                WormEffect(activeDotColor: Colors.blue, dotHeight: 5.0)))
      ]),
    );
  }

  void OnPageChangeCallback(int activePageIndex) {
    setState(() {
      currentpage = activePageIndex; 
    });
  }
}
