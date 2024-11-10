import 'package:MyPlan/pages/homepage.dart';
import 'package:MyPlan/pages/loginpage.dart';
import 'package:MyPlan/pages/signuppage.dart';
import 'package:MyPlan/screens/onboarding_screen.dart';
import 'package:MyPlan/screens/splash_screen.dart';
import 'package:MyPlan/theme/theme.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final savedTheme=await AdaptiveTheme.getThemeMode();
  runApp( MyApp(savedTheme: savedTheme,));
}

class MyApp extends StatefulWidget {
  final AdaptiveThemeMode? savedTheme;
  const MyApp({super.key, this.savedTheme});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(initial:widget.savedTheme?? AdaptiveThemeMode.system,
    light: AppTheme.lightTheme,
    dark: AppTheme.darkTheme,
    builder: (light, dark) => 
     MaterialApp(
        theme: light,
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash':(context)=> SplashScreen(),
          '/onboard':(context)=>OnboardingScreen(),
          '/login':(context)=> loginPage(),
          '/signup':(context)=>Signuppage(),
          '/home': (context) => HomePage(),
     },
    ),
   );
  }
}